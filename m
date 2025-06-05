Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 370BCC5B543
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 18:40:52 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60DA10E314;
	Thu,  5 Jun 2025 18:40:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="P/y782CE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC7410E314
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Jun 2025 18:40:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749148844; x=1780684844;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ZEDzGPv8j8X3P+JVqJpoEagjc914NdbiriWLHosg/44=;
 b=P/y782CEj89HunlgW49UhNyFDuF2vFu8s1Xg/SWr8nmYViWr5jghP0iH
 evHrtgI6RnZ1FI0yN4WumAAj2RShwJ8X69Iz+DOA30FATsoe/4EzEEPHT
 3EKpRfWmdDG6IoYjL9E2WkJ/Fz6cUly9E7djCNnCu+ysiKcO+YeyKSHcF
 rkxl1RXzZKSA6Ew3p2e2yCHV1qCu1LB9YKXzRnEMt5StimTsieuUt+bLk
 h8LA85/INrCPTiHqN18mhvQxO6n5OZ2RNQYnGkKiXnifc68Bupafgopjz
 S7fP7RYAXjEFVfwlVNp2yVrHQ6DuF+OLlDn2IvDc6HndIrpwnVEXjtVR7 g==;
X-CSE-ConnectionGUID: lKOmGjyVR/uKAADZxGuAoA==
X-CSE-MsgGUID: KBhXG0EqQZSSCgah0t09ng==
X-IronPort-AV: E=McAfee;i="6800,10657,11455"; a="54950619"
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="54950619"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:40:43 -0700
X-CSE-ConnectionGUID: 9lbCjox3Swij8R//qC/Ekw==
X-CSE-MsgGUID: aXjze6k4TJeojldSuGLrVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,212,1744095600"; d="scan'208";a="150854944"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Jun 2025 11:40:44 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 5 Jun 2025 11:40:43 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 5 Jun 2025 11:40:43 -0700
Received: from NAM02-SN1-obe.outbound.protection.outlook.com (40.107.96.67) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Thu, 5 Jun 2025 11:40:43 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TmmHoeg68j1cFyKvc5SKq74F1zbuPgAitzd7r0B+ux3VPP5jv8nMkghyxANUfamqpWoBipvTmkx4jq8CtkhTcf+7+wKeV+CtTy1X0K3VuQFllnYgx8muYhw26E4hdTYJreV4G1+0iaskNOJfDh19qkH8Q95wKRmoTbHIDTYSwa3Lur8cIA2fraqcf7u+mYSaneWg4qr0AJPtHDCrM4QnkT1hv/Dwc+QnWOlnNtUalZ85D9s0Lzs/L2A4/2Noj0z6TapX0fLBZHRZ3kyY8C7wlTzSIaxFVMyObtrOgDoY1RZ6uXU7qwwYrtFkFyTEh7/fU6C4LA5QoWhFO8T00FXdTQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iVYCDxO8Xl0qIQvsLPRiT9YE7jmN0FaZSKN+OI4sHlk=;
 b=xLm/T3yG8AdrFEWaUcx0xw9Fd0lUizj4KX4z00rtL7Wb7wIPrxKn8YyE6wBCG/iYyINYsSddWIVNKlW6beOTiSB9JkDy2xtri/BEmn6lrCesydZi1gRVBD9t4gzzTPB9+pbrIdUimpESTZmoBNoqHe/9k5roml3WzFerGI6/oAeSkjDEPGuZAiuS8mDhKyuCmp1Rhu+aHSznPGoEGAZR01DcX5/46QhcJkWCWlOkz/tA54KfBLZg1pAb0GY1/Qirah4gHpDEGGDm3oEIHUw1ci0n2LkDVTpRI7ioOvbxCzlmsdL2m3wyNstv4CCO24qNWBVqcT3NRZcH5hU6m+Pwlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by MN0PR11MB5963.namprd11.prod.outlook.com (2603:10b6:208:372::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8792.34; Thu, 5 Jun
 2025 18:40:40 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8813.018; Thu, 5 Jun 2025
 18:40:40 +0000
Date: Thu, 5 Jun 2025 11:40:38 -0700
From: Matt Roper <matthew.d.roper@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>,
 <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 2/6] drm/xe/xe3: Add support for graphics IP version 30.03
Message-ID: <20250605184038.GJ6239@mdroper-desk1.amr.corp.intel.com>
References: <20250603182430.1016734-1-dnyaneshwar.bhadane@intel.com>
 <20250603182430.1016734-3-dnyaneshwar.bhadane@intel.com>
 <5daf91d2-f86d-4740-b39f-e605deea6620@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <5daf91d2-f86d-4740-b39f-e605deea6620@intel.com>
X-ClientProxiedBy: SJ0PR13CA0010.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::15) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|MN0PR11MB5963:EE_
X-MS-Office365-Filtering-Correlation-Id: 0af83e29-d991-41fb-9239-08dda46078a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?LugPhLgRAlECjDZvcWO07IBgjbwYnuSepKRrWzZi42sqDplXEwj9aR3zPD/l?=
 =?us-ascii?Q?o9xtMkPt9CSgRhzT5rxH44WX/q+plyya2YWumGuitsWHk3APjzUUpt4ERGB1?=
 =?us-ascii?Q?tt0TPlrQUEyWti8yfCCUikRES4iYPL6Ndu8WE0wOYG7st04bWJY/ETHiBNAo?=
 =?us-ascii?Q?j720KrX7sGHtHConlZyzoLo09oAB4AjnuEXNNqc/yoZfHZ8eWy6iId6UXltx?=
 =?us-ascii?Q?FdNuU3kxo5OnAy5roCx1ooN84IxcOix6+kPjlmw3vvOnieAYIyYBjuDBsF2h?=
 =?us-ascii?Q?tQguKy6Yzr7zBuG20unNR5c6OnHDTBhtzWEKFdEKD3/GAvWXfB0ShWWqyGsB?=
 =?us-ascii?Q?Oe831vahdaKSoz21vszlZdEyg/jrQhSf8MQxEBKoOgIUvwjPAIHIcBukFUz8?=
 =?us-ascii?Q?HE43CkV1scWIjMxaDpA3eIvFc/ek0hMsSBlX5XUnTgBgXAWmkrzQQiEQ92xW?=
 =?us-ascii?Q?w3JuqoiSa/zKM5wATA1sQath+LDasHtYDjhKNvFfRMXqRnTamMqEPn5+trvD?=
 =?us-ascii?Q?AXy30G4Pbq5TBMYuy6GbM4A8/1YlKYYL6aycoi9O1xxTHz27UxKt7AxkXPxL?=
 =?us-ascii?Q?1plr6JqtMGdlhDTsQPud+bEZlZeHFPaWFhHR28ThuZCKEglufskPyHW3BC3p?=
 =?us-ascii?Q?FpZAUCuTnEUIzdioVC+1JGW+Ij7ngtKtd/veShrcLtraDlAmSqHEgIiKnFNf?=
 =?us-ascii?Q?JQxNWOHNkZOGJDAkt/dJC78ts3Vlg/kPGu6LaEzOQL1fgUhk521BZbH1lbh+?=
 =?us-ascii?Q?iCH9vsc8qv+FGHt605wVohJ+/HNJC0f0Dbq8z9Ujam9eWI0kbGijSi/8RTkv?=
 =?us-ascii?Q?tmyfwH2Eyf8b3Jze8PVOoeJpbnTDi91f89/1Yna/b5JcZG8EV22GD8lTcdf+?=
 =?us-ascii?Q?Mr0yfIlShVSiycwSm8BRff3n66Xb534ID47GRhI8zR715jVvbDa4lyOkS6bP?=
 =?us-ascii?Q?zba5mJ2ODgsoN3n3aKj2/rDGZ1BNsSxecxJhdqCxXDcsdL2HKb9c9fitwzE2?=
 =?us-ascii?Q?cWbyQfmrrHtln7Hlc5V4stK3MvVoZ2DARqJzfMnEDl3Zu4Aj+/e3p9h+RKZx?=
 =?us-ascii?Q?du+d1STEdBar3sevovCTTU3R7hz+nWlzwfZihowoy68GNMhuxXkCKGLrHZj4?=
 =?us-ascii?Q?/Gz3BdSZ68xQkyYiZLBHujvMg25F64mgN0SS4A7B+Dn4zuCJw1O+u2CqkpLf?=
 =?us-ascii?Q?C/J8cHTGDrkty0GXkXxXM+vDN9IkqrjvmYpJGLeiz8Pe/FuNDlQ+P0fgTTc/?=
 =?us-ascii?Q?bCiV/9M0SFkHkNvRhUUHIplU+uLaDlplio6rRWjK1LbVRoxJXiOanVo/2H/N?=
 =?us-ascii?Q?5Nuk2u45kJT7IAv4aAfswYzeBXVUc3jGW5dmZbTeq68sB+jnjmnnt7uh6TsC?=
 =?us-ascii?Q?Wek/KAQlqHfUaY93hDhv6r36rUxiQbjgr+IGfJrme0SQ7F7Dpc10YXHMwAnQ?=
 =?us-ascii?Q?7gK4nfVWhM8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?g6R192KPnl0iDfkebW/wYB4Gxu4WNEKYhbIujAdtu/Okfm1j4ViOMOQ1jOHI?=
 =?us-ascii?Q?WuGlcbXbF1jFnk50Km4MB2r9AirKCajnk34PKNm4LiOMPN4ymqmauusZ6Q11?=
 =?us-ascii?Q?nx327OVgKXPGgGZ0LEpn26mEdlD0UTKik183hClhf1lrWEMLSIrRb5ePNWLD?=
 =?us-ascii?Q?CSRYxVxpPHAzjDQx6YJ0W8QHvRI1ag3GmTOaaT6PZx26joaxs7bb9+XU3T/F?=
 =?us-ascii?Q?LYfiYjUG1+3pseRV1rctMrnn9dG0AhsCl+ylj+4exmEA8j86RFXqYZULrmpH?=
 =?us-ascii?Q?w7rvqY6/8NCYQglfpz1UhO8UC+avBuQcEU3MWWAN8xgY0lbmniKEFEkJr/YO?=
 =?us-ascii?Q?6LV5Bt9ycnbMHgMXSxBLSeSGHSbS92D3YnYVM/xLm07I6lkukJewOZ3kFC2f?=
 =?us-ascii?Q?+ud4zGJs9ohsQe72YBv0//GkKqbtj9DZomZTjR0mXroMNkLR5L6n4uY/jgWx?=
 =?us-ascii?Q?AMALt/+KFByEk2yEEtVySxcp9n6dczA32+XjOKqYp+MfJB5xl2raGfFuxfYv?=
 =?us-ascii?Q?YFJtsTEO/5TqZoZ40y04bqzA4UuLKMu6ozBUcgojH5Hd4NRH6ZvPjTMw103C?=
 =?us-ascii?Q?BJom00Tqo0z6fLl8IlKjQe/HKu/6X+dEvQWp+K5TjsD9RRT37AEmfPx8mNMs?=
 =?us-ascii?Q?F7Rx4Tnzt+yvcchCQvF6ETk1UZ2QtgOfcRPyF1NngNQsTCj4PHCLUsUgUy8/?=
 =?us-ascii?Q?0dgizFgwYZUBOGhn23aSu3jfGXS6k83h60lU+NxqrVPU4PI+hSplV/fqErRz?=
 =?us-ascii?Q?Kf76OszIC5/NwyEm8/riGcVMVhd9aZDWd3Ku5YJ058vIyybNw8G+IoEBJCI2?=
 =?us-ascii?Q?sJeCcrtfZeNbYrUAVQWZgBy8InWlrYBY1Ib/tb1a7Lgcw0ae/h8OvawZlvP3?=
 =?us-ascii?Q?KCClh3Ula/wUQhXE60EzhEJ83bGm3FStkam0PEojPMNioyR6HpDdIcfAh7hE?=
 =?us-ascii?Q?pKXiZTMTTH899GwUGEoM/U3k6eHHfpsy8oSFKm27ZNxpmsuFYAjCgI5B8o4B?=
 =?us-ascii?Q?0AEnREa87qy2aXgGo1SNSyvQtPGvZrw3qyeCFcwQLvCnHI+EXM5H/emPDuOU?=
 =?us-ascii?Q?Pul8jmnaRkVckQqzHxmbuQ5Y0OK6yaWwhzKIgXke0aehs4AixS0kxv9TytXH?=
 =?us-ascii?Q?PaBPRl5JPSPzYrsgfBM9NqKBcT/SJhbQrZvrcMfLjQt439uAUGw+DgBj4yEc?=
 =?us-ascii?Q?G+7ZkfZ5QlsznKqpKgbV0uq4PnHmA/QaIOM3aud6mJUhnnah9deCVQ71rUtR?=
 =?us-ascii?Q?apIY8+yyNurfhfH38Tb7aUjcbmxX4s/v8XwOUZ94w2f5Ao5nwlROxq1D4H7p?=
 =?us-ascii?Q?7A2NbI1xiXixzc2IYxf5ZZX9DKDjttzYcER6hpiPfaMytMMy+CFsX4CmFGW6?=
 =?us-ascii?Q?sTmFVRD6lk/VUub3O3RwWbUuX4F6ZNhy9bXhRXhkPkmQfjtDTwxxcxBnvUGL?=
 =?us-ascii?Q?ge4qLqZiZ6rHfd8asnRXFpl8VFNQ8G8DjD5QlAoHYL+S4crjIpJgVOck62jL?=
 =?us-ascii?Q?V8L8vNXefO1Kzu750/21+WDODsgaF9aIcyJxtOGxdX92sTEhzXoaIsFajmPC?=
 =?us-ascii?Q?i9R0/yHmPgq2gkhpCo2b/XrCJY31RFGc1oMqMv0ugjqTa2O9jth5YPak5nM6?=
 =?us-ascii?Q?Xw=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 0af83e29-d991-41fb-9239-08dda46078a4
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jun 2025 18:40:40.5762 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fRzZZTdmQxc+9SR3kMChQydurAHkiPQs/hYwPm2H591glr94M3AGxNHtGF0gQ4oOkfBefukbFf4CRcPWG5Oxz5g1qJ6QLvxUx/1iWoCOldY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR11MB5963
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Thu, Jun 05, 2025 at 11:18:44AM +0530, Shekhar Chauhan wrote:
> 
> On 6/3/2025 23:54, Dnyaneshwar Bhadane wrote:
> > From: Matt Roper <matthew.d.roper@intel.com>
> > 
> > Graphics version 30.03 should be treated the same as other Xe3 IP, but
> > will have a slightly different set of workarounds.
> > 
> > Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> > Signed-off-by: Dnyaneshwar Bhadane <dnyaneshwar.bhadane@intel.com>
> > ---
> >   drivers/gpu/drm/xe/xe_pci.c        | 1 +
> >   drivers/gpu/drm/xe/xe_wa.c         | 4 ++++
> >   drivers/gpu/drm/xe/xe_wa_oob.rules | 5 ++++-
> >   3 files changed, 9 insertions(+), 1 deletion(-)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
> > index b68c90910d82..247cd928b933 100644
> > --- a/drivers/gpu/drm/xe/xe_pci.c
> > +++ b/drivers/gpu/drm/xe/xe_pci.c
> > @@ -182,6 +182,7 @@ static const struct xe_ip graphics_ips[] = {
> >   	{ 2004, "Xe2_LPG", &graphics_xe2 },
> >   	{ 3000, "Xe3_LPG", &graphics_xe2 },
> >   	{ 3001, "Xe3_LPG", &graphics_xe2 },
> > +	{ 3003, "Xe3_LPG", &graphics_xe2 },
> >   };
> >   /* Pre-GMDID Media IPs */
> > diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> 
> Any reason why we're merging the addition of Graphics-GMD_ID patch with the
> List-of-workarounds' patch? Historically, we've kept these two as separate
> patches, right?

There haven't really been many cases in the past where we just add an
additional version number to an existing IP/platform that doesn't have
more meaningful functional changes.  The only case I can think of is
when 12.74 was added as another variant of Xe_LP; the commit
81f8729dbc0b ("drm/xe/xelpg: Recognize graphics version 12.74 as
Xe_LPG") added the new version number and the corresponding workaround
updates as a single patch for simplicity, and we're following the same
approach here.

Since the only new thing associated with the version number is a
slightly different list of workarounds, there doesn't seem to be a need
to split them up.  This will also make it slightly easier to backport
the support for the new version number to older kernels if necessary.


Matt

> 
> -shekhar
> 
> > index 67196baa4249..5f750054a9c4 100644
> > --- a/drivers/gpu/drm/xe/xe_wa.c
> > +++ b/drivers/gpu/drm/xe/xe_wa.c
> > @@ -640,6 +640,10 @@ static const struct xe_rtp_entry_sr engine_was[] = {
> >   	  XE_RTP_ACTIONS(SET(RING_PSMI_CTL(0), RC_SEMA_IDLE_MSG_DISABLE,
> >   			     XE_RTP_ACTION_FLAG(ENGINE_BASE)))
> >   	},
> > +	{ XE_RTP_NAME("14021402888"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION(3003), FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(SET(HALF_SLICE_CHICKEN7, CLEAR_OPTIMIZATION_DISABLE))
> > +	},
> >   };
> >   static const struct xe_rtp_entry_sr lrc_was[] = {
> > diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > index 9efc5accd43d..557d23c1bb9f 100644
> > --- a/drivers/gpu/drm/xe/xe_wa_oob.rules
> > +++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
> > @@ -33,9 +33,11 @@
> >   14022293748	GRAPHICS_VERSION(2001)
> >   		GRAPHICS_VERSION(2004)
> >   		GRAPHICS_VERSION_RANGE(3000, 3001)
> > +		GRAPHICS_VERSION(3003)
> >   22019794406	GRAPHICS_VERSION(2001)
> >   		GRAPHICS_VERSION(2004)
> >   		GRAPHICS_VERSION_RANGE(3000, 3001)
> > +		GRAPHICS_VERSION(3003)
> >   22019338487	MEDIA_VERSION(2000)
> >   		GRAPHICS_VERSION(2001)
> >   		MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_match_not_sriov_vf)
> > @@ -57,5 +59,6 @@ no_media_l3	MEDIA_VERSION(3000)
> >   		GRAPHICS_VERSION(1260), GRAPHICS_STEP(A0, B0)
> >   16023105232	GRAPHICS_VERSION_RANGE(2001, 3001)
> >   		MEDIA_VERSION_RANGE(1301, 3000)
> > -16026508708	GRAPHICS_VERSION_RANGE(1200, 3001)
> > +		GRAPHICS_VERSION(3003)
> > +16026508708	GRAPHICS_VERSION_RANGE(1200, 3003)
> >   		MEDIA_VERSION_RANGE(1300, 3000)

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
