Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83389C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:33:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4911510E0E8;
	Tue, 22 Apr 2025 15:33:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="UNc21JaH";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F82C10E0E8
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:33:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745336024; x=1776872024;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=65nq7GiCsNcA5+B0OK7AY5j5Ee+tWkYb0kf2SKlp6Jk=;
 b=UNc21JaHQ993z8nBJb0rSCESs57DyXkr9w75ImohZQ+oyCTtw1WmUg+6
 ajjIuF4Mds5pMzbeDjf3I2IWN75WjIVnlYM1sD9NdQFJBQXXoIhbPQ5DR
 8J9X0OitjXn6cFJMrNY3+WMJfryh5+0X5A5kytHJp2FLbUdNTW1UXZFNq
 R269RTQghvYDG/P2WO6KOcoIkkMZ71WNsQIybJQhZBmowOEUXs/MZbQ+c
 PSBAsQWWSZ3H+QIiMOEzT2lgTA4MRG0D2aNlzJ7loGu2W4C1eMDI8bY5W
 +h4Z3SrsfeCZOWOFYxigglvz08B4KsZnL7OWhEZwm16m5hEImz+/cAaIt Q==;
X-CSE-ConnectionGUID: zF8tg/WyQm+LIPMHySy54A==
X-CSE-MsgGUID: n/fAyjVYQc2JH05efm47VQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="49565496"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="49565496"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:33:43 -0700
X-CSE-ConnectionGUID: 1Iyk4WZGRNW88SwtDAzZpg==
X-CSE-MsgGUID: p7c/g5ZQQnG3Uh6NCpfdEQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="137201550"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:33:35 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:33:34 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:33:34 -0700
Received: from NAM04-MW2-obe.outbound.protection.outlook.com (104.47.73.176)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:33:34 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CJEqGDUCGxAcC+0kWlCL0j3+UnmYqA1w4XM3lKuG4Nv3IP3uIREGQUe5zN/uFYAdsuXG1YwwLICteq6t5zkdIpKwttl34a6HP0N6/g1sjfkOWakm4LaYoCOl23rbCjjRa8QlIDnmPImOmfvRls1jaKAenKsB5v0V6onRUTJAD4GRTNNuqTWOhl49/FZbOHghPjxQRr9BvsEGgm0RU4gwwZt2T7Lo/Jfqhe9thtuZWjMJ4MISjVWT4P86KD45Ipg+VnAIswZJ01lZbCZ5WUiKbj/53hjE0nsfKHx8YZ49hQsHOhjBScv3Furykl5DLoKoFILAqAChDMu41ktXzLslTA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=okVIAaVy7Qjr0FRJ14G7Rf1LBUgb/EExruUakj0pZu8=;
 b=JLC3OMXTJ97slXfttWlOcHyhsh+XXRtuwJvKv/xwE2Fkd8+QJ2vKfqXuTYvLZ9oXXkaJwEZ1otNkOgL2Rzg6XC0SOi9lwz+EgCZQ5p7dNir3COIEl0xN4Q56NnxMGO2HQZ1316a/YAwmWSrSA1UMGINbLMHuY/vQZ0g/wkS1TO6xrR6j8+7gdwLDeoc9Y++o7Qe/ffQEFM8gQBbL69/eHHPtdWhKG0tRts1LSy0pFRv16m7oD3rDcTesfsJl849B5qeCWXUOfwdI4aBLSwTAzljoxGnyHp8Hu1S21+9+t+3xvXL/iE9AP4GrgdLuUnoTilh7i5Z5yuL4uS8EubpgHQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SA2PR11MB4907.namprd11.prod.outlook.com (2603:10b6:806:111::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.22; Tue, 22 Apr
 2025 15:33:32 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:33:31 +0000
Date: Tue, 22 Apr 2025 08:34:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Message-ID: <aAe3HHTarmhI7zAj@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
 <e25bd47bce1167d576a42b231cabb26a7ca102be.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e25bd47bce1167d576a42b231cabb26a7ca102be.camel@intel.com>
X-ClientProxiedBy: MW4PR03CA0321.namprd03.prod.outlook.com
 (2603:10b6:303:dd::26) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SA2PR11MB4907:EE_
X-MS-Office365-Filtering-Correlation-Id: 7aa41d88-8a91-4906-2de8-08dd81b3097b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?+jlWOnJhNDAQhfudBaUNgZZ+KtoFJb/0lX2mCJfj4hwz7Syp+diuwCfTU1?=
 =?iso-8859-1?Q?7rCxPft7koELqZQqBPMk4BDbzan6WMVzkaTJIPlz/wDru6alZHRpCpYhtB?=
 =?iso-8859-1?Q?vDcr/wI2T7PEflg2t0pFTKv61feOHLC05bvCJFM56q2nHMx/9HIS8TnWrt?=
 =?iso-8859-1?Q?9paoZyexiulhMJpN7qo6GOPVCOy85dmjaywSq7z3EAF8RFLvdHULQoBOJr?=
 =?iso-8859-1?Q?CfzHGCq4qkxAEOCHnvXbxqEXGZYeKiNRMcg3mJHoJK1FZGKdWidRVF5rzN?=
 =?iso-8859-1?Q?DBKEDHuLUpHWVIYXNHLvSVH2y0hm5V+tR9maZGOzr9dD38z5dQ12kPxGEe?=
 =?iso-8859-1?Q?T7Y2woy6sMWcaA6h4OG6RamACR6QvDQWz9xQtPq/lAv5Q7ngKa+/RJfe/m?=
 =?iso-8859-1?Q?hzzlyPzkgPDNXNMVORxDQeT8UiLA2pIUrAcLrOdBCk8ySFdj6S7MqX8hyO?=
 =?iso-8859-1?Q?G3MpYk63tZqVCqOT/TSnfCSCQH8lZIBxvWveWaF4qPL5abaqaCfXtORtNl?=
 =?iso-8859-1?Q?wGqCK/qJcaMRTtYzaVxYz9etIF9DceD1Afh/BWLwil2dD66b1kzOINnZFQ?=
 =?iso-8859-1?Q?O4YnWWiorCkvxxga+/KYG48diuV2gvyUdgYuST3NV2QyjGd0KiElvffDQU?=
 =?iso-8859-1?Q?4YgAXnZ29OtT+27qKbIS0+YMu48XxZrnhG3ywtyTUHo/VUyzCG2pMPW0YV?=
 =?iso-8859-1?Q?3HUE/z73PIj6Ea1/NkxKASkP31OrWnNPnc45zXZG75OCgJBOYuyywBtph+?=
 =?iso-8859-1?Q?GbXWbYBPm+vcllkm6lnsyN2UBmE8lCzLACDlYqChzIMObBS61g0Oz9vnvG?=
 =?iso-8859-1?Q?gIsYnQxR+TDLizSwO4+v26hU7AFHqf373ENbuwNrl89NSSqXqPTgiiflRN?=
 =?iso-8859-1?Q?dSXZFrjx3ZsLncD2IGx2AL3Weiv0MbNLoQ4DUSFUb91UhJzoDNTKAAhSqH?=
 =?iso-8859-1?Q?5Ye8prz9w41w6WkNUmb6YvMYduyYqZQNpFWEbtyTZk6HoLq+yqx6E6fH6j?=
 =?iso-8859-1?Q?E4YenXsQuieSaQb96MSKIz1ljr8sm0AS94o/M5yGBYHzeBwhzfA4p4d8dL?=
 =?iso-8859-1?Q?QpxjZfiruz/irSI0mujRDv8OdBo+qIVrXqNCgufhpqjiqCuXiIXHpp8xJx?=
 =?iso-8859-1?Q?uRiv255dq2CUoYu2dwCzeVajdIkgVUkj4Fx9OFC5zD6gYrkrdGafPnL8GY?=
 =?iso-8859-1?Q?7haWvvnz/O0kIgWK09HTJdmmnIPnbUQIKZ4SLuGO4A9Iw7JTB4+tVIVS/p?=
 =?iso-8859-1?Q?kEHgLlA9RG6VFXgf4tCnzl/l+f2VmjJi9BVVzBmzosQleKWac3PcIB6LdK?=
 =?iso-8859-1?Q?bJ3a8i7Z15r7yRZeJfhxJ+7b0dOFk0BFdwGK1YuQfcfknB9mao59lT9gCb?=
 =?iso-8859-1?Q?hGiIZuUSIbFV9ugu95fGOdh4uveHodnvy4ua7zNiQLof++TzLQytvft2qK?=
 =?iso-8859-1?Q?ZBgLXs6VRyYvCkJnyvwy69iUeLWDkYR7V1Yj+8XxvLcQO9Hgo4e+dNw+0t?=
 =?iso-8859-1?Q?4=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/ZTWNPoSNJXN0xoFBDr+XGjeWmy7a45a0SSj5yId5fz03Thx0JeoIv0VzQ?=
 =?iso-8859-1?Q?t+ng3+vCKYGEgdu6OqZn/+j8IjiiLUmX2bwvuvteSpP4h17eESkDXuTC+S?=
 =?iso-8859-1?Q?PrP1Jrq2J6D5Tpf3menm0gVBr2BVBaTlYnsPnW2L1z/KRWRXB9qxkZ+rLU?=
 =?iso-8859-1?Q?ru57fGjW8TQl6mEOMu3VOibeBYmyU6ujC3ypFAp0CSOyfwzYgij8+shfH4?=
 =?iso-8859-1?Q?tOL+k+jVYFPNo+/PRFGKKcjq9Qu3etjbVL2xCAOkfknw2VOt1VbIASCMLk?=
 =?iso-8859-1?Q?y6h+KDMeeHc0czu/Z4SSHgJKz9qXo4Xa55Gumll6DEI8oLmUmad8p7WoU+?=
 =?iso-8859-1?Q?v1oXd/HeuYGz3fC1mqvDclnkvP6IS9JKy0ZbZobQg/CuJJjSBqY10q2yOM?=
 =?iso-8859-1?Q?DshwkrF9aGh8jolsQzFT5R8YW3U9hPEtt64gYaGs0zhtvBNwN7YarrD+Nk?=
 =?iso-8859-1?Q?Jrz+cIfR+RgBA+SU/6y6t5sAlAAykyyWacQIujdTV9ssAv/JE65u6XD7b7?=
 =?iso-8859-1?Q?z1ZtbT72D1yONFclxEJzf4Av/I6eRK00UZ1c/BsP5L592LrgolzACWzi9R?=
 =?iso-8859-1?Q?gVNOsqtSkuL7DfvTyHoRKcazCtJjO3xlfo+iuPY6SsYYTCHCgyaNfcGPK8?=
 =?iso-8859-1?Q?+Yf8HvJo3FMy234L1/qgPLb/2jggzo9DMnF/AK66Gj5WqBCQMGIGssCyvR?=
 =?iso-8859-1?Q?HyN5YFdarD6oJnbDi43ktm5AIj8zavS0eyVpjCHIQuVNp40f1GRZeALC40?=
 =?iso-8859-1?Q?Ssd3SfDcxq7S4ud5c24yd+C9mEgOvRzJrziC7Tja3VawyZfqg48DYlpUUk?=
 =?iso-8859-1?Q?Q96sbuZnlaSlGD1KpS+jR21Hf0K+Qbg5+ucgU6Mt8ZQ0NWD1C1OqubnxOk?=
 =?iso-8859-1?Q?MAfM3QT6BbBsiL+qlnwM+AuvN8myFKjzYNS2uex0lQjQQdlt5fbV3svnx+?=
 =?iso-8859-1?Q?1HUrmt0UIgLis2tHZCOZ4TP2zCV5LfmaUKId3+jrqncw/cF+wf9/stHGDL?=
 =?iso-8859-1?Q?pbgw/UDYEsddyARlMQYXvjkRe0BOLl+n2Lii2bPkLRSapaZvJsPwDviBiz?=
 =?iso-8859-1?Q?FTAutj8vD8byyBJB0+xFZYK/GTGSPr1VH87VR1+8fH9Din3U8XTwtgPmPM?=
 =?iso-8859-1?Q?Ze9FifSvU93cbTFR8MPvGpv5iYbsuLsdq8tv0bNTrWEa+rxDlOnS8VJd9L?=
 =?iso-8859-1?Q?5GmruDHi19K20uunw6IOvTXsbpsSnmpSTU0fecJDzPH3CsAlFRdAF6Mtk5?=
 =?iso-8859-1?Q?4TNJb5oJp/prQ+17mxz5qS8vFEItcSweYjSQ0Ax0VwjmIEV8FL/jRRUDXP?=
 =?iso-8859-1?Q?7r6mi6dsiyRXCpezc7JNWcLmgrTbVAVdFiRkc3FlzBdHOJ3pwr5eQko+PX?=
 =?iso-8859-1?Q?PNKHh/KKhyzym0/SZrLXvd2xfdoy5aduZ6iKMvHW0jfjbS10G4WrzyL34d?=
 =?iso-8859-1?Q?Xps1HAiEMo5fEwVkJ/1beLrGv37gg+D+axUkcV8jP2oe2IwUgczh1ZijI7?=
 =?iso-8859-1?Q?5gXj/40fNM6JWohdhOHjIX5Y1rz/ZvO37LT9m4bF7AKIq9N3pm1wNxYcFG?=
 =?iso-8859-1?Q?m1CYXWnM1s7LkeEszJDcTBDZJJPz+W0FCgrFrN+bCv0e5dayhB44OnO5aN?=
 =?iso-8859-1?Q?nsfTUjZoAlBjt7+d2PYQySkRQb08NeuxEOfOnE9KPu0wDFFfoJjvDqrA?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7aa41d88-8a91-4906-2de8-08dd81b3097b
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:33:31.6726 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gEJnnMqrMAQ1+d3n0j7zxsWf7WdNJVSY+zMkNVMj39u3kNMh/XXDrfVkk4wKrOio+pCCF3Vm/TeazfgqgsuCuA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4907
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

On Thu, Apr 17, 2025 at 12:24:17PM -0600, Souza, Jose wrote:
> On Thu, 2025-04-17 at 11:19 -0700, José Roberto de Souza wrote:
> > On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
> > > This commit introduces a new madvise interface to support
> > > driver-specific ioctl operations. The madvise interface allows for more
> > > efficient memory management by providing hints to the driver about the
> > > expected memory usage and pte update policy for gpuvma.
> > > 
> > > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > > ---
> > >  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 97 insertions(+)
> > > 
> > > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > > index 9c08738c3b91..aaf515df3a83 100644
> > > --- a/include/uapi/drm/xe_drm.h
> > > +++ b/include/uapi/drm/xe_drm.h
> > > @@ -81,6 +81,7 @@ extern "C" {
> > >   *  - &DRM_IOCTL_XE_EXEC
> > >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> > >   *  - &DRM_IOCTL_XE_OBSERVATION
> > > + *  - &DRM_IOCTL_XE_MADVISE
> > >   */
> > >  
> > >  /*
> > > @@ -102,6 +103,7 @@ extern "C" {
> > >  #define DRM_XE_EXEC			0x09
> > >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> > >  #define DRM_XE_OBSERVATION		0x0b
> > > +#define DRM_XE_MADVISE			0x0c
> > >  
> > >  /* Must be kept compact -- no holes */
> > >  
> > > @@ -117,6 +119,7 @@ extern "C" {
> > >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> > >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> > >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > > +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> > >  
> > >  /**
> > >   * DOC: Xe IOCTL Extensions
> > > @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> > >  	__u64 sampling_rates[];
> > >  };
> > >  
> > > +struct drm_xe_madvise_ops {
> > > +	/** @start: start of the virtual address range */
> > > +	__u64 start;
> > > +
> > > +	/** @size: size of the virtual address range */
> > > +	__u64 range;
> > > +
> > > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > > +#define DRM_XE_VMA_ATTR_PAT		2
> > 
> > In my opinion we should drop DRM_XE_VMA_ATTR_PAT as we can already change the PAT index by unbinding and binding the VM with the wanted PAT index.
> > Similar for DRM_XE_VMA_ATTR_ATOMIC and DRM_XE_VMA_ATTR_PREFERRED_LOC, we could have those properties in vm bind uAPI and if needed to change we could
> > unbind and bind the VMA with the updated attributes.
> 
> Ah and if it is chosen to move forward with those I think would be nice to have drm_xe_sync so we could synchronize the update of this attributes with
> previous submissions and future ones.
> 

I think we should have extra reserved bits for a sync interface so we
can add one if needed but the way madvise is currently implement it is
completely synchronous as all it does is update the KMD's VM/VMA
bookkeeping, it does not update the GPU page tables (it can invalidate
them though). A subsequent is expected to be issued if you need
immediate page table updates.

Matt

> > 
> > > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> > 
> > Mesa can make use of DRM_XE_VMA_ATTR_PURGEABLE_STATE but not the other ones, so you will need other UMDs to land those.
> > 
> > > +	/** @type: type of attribute */
> > > +	__u32 type;
> > > +
> > > +	/** @pad: MBZ */
> > > +	__u32 pad;
> > > +
> > > +	union {
> > > +		struct {
> > > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > > +		/** @val: value of atomic operation*/
> > > +			__u32 val;
> > > +
> > > +		/** @reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} atomic;
> > > +
> > > +		struct {
> > > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > > +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> > > +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > > +			__u32 val;
> > > +
> > > +		/** @reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} purge_state_val;
> > > +
> > > +		struct {
> > > +			/** @pat_index */
> > > +			__u32 val;
> > > +
> > > +			/** @reserved: Reserved */
> > > +			__u32 reserved;
> > > +		} pat_index;
> > > +
> > > +		/** @preferred_mem_loc: preferred memory location */
> > > +		struct {
> > > +			__u32 devmem_fd;
> > > +
> > > +#define MIGRATE_ALL_PAGES 0
> > > +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> > > +			__u32 migration_policy;
> > > +		} preferred_mem_loc;
> > > +	};
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +};
> > > +
> > > +/**
> > > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > > + *
> > > + * Set memory attributes to a virtual address range
> > > + */
> > > +struct drm_xe_madvise {
> > > +	/** @extensions: Pointer to the first extension struct, if any */
> > > +	__u64 extensions;
> > > +
> > > +	/** @vm_id: vm_id of the virtual range */
> > > +	__u32 vm_id;
> > > +
> > > +	/** @num_ops: number of madvises in ioctl */
> > > +	__u32 num_ops;
> > > +
> > > +	union {
> > > +		/** @ops: used if num_ops == 1 */
> > > +		struct drm_xe_madvise_ops ops;
> > > +
> > > +		/**
> > > +		 * @vector_of_ops: userptr to array of struct
> > > +		 * drm_xe_vm_madvise_op if num_ops > 1
> > > +		 */
> > > +		__u64 vector_of_ops;
> > > +	};
> > > +
> > > +	/** @reserved: Reserved */
> > > +	__u64 reserved[2];
> > > +
> > > +};
> > > +
> > >  #if defined(__cplusplus)
> > >  }
> > >  #endif
