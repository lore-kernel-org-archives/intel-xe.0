Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 172F1C5AC67
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 19:47:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89C4810F29D;
	Thu,  6 Aug 2026 19:47:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Aq2G3nvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2070510E3B3
 for <intel-xe@lists.freedesktop.org>; Thu,  6 Aug 2026 19:47:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1786045621; x=1817581621;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=T/4DhZk7oF5nDTYO1pu8CxULneE7p0lTFA3RcDj0Qj0=;
 b=Aq2G3nvEnsVAA65QS4xnl27tNOflCJgpL0LLtkvcXpzq4QoWyiZggbbN
 +y9UiFDr808SKhWWbM+FQ/AT1LzxQp4EzxC1tq4MchOZXq4gtk0Lkkjm2
 KsHx2E0RcpgcEAnzfaUC9C7OsU9BXY4LdqlOPPELx01Sghq0CmNtKdN4u
 Xx5ceGL2TnmvNDS2ojdGoMvqQNgrjeZz+gbyVsh55mLW2xOVovPxt4JRq
 wQm9aq/LwPNTgAdKi+oCSVzQbOHWAJWMOpOG25gjSRTc++EjIEpbQXGsp
 uuxkqEd1nDKomFKcGctsLzhKECXZAPv5t6jWcckfANveIpr4vvLiHavRC g==;
X-CSE-ConnectionGUID: Q8A1pfp+S4urCN+8D2VXww==
X-CSE-MsgGUID: mcfKCXfNTEy9AKbqtePedA==
X-IronPort-AV: E=McAfee;i="6800,10657,11867"; a="85775164"
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="85775164"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:47:01 -0700
X-CSE-ConnectionGUID: gOCX2gd4S0e/x1liH2sxwQ==
X-CSE-MsgGUID: Wz56PR3MRCm6k9w8P5dgvg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,209,1779174000"; d="scan'208";a="260424791"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 06 Aug 2026 12:47:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:47:00 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45 via Frontend Transport; Thu, 6 Aug 2026 12:47:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.39) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.45; Thu, 6 Aug 2026 12:46:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mOFu7/Rh0v7BhIpxqce/ryFhv4zMNVAxVnI9kYgl/kPjNg8PbBVKBwVfq4YeTxTOZPuSkv+O0lauXYYf+Vu9b/0DXIW1JTyGnroAuExSKULkAHagrKliWTkMI3ohuCpl8Sv6ZkxkCDvHTtJ04E8HCWVb2io2DFafirR7AfKj/84IKPy9p8XqO8bAyamsT24CLoWKwhWqUry7wAvnJ6z/YkTDQYMi45fp1Z3us7h2w+nBo17Tku5AzFzkf8shSe521fLiaVCO5wedoO7Sq3OUf9IYObItUzFnPd8qZCSG/AoR0YGSTXTftrBbQPSKZvizbj6RrlW6NStcK2VeRrWrdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VE5yFahOYQgZ1i/mNYml1BWytkVkBQLS9f2evkJ0V34=;
 b=zCfLL1dPjzpjbIgoG6YAF4xRCqdM7B6M+1sorvt/rcJkzRzZo+89a1ewPweo+wlJlqe4R8eLm3vkEdZWJFpyY9q0MrlKRKsCGZYTGE8OYTG+qMQKpUp/AzZTrQvw1Leay9ImDVxlHSH9+vQkf2zlEeJ1kwRm4NWdp57M/vrF74w9MdfJm4lsPmH29e5UdhA6Rek8FYsUYNuXj1dakWPX0LOgFoIazr/vAJs7fgr3Kanf4c8hseRTDn0+E/kywLVbPUzxz6uO9Ka2utPWTHSyr3MSpBKw52IYH0bpU3+Uko9Cs4vABIVDQ4OP7zESNm8iX77K2zgPK108+oV64f8BAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CO1PR11MB5073.namprd11.prod.outlook.com (2603:10b6:303:92::23)
 by MN2PR11MB4663.namprd11.prod.outlook.com (2603:10b6:208:26f::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.270.16; Thu, 6 Aug
 2026 19:46:57 +0000
Received: from CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe]) by CO1PR11MB5073.namprd11.prod.outlook.com
 ([fe80::a153:939c:df8c:f4fe%7]) with mapi id 15.21.0292.013; Thu, 6 Aug 2026
 19:46:57 +0000
Date: Thu, 6 Aug 2026 15:46:53 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "Wajdeczko, Michal" <michal.wajdeczko@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Tauro,
 Riana" <riana.tauro@intel.com>, "Koujalagi, Mallesh"
 <mallesh.koujalagi@intel.com>, "Iddamsetty, Aravind"
 <aravind.iddamsetty@intel.com>, "Jadav, Raag" <raag.jadav@intel.com>,
 "Levitt, Yoni" <yoni.levitt@intel.com>
Subject: Re: [PATCH v3 02/23] drm/xe/log: Add structured SIGID error logging
 infrastructure
Message-ID: <anTkrTS7yjNxm8RA@intel.com>
References: <20260730152121.576-1-michal.wajdeczko@intel.com>
 <20260730152121.576-3-michal.wajdeczko@intel.com>
 <522ab2835b03dcd101d52fb752b3fb839ed0c15c.camel@intel.com>
 <anKTkC-thNA53RWy@intel.com>
 <b9e4c2b0ff6cb92797e75bd53a303f514b73322f.camel@intel.com>
 <8e65c45f-a8c0-40fe-96a3-da93d8e95aaa@intel.com>
 <a598192cd598d4f57993964bbb62882684f3bc23.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <a598192cd598d4f57993964bbb62882684f3bc23.camel@intel.com>
X-ClientProxiedBy: SJ0PR05CA0067.namprd05.prod.outlook.com
 (2603:10b6:a03:332::12) To CO1PR11MB5073.namprd11.prod.outlook.com
 (2603:10b6:303:92::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PR11MB5073:EE_|MN2PR11MB4663:EE_
X-MS-Office365-Filtering-Correlation-Id: 3c902a80-76de-4ab8-7a84-08def3f37942
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|23010399003|18002099003|6133799003|3023799007|4143699003|11063799006|56012099006|5023799004|10067099003|22082099003;
X-Microsoft-Antispam-Message-Info: OWr1vOY6BJnbHRLA4kVE2TvfbzUlWt+yAgQN7GkCSrYGUmjW7xcOtgw6hLaISQirVVTjNKsX8I6P73aRCmT5pumbkePr0v61MSeeaVC+tg4v35rHDdkjnwqBNwLyBm8uKFEUMPkm03idCF2tmz28udX9tJdgK5Y+TzzJnZAaDuatanLpfMpfAZFs/8VvzD4PFSD+P2mb3M+C2rvoR/ghjoU2dkQVmMbJonwfTiJduJLOrijstjQGllqY/PnEcpP2UvpLcgNTovGEczxE/90KoKrEKYPK6Ml/OAYSPSbewAXwxLA9Db/CDOW/3USO/0leFOQkaJYxOaX6BlVKe1IKkY10oTjz+s+VdVj8IqtDmho5Xk3n3mxZ7K+UDQ/wTMPs9PWzLHgFZoXWT/5HB0R0y10OFY2M+ogpcVvNS7iSLpzamFFO+nm0HoR0vF01u66ZXqs2hp/4FHrazvK2+KzzhgAekZzSWUXGzeK5FXq04Smc7s9YmaivzIstLIjbp8UHBxUbwustWN1LC85ZuLoDUa4Gp1SoPiregmpvxuv3hQK7dXMbpCm6xTXy7mlHkl6bvbGfGJxy1zzbDG+PnkgvU8LisljJqLc8z8brC0jEXQCk5K1zyC+BbBnEJWQy01Q57XCx9+v3T2okiFdRs5RMSy3uBFtNnDayXGPYso/E2RU=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CO1PR11MB5073.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(23010399003)(18002099003)(6133799003)(3023799007)(4143699003)(11063799006)(56012099006)(5023799004)(10067099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?66NrH50z5o2aaFJJ+Rq0COdlxZe6LAYRHnbroN+3ubIMBnWLSXBpJanp3G?=
 =?iso-8859-1?Q?pZ6IIzv1W+KGr8hmmBreCha2ZAqasCm/zx0ndnmPzOF9FVG03QXdGl76yD?=
 =?iso-8859-1?Q?XvqK5w6wJjbY/PcSYCQVRH7RddqvLcnf3LQkRRMJIP0DdXtUWCSreNu5YZ?=
 =?iso-8859-1?Q?JJw/CpGLrdJk5Y5/7Js5Emaf5HMot88OobL+v1cdRBezCCc20NV0FAdozc?=
 =?iso-8859-1?Q?rn9WY69ooDfEk5xgFcYvB086zTptApS9xDPWpjF6UGzdTkDC/jpO44MpoD?=
 =?iso-8859-1?Q?8Fl+G4bzrFGci71pAZK4SLbhnv81+EZfegCwgaH+pqya0qis2s9t12Y7Pv?=
 =?iso-8859-1?Q?+pSjP36ytXU8I/RawvYfF1Mx8uUHcIVeggaQ/fGwg7ST9XTbhE4/kFZnSu?=
 =?iso-8859-1?Q?aqUhclGG7uxPcNwlauV8lNGgq9llOT9O/gKFT6KqrnJaXpZGfZw9PpnnDS?=
 =?iso-8859-1?Q?A4YG165Yh/5aEeSYwMfqX7fkJlLDLiqZqYjw0w8nL6IY3JRg+XeEi+lyJV?=
 =?iso-8859-1?Q?cNYleO+Y0mAkg3Yn0wbfgFtRgdD8RSw5wph9McyCquaddw0ZJK4qraTfaQ?=
 =?iso-8859-1?Q?d/pYr2W805hN3uaYZgGHmA6VhLCYB0AowG5GSRQdWDSpySoYJle8yMaebM?=
 =?iso-8859-1?Q?F62MMhKwIAGaDxjxpovnp/bBt1GMxpN4OcHkIJX1VEnvOQO6DS2Y2jCy1+?=
 =?iso-8859-1?Q?pcLRB5yJaVViOsgpZXQjzcN9NAUg+OQ4Rg8UHFmaIFiGy0MAThIUs6epTR?=
 =?iso-8859-1?Q?5WfAG6q+g8TJcGXqvwULRtyYrUfRpa4jSbqIKKzM7q0H558Eb1YluciCU7?=
 =?iso-8859-1?Q?SvrxFO92c4LnHhHFVrUVvXvozUEgBawYilbEhoblbt0gn3tW4403vO9Kz5?=
 =?iso-8859-1?Q?ghsMz4hrsxA8zqQh5gqzEoSdnRo9MszOP0apM/gAUWGGc4zBEvqnY5k6Ro?=
 =?iso-8859-1?Q?Sdhgo/k3W2SHE5H5Tpnz+H/9zSPq+xMk2vItuT6uA6pJPpY4lI81RK4w+b?=
 =?iso-8859-1?Q?wxaMbm4FVEwuI8sFVcKTF/Oa2EloAZFWhpa+in/CwYIynuInO7wup2FeoT?=
 =?iso-8859-1?Q?OurkehTPz37xJtz8xLIXizBmJRcNWajzocM99vR4thF4TQcuRw+urstXfG?=
 =?iso-8859-1?Q?we9OOdUCskOzVQs0RBBW+LX/ZAxkADLur7lUPzStBVXCY6naFUcSUF4pus?=
 =?iso-8859-1?Q?5zi7ZRsxBi4sAWI6NhM0gcASAKXM2jCvQQBLA1OffjT897+rFAryAiNyFo?=
 =?iso-8859-1?Q?YakSZYMz4dFplHRO2aaOmDep0k36V7O2jy6HFwyzpDqmMUuH3Z+tI6eLin?=
 =?iso-8859-1?Q?drFOSVfSY710Jyju528ZfIrKQkXT1wV6rq6zZKl8P575ayu4Hf0MHQD5bN?=
 =?iso-8859-1?Q?pJDwcXoX8fTGNFN2GFNgGe7eF/G+B4Q3EcXnPIW3eM8UxZqK1tItnYrqwW?=
 =?iso-8859-1?Q?K5kMUlQYxV4MHbvWZ+FnuIZaKvRAmYSK+moKfk6j6ddFQmK25dyh3l4HWH?=
 =?iso-8859-1?Q?b4ebrhOov/KLpS7CSalOJ9s3LoCaBs/bfWCxhPdOHXNaIiO045DL1KNHVQ?=
 =?iso-8859-1?Q?xSOgb2AVND2FMDJj8xX3n4pU4UlKt6VvlDoUtxp82kXA13xQPZTWkSd7n9?=
 =?iso-8859-1?Q?Eob6NCs1EmK5pxrBtRo5xeeBalj7UD4pHgpKe/eW6bo23C0SK5YNiUNMVa?=
 =?iso-8859-1?Q?Ac60ntCzVul+JmiOYU5miALHIpFsjikRtzm2zmukEKNI+6YGEOI+DcHr7K?=
 =?iso-8859-1?Q?tUEEr0IeY7VNAezVDvNm+FTxMZJzB6x69Jwne8kmeX9DlclSMjhrMZ+2tf?=
 =?iso-8859-1?Q?NhEKngxagw=3D=3D?=
X-Exchange-RoutingPolicyChecked: VtHlPZ6RbS+iZNWMjWa1ZYlHhqu8H72QL442v3uAmAK4NOouygtv3FfjFyJHd1Q8T5po2t9VoQf8s5i0Z77Lx5+Z9dsU0Av2tO80G4615gSRiPWkdJ42dbV6hBsSXD1s23Thop2XfL/+Zxzns5mu5MFNmrEnpwHF7Ygirn1BUHPAMkLGoehOurwwIT1KWWB+aRvnlW0bcsQ7xZtWVN9AMC9ZGheKjrshHuhIdRiQuyUtb8f2gTXn4Zb9rXXyxFeULVwa/3XU9/FofpeTdDM7MD1jEK1mPNfKOxRvmR7gswuGSno5QTrl+gjs0bAW8mSfcM7gS7B7NB0anIUbFlYORg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 3c902a80-76de-4ab8-7a84-08def3f37942
X-MS-Exchange-CrossTenant-AuthSource: CO1PR11MB5073.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2026 19:46:57.3054 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2FlT7isQLMG7YJSnxHI0PfHLLib1TPB93stuaizQTEc9sAJkj0hl8iJynM1y67z+CnFvkDI5xwDYaAeT9beA1Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR11MB4663
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

On Thu, Aug 06, 2026 at 03:10:04PM -0400, Summers, Stuart wrote:
> On Thu, 2026-08-06 at 13:31 +0200, Michal Wajdeczko wrote:
> > 
> > 
> > On 8/6/2026 12:24 AM, Summers, Stuart wrote:
> > > On Tue, 2026-08-04 at 21:36 -0400, Rodrigo Vivi wrote:
> > > > On Tue, Aug 04, 2026 at 05:21:05PM -0400, Summers, Stuart wrote:
> > > > > On Thu, 2026-07-30 at 17:20 +0200, Michal Wajdeczko wrote:
> > > > > > From: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> > > > > > 
> > > > > > Today the driver reports faults with ad-hoc
> > > > > > drm_err()/xe_gt_err()
> > > > > > strings that have no stable shape. That is readable for a
> > > > > > human,
> > > > > > but
> > > > > > it
> > > > > > gives fleet tooling nothing durable to match on: the wording
> > > > > > changes
> > > > > > between releases, lines can be rate-limited or dropped under
> > > > > > an
> > > > > > error
> > > > > > storm, and there is no consistent way to ask "which
> > > > > > recognised
> > > > > > fault
> > > > > > just happened?".
> > > > > > 
> > > > > > Introduce a signature identifier (SIGID): a small, stable
> > > > > > integer
> > > > > > that
> > > > > > names one recognised Xe fault situation and serves as the
> > > > > > primary
> > > > > > handle
> > > > > > for triage. A SIGID maps, through published end-user
> > > > > > documentation,
> > > > > > to a
> > > > > > description and a recommended action; the driver only has to
> > > > > > emit
> > > > > > the
> > > > > > right SIGID next to the usual human-readable text.
> > > > > 
> > > > > I'm a little worried
> > > > 
> > > > I understand your feeling. We've been all through that:
> > > > 
> > > > https://lore.kernel.org/intel-xe/amqhoFzQaf1HsuFq@intel.com/
> > > > 
> > > > > we're introducing some ABI with this that isn't
> > > > > really maintainable in the long term:
> > > > 
> > > > I understand the fear and indeed the first proposals I got was
> > > > unmaintainable. My first record of pushing back on having
> > > > something
> > > > like this was November last year.
> > > > 
> > > > But I respectfully disagree here. This latest version is imho
> > > > organized and concise.
> > > > 
> > > > > we might decide to change the
> > > > > flow or change the way an error is reported or the situation
> > > > > that
> > > > > triggers this error from firmware or hardware might change for
> > > > > some
> > > > > reason.
> > > > 
> > > > You are right, dmesg is not ABI and it will never be. these logs
> > > > are aimed for developers and developers are free to change them
> > > > as
> > > > needed. This was a big counter-requirement I gave to the original
> > > > idea.
> > > > 
> > > > We are not moving all the logs to this format we are not
> > > > promising
> > > > dmesg stability.
> > > > 
> > > > The numbering stability however needs to be somewhat stable for
> > > > the CPER log in tracefs, that's the ABI. But then that meaning
> > > > shouldn't change if the code has to change. A new number should
> > > > be needed if the component/location/severity or recommended
> > > > recovery needs to be different.
> > > > 
> > > > But like I told Raag as well, no developer needs to invent any
> > > > number, if they don't know just use regular log messages.
> > > > We are not going to move all the logs towards this thing.
> > > > Also, the location of the issue is what triggers the ID...
> > > > it is very simple by nature. And we need to keep it simple.
> > > > 
> > > > > Does this lock us into a solution for all of this? I still need
> > > > > to go through the full patch series...
> > > > 
> > > > Yes, please take a look to the series. All reviews are welcomed.
> > > > 
> > > > > 
> > > > > The dmesg entries are generally for human debuggability. I get
> > > > > the
> > > > > desire to make these easier to parse for an AI tool or
> > > > > generated
> > > > > script, but we also don't want to prevent debug related changes
> > > > > for
> > > > > error handling and reporting.
> > > > 
> > > > We are not promising this. The stable ABI is only the CPER on
> > > > tracefs.
> > > > 
> > > > We need to always keep this in mind as stated in
> > > > Documentation/core-api/printk-index.rst:
> > > > 
> > > > """
> > > > The kernel messages are evolving together with the code. As a
> > > > result,
> > > > particular kernel messages are not KABI and never will be!
> > > > """
> > > > 
> > > > Thanks,
> > > > Rodrigo.
> > > > 
> > > > > 
> > > > > Thanks,
> > > > > Stuart
> > > > > 
> > > > > > 
> > > > > > Signed-off-by: Mallesh Koujalagi
> > > > > > <mallesh.koujalagi@intel.com>
> > > > > > Assisted-by: Copilot:Opus-4.8
> > > > > > Signed-off-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > > Co-developed-by: Michal Wajdeczko
> > > > > > <michal.wajdeczko@intel.com>
> > > > > > Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > > ---
> > > > > > Cc: Yoni Levitt <yoni.levitt@intel.com>
> > > > > > Cc: Aravind Iddamsetty <aravind.iddamsetty@intel.com>
> > > > > > Cc: Raag Jadav <raag.jadav@intel.com>
> > > > > > Cc: Riana Tauro <riana.tauro@intel.com>
> > > > > > ---
> > > > > > v2: CORRECTED is still an error (Michal)
> > > > > >     prepare to decorate dmesg with comp/loc (Michal)
> > > > > > ---
> > > > > >  Documentation/gpu/xe/index.rst        |   1 +
> > > > > >  Documentation/gpu/xe/xe_sigid.rst     |  14 ++
> > > > > >  drivers/gpu/drm/xe/Makefile           |   1 +
> > > > > >  drivers/gpu/drm/xe/abi/xe_sigid_abi.h | 183
> > > > > > ++++++++++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_log.c           | 135
> > > > > > +++++++++++++++++++
> > > > > >  drivers/gpu/drm/xe/xe_log.h           |  20 +++
> > > > > >  6 files changed, 354 insertions(+)
> > > > > >  create mode 100644 Documentation/gpu/xe/xe_sigid.rst
> > > > > >  create mode 100644 drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_log.c
> > > > > >  create mode 100644 drivers/gpu/drm/xe/xe_log.h
> > > > > > 
> > > > > > diff --git a/Documentation/gpu/xe/index.rst
> > > > > > b/Documentation/gpu/xe/index.rst
> > > > > > index 665c0e93601c..0247a255f7e6 100644
> > > > > > --- a/Documentation/gpu/xe/index.rst
> > > > > > +++ b/Documentation/gpu/xe/index.rst
> > > > > > @@ -35,3 +35,4 @@ The display, or :ref:`drm-kms`, support for
> > > > > > drm/xe
> > > > > > is provided by
> > > > > >     xe-drm-usage-stats.rst
> > > > > >     xe_configfs
> > > > > >     xe_gt_stats
> > > > > > +   xe_sigid
> > > > > > diff --git a/Documentation/gpu/xe/xe_sigid.rst
> > > > > > b/Documentation/gpu/xe/xe_sigid.rst
> > > > > > new file mode 100644
> > > > > > index 000000000000..45d84a62f185
> > > > > > --- /dev/null
> > > > > > +++ b/Documentation/gpu/xe/xe_sigid.rst
> > > > > > @@ -0,0 +1,14 @@
> > > > > > +.. SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> > > > > > +
> > > > > > +========
> > > > > > +Xe SIGID
> > > > > > +========
> > > > > > +
> > > > > > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > > +   :doc: Xe Error Signatures (SIGID)
> > > > > > +
> > > > > > +Signature Identifiers
> > > > > > +=====================
> > > > > > +
> > > > > > +.. kernel-doc:: drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > > +   :internal:
> > > > > > diff --git a/drivers/gpu/drm/xe/Makefile
> > > > > > b/drivers/gpu/drm/xe/Makefile
> > > > > > index 67ada1d6c2fb..7ac3954737f9 100644
> > > > > > --- a/drivers/gpu/drm/xe/Makefile
> > > > > > +++ b/drivers/gpu/drm/xe/Makefile
> > > > > > @@ -87,6 +87,7 @@ xe-y += xe_bb.o \
> > > > > >         xe_hw_fence.o \
> > > > > >         xe_irq.o \
> > > > > >         xe_late_bind_fw.o \
> > > > > > +       xe_log.o \
> > > > > >         xe_lrc.o \
> > > > > >         xe_mem_pool.o \
> > > > > >         xe_migrate.o \
> > > > > > diff --git a/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > > b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > > new file mode 100644
> > > > > > index 000000000000..99717fdf74a6
> > > > > > --- /dev/null
> > > > > > +++ b/drivers/gpu/drm/xe/abi/xe_sigid_abi.h
> > > > > > @@ -0,0 +1,183 @@
> > > > > > +/* SPDX-License-Identifier: MIT */
> > > > > > +/*
> > > > > > + * Copyright © 2026 Intel Corporation
> > > > > > + */
> > > > > > +
> > > > > > +#ifndef _ABI_XE_SIGID_ABI_H_
> > > > > > +#define _ABI_XE_SIGID_ABI_H_
> > > > > > +
> > > > > > +/**
> > > > > > + * DOC: Xe Error Signatures (SIGID)
> > > > > > + *
> > > > > > + * What SIGID stands for
> > > > > > + * ---------------------
> > > > > > + *
> > > > > > + * SIGID is short for *Signature Identifier*. A SIGID is a
> > > > > > small,
> > > > > > stable integer
> > > > > > + * that names one *recognised Xe fault situation* -- nothing
> > > > > > more.
> > > > > > It is the
> > > > > > + * primary handle used for triage: a SIGID maps to a human
> > > > > > description and a
> > > > > > + * recommended first action. A coarse first-order action is
> > > > > > documented in-tree
> > > > > > + * per SIGID (see "First-order action" below) so the id is
> > > > > > actionable on its
> > > > > > + * own; published end-user documentation refines it with
> > > > > > finer,
> > > > > > cross-product
> > > > > > + * detail. The driver's only job is to emit the right SIGID
> > > > > > next
> > > > > > to
> > > > > > the usual
> > > > > > + * human-readable text.
> > > > > > + *
> > > > > > + * Why this exists
> > > > > > + * ---------------
> > > > > > + *
> > > > > > + * Today the driver reports faults with ad-hoc ``drm_err()``
> > > > > > /
> > > > > > ``xe_gt_err()``
> > > > > > + * strings that have no stable shape. That is fine for a
> > > > > > human
> > > > > > reading dmesg,
> > > > > > + * but it gives fleet tooling nothing durable to match on:
> > > > > > the
> > > > > > wording changes
> > > > > > + * between releases, lines can be rate-limited or dropped
> > > > > > under
> > > > > > an
> > > > > > error storm,
> > > > > > + * and there is no consistent way to ask "which recognised
> > > > > > fault
> > > > > > just happened?"
> > > > > > + * A SIGID answers exactly that one question, identically
> > > > > > across
> > > > > > driver and
> > > > > > + * firmware versions, and (eventually) across other Intel
> > > > > > devices in
> > > > > > a node.
> > > > > > + *
> > > > > > + * What a SIGID is (and is not)
> > > > > > + * ----------------------------
> > > > > > + *
> > > > > > + * A SIGID names *which situation* is being reported. It
> > > > > > deliberately does not
> > > > > > + * encode the detailed reason or the outcome. Those are
> > > > > > carried
> > > > > > alongside it::
> > > > > > + *
> > > > > > + *   SIGID    -> which recognised situation is being
> > > > > > reported
> > > > > > + *   severity -> how serious this instance is (see below --
> > > > > > not
> > > > > > fixed per SIGID)
> > > > > > + *   errno    -> the failing operation's error, shown with
> > > > > > %pe
> > > > > > + *   message  -> free-form human-readable context
> > > > > > + *
> > > > > > + * Severity is independent of the SIGID. The same situation
> > > > > > can
> > > > > > be
> > > > > > reported at
> > > > > > + * different severities depending on the instance and the
> > > > > > recovery
> > > > > > taken, so a
> > > > > > + * SIGID is never tied to one severity; the reporting site
> > > > > > chooses
> > > > > > it by calling
> > > > > > + * the matching xe_log_*() helper (see xe_log.h).
> > > > > > + *
> > > > > > + * How to pick a SIGID (the uniqueness rule)
> > > > > > + * -----------------------------------------
> > > > > > + *
> > > > > > + * Pick per *report site*, not per incident. Each site emits
> > > > > > the
> > > > > > single most
> > > > > > + * specific recognised situation *for that site* -- so the
> > > > > > question
> > > > > > is never
> > > > > > + * "classify this whole failure", it is "what does this site
> > > > > > detect?", which has
> > > > > > + * one answer. A single underlying failure therefore
> > > > > > legitimately
> > > > > > produces a
> > > > > > + * *chain* of reports from different layers, each with its
> > > > > > own
> > > > > > SIGID
> > > > > > -- e.g. a
> > > > > > + * GuC communication failure is reported as
> > > > > > %XE_SIGID_RUNTIME_FW
> > > > > > by
> > > > > > the firmware
> > > > > > + * path, the failed recovery as %XE_SIGID_GT_TDR by the
> > > > > > reset
> > > > > > path,
> > > > > > and an
> > > > > > + * aborted bind as %XE_SIGID_PROBE by the probe path. That
> > > > > > chain
> > > > > > lets triage
> > > > > > + * follow a fault from origin to final effect; it is not a
> > > > > > duplicate.
> > > > > > + *
> > > > > > + * If a site does not match any defined situation, keep
> > > > > > using
> > > > > > the
> > > > > > ordinary
> > > > > > + * ``xe_err()`` / ``xe_gt_err()`` logging rather than
> > > > > > forcing a
> > > > > > SIGID: a wrong
> > > > > > + * or over-broad classification is harder to retire than a
> > > > > > missing
> > > > > > one. When a
> > > > > > + * new situation is genuinely worth triaging, add it to the
> > > > > > list
> > > > > > below.
> > > > > > + *
> > > > > > + * Scope: software-emitted signatures only
> > > > > > + * ---------------------------------------
> > > > > > + *
> > > > > > + * This header enumerates only the situations that the
> > > > > > *driver
> > > > > > itself* detects
> > > > > > + * and reports from software: probe abort, wedged,
> > > > > > survivability,
> > > > > > driver-
> > > > > > + * detected firmware failures, engine TDR, memory faults and
> > > > > > IO/bus
> > > > > > faults.
> > > > > > + * These are the only values the driver assigns.
> > > > > > + *
> > > > > > + * Signatures that *originate* in firmware or hardware are a
> > > > > > different thing:
> > > > > > + * they are produced and identified by the firmware or the
> > > > > > hardware
> > > > > > itself
> > > > > > + * (e.g. via their own records or error counters), and the
> > > > > > driver
> > > > > > merely logs
> > > > > > + * them as they are given to us. They are deliberately *not*
> > > > > > enumerated here --
> > > > > > + * minting a driver-side id for a firmware/hardware-reported
> > > > > > error
> > > > > > would only
> > > > > > + * duplicate an identifier the reporting layer already owns.
> > > > > > The
> > > > > > two
> > > > > > + * driver-detected firmware situations below
> > > > > > (%XE_SIGID_RUNTIME_FW,
> > > > > > + * %XE_SIGID_DEVICE_FW) are software signatures: they mark
> > > > > > that
> > > > > > *the
> > > > > > driver*
> > > > > > + * observed a firmware problem, not a signature reported by
> > > > > > the
> > > > > > firmware.
> > > > > > + *
> > > > > > + * Numbering
> > > > > > + * ---------
> > > > > > + *
> > > > > > + * SIGIDs are a single flat list numbered sequentially
> > > > > > within
> > > > > > the
> > > > > > assigned range,
> > > > > > + * in the order the situations were introduced. Values are
> > > > > > stable:
> > > > > > once assigned
> > > > > > + * they are only ever appended, never renumbered or reused.
> > > > > > + *
> > > > > > + * A retired situation is deprecated in place, never re-
> > > > > > purposed.
> > > > > > + *
> > > > > > + * First-order action (resolution buckets)
> > > > > > + * ---------------------------------------
> > > > > > + *
> > > > > > + * So that a SIGID is actionable on its own, each one is
> > > > > > tagged
> > > > > > with
> > > > > > a coarse
> > > > > > + * *resolution bucket*: the first thing an operator should
> > > > > > do on
> > > > > > seeing it. The
> > > > > > + * bucket is a stable, driver-owned hint; external
> > > > > > documentation
> > > > > > may
> > > > > > refine it,
> > > > > > + * but the in-tree value always stands on its own. Every new
> > > > > > SIGID
> > > > > > must pick a
> > > > > > + * bucket, which forces the question "what should someone do
> > > > > > about
> > > > > > this?" to be
> > > > > > + * answered up front. The buckets are::
> > > > > > + *
> > > > > > + *   COLLECT  -- capture logs and open a bug report
> > > > > > + *   RETRY    -- transient or already recovered; watch for
> > > > > > recurrence
> > > > > > + *   UPDATE   -- a firmware update / flash is required
> > > > > > + *   RECOVER  -- an explicit recovery step is needed
> > > > > > (rebind,
> > > > > > bus
> > > > > > reset)
> > > > > > + *   IGNORE   -- ignore if the SIGID severity is
> > > > > > INFORMATIONAL
> > > > > > + *
> > > > > > + * The bucket is documentation only -- it is recorded per
> > > > > > SIGID
> > > > > > in
> > > > > > the enum
> > > > > > + * kernel-doc below and is not printed on the (deliberately
> > > > > > lean)
> > > > > > dmesg line.
> > > > > > + *
> > > > > > + * When to use SIGID logging
> > > > > > + * -------------------------
> > > > > > + *
> > > > > > + * The xe_log_*() helpers are for these recognised fault
> > > > > > situations
> > > > > > only --
> > > > > > + * important, operator-relevant faults and events. They are
> > > > > > not
> > > > > > a
> > > > > > replacement
> > > > > > + * for ``xe_info()`` / ``xe_dbg()`` / tracing, nor for one-
> > > > > > off
> > > > > > diagnostics;
> > > > > > + * using them for ordinary logging would dilute the fault
> > > > > > stream.
> > > > > > Not every
> > > > > > + * ``xe_err()`` needs to become a SIGID report -- only those
> > > > > > that
> > > > > > correspond to
> > > > > > + * a published situation.
> > > > > > + *
> > > > > > + * dmesg vs. the machine record
> > > > > > + * ----------------------------
> > > > > > + *
> > > > > > + * The dmesg line stays close to a normal xe error message
> > > > > > so it
> > > > > > remains
> > > > > > + * readable for admins; the only stable, machine-matchable
> > > > > > token
> > > > > > on
> > > > > > it is
> > > > > > + * ``SIGID=<n>`` (``dmesg | grep SIGID=``). dmesg is not an
> > > > > > ABI:
> > > > > > the
> > > > > > surrounding
> > > > > > + * text may change freely, and lines may be dropped. The
> > > > > > durable
> > > > > > record for
> > > > > > + * tooling is the CPER record carrying the same SIGID
> > > > > > (generation is
> > > > > > a planned
> > > > > > + * follow-up).
> > > 
> > > Ok I realize I'm coming late to the party here - I just haven't had
> > > the
> > 
> > (no worries, I was late too)
> > 
> > > time to review this in detail. I really don't like having this ABI-
> > > adjacent implementation. It feels like we will be on the hook for
> > > maintaining things in the future that will limit our ability to
> > > implement changes and debug. I get the notes that Rodrigo has
> > > above,
> > > but this just feels like the wrong approach to me.
> > > 
> > > That said, I don't want to block the work here. I know we have some
> > > users looking for this for their own debug.
> > > 
> > > You have "dmesg is not ABI" here which is a start. What happens if
> > > we
> > > decide to drop one of these messages? 
> > 
> > we don't require any use of xe_log() to be permanent (see below)
> > it can changed or dropped or replaced back with xe_err() any time.
> > 
> > > Is it only the ID itself that we
> > > want to be stable and monotonically incrementing? 
> > 
> > correct, just use of the same SIGID in the log will always mean the
> > same
> > 
> > > Or is the message
> > > itself supposed to be stable? 
> > 
> > message can be changed any time, like in regular xe_err()
> > 
> > it is just an additional hint for debug (together with SEVERITY
> > and reported errno)
> > 
> > > If we drop all references to a particular
> > > ID is that ok? 
> > 
> > yes, if the ID is no longer applicable
> > and this was already stated in DOC
> > 
> > > What if we have 10s of IDs or more that have no use in
> > > the future and we move on to the next section? We don't care about
> > > cleanup of this kind of thing? 
> > 
> > legacy SIGIDs stays forever, there will be no ID value reuse
> > (also see DOC) but due to the way they are defined, it is unlikely
> > that we will drop them
> > 
> > > Or the line above about "dmesg is not
> > > ABI" means we can really do whatever we want with it?
> > 
> > I assume the only new requirement for us would be that we
> > should not drop all xe_logs for any SIGID which is still
> > applicable (and was not replaced with other SIGID)

Well, if the code changes in a way that the function doesn't
exist anymore, what should we do?
We cannot guarantee that.

> 
> It would be nice to make that explicit in the documentation.

Right, we probably need some explicit mention about this case.
But we shouldn't commit to not remove a log line.

> 
> I'm still pretty worried about the contractual aspect of this with
> users who start relying on this. But if we take that out, from a purely
> kernel debug usage aspect, I do like having this to help categorize
> issues and flows. It seems like we should be able to do something with
> this in printk directly (or the drm_* variants) rather than having
> something specific to the GPU here. But as long as we don't make it too
> strict, hopefully we can expand if there's interest there.
> 
> Let me go through in detail later today and get back.

Yes please! :)

> 
> Thanks,
> Stuart
> 
> > 
> > > 
> > > Thanks,
> > > Stuart
> > > 
> 
