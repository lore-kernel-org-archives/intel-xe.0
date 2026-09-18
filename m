Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30FCDC982D7
	for <intel-xe@archiver.kernel.org>; Fri, 18 Sep 2026 09:41:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B48B410E0A6;
	Fri, 18 Sep 2026 09:41:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="YzU9htBU";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDFFC10E0A6
 for <intel-xe@lists.freedesktop.org>; Fri, 18 Sep 2026 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1789724465; x=1821260465;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=ec4p5plMOVAk+a37cMzFr5LiIEzGoAGr9ncMaPzohRk=;
 b=YzU9htBUP04rDGfJjlNUTiIWQ0iYy58IZgLVgMX8dXlJda8mU7fhFU0B
 JQqpTA0pEpE5HJmYZLwu9J0dLBw5q6JU0M06KUR74kRzdPWLohb3uLRq7
 3kAswn1rtHNMaDzY9RxppKWrssVkbEubXe6Gv8YNemZ63x/AKR39Wy02/
 +QCpaYOjXd4CS/CmxIOZpP2l82u2WPclU5VUz/x7bak8pqj1KNGoATlFW
 hw6qRx2uM0Ea3thZHxC5dhPsYnyFIrBDyPDPgH/ONOKvQJg5OfQBx0Dz4
 veL2thuc/BdN1yS17l7Ywo0ZEr1P8ls0wwhxhZsnF1/UZugmn+Zb6tfvu w==;
X-CSE-ConnectionGUID: axVQT2bXRPqyUyoKcf31ww==
X-CSE-MsgGUID: 1XfrAeQPQgGI2vHjQKhLzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11905"; a="89150986"
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="89150986"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:41:05 -0700
X-CSE-ConnectionGUID: SXc3xt/3TZmYUtUJ/TXgQg==
X-CSE-MsgGUID: rmlksqmcQky9UkEU/po+Ig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,103,1787036400"; d="scan'208";a="270637616"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2026 02:41:04 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 02:41:04 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Fri, 18 Sep 2026 02:41:04 -0700
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.67) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Fri, 18 Sep 2026 02:41:02 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=szZ32AkDokz58B78Pw556gcF1NYyKKRYY0uhKGL/0QXjsSBQ2qwHAWn7su1ex+Amdlo11Okt7ip6zJbft+LJ+O0z5d+zoPsqXGLLAwKXCVy2/K1426EFA3ounGjuYspZQzg6mgB3IExOOGk01NqHVuzSD6uM5TopMOgzlOJqrlYeEl/5Sv9S86IhzWxi85WMmnTXpb5KvrmTYvvqQgY1uhDUNcv762plWU/Vh07wTgcb9tnD9k0Oa+irfGpNuyUg/t2K5JK6DG1Da7Hc7k3//XkO2lmC+TilDyz0fHYTHH6qtq/4G06H1VrzqPYWDZHA0F6dfZcOXuf4GCLe0lJjZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5M4bDIALS1rL4lSHXuXKGpOK6dYd+MhTH5WE1Wb9IfU=;
 b=aR0cRxyPb3AJmUMVX/+K9WNHpeFN3GGRGNWPD5Y/kpOCBwJ/cgVed24dgd/ud9b5SMmQts3m0dfRYPkggfIb3cNgW+hhyS+1t5Nj8q2FlA0U2nYohWl715jUNlZPWE9Mhv8r4E5MxjgfNat60Odl4o9d9f+koipDq160TsIYxGyP/L2Bh89ogb10s9FJigjvAtJSKw84KPXXWbtUVZi6wo9bPt9HIo13PldX5ooIcRJ+p1+lsSNx8bnVwcKnqxUBzTuyHrsB3qa190Wbw15jBdAhxsz1JYRbHNsuHpurmgvd93bZFbOxHpEK0pWKcWFfxzUOutVDibcinj1dQlcCQw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA0PR11MB7187.namprd11.prod.outlook.com (2603:10b6:208:441::12)
 by MW6PR11MB8366.namprd11.prod.outlook.com (2603:10b6:303:24c::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.428.13; Fri, 18 Sep
 2026 09:40:59 +0000
Received: from IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565]) by IA0PR11MB7187.namprd11.prod.outlook.com
 ([fe80::be96:3f58:953d:6565%4]) with mapi id 15.21.0428.011; Fri, 18 Sep 2026
 09:40:59 +0000
Date: Fri, 18 Sep 2026 05:40:44 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: Karthik Poosa <karthik.poosa@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH v3 1/5] drm/xe/hwmon: Detect unavailable temperature
 sensors
Message-ID: <aq0HHDqoXxXFlsam@intel.com>
References: <20260910182756.638830-1-karthik.poosa@intel.com>
 <20260910182756.638830-2-karthik.poosa@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20260910182756.638830-2-karthik.poosa@intel.com>
X-ClientProxiedBy: SI2PR01CA0051.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::6) To IA0PR11MB7187.namprd11.prod.outlook.com
 (2603:10b6:208:441::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR11MB7187:EE_|MW6PR11MB8366:EE_
X-MS-Office365-Filtering-Correlation-Id: 4dc1a3c1-8bb5-4e7a-5e17-08df1568f1d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|1800799024|366016|376014|10067099003|11063799006|6133799003|18002099003|22082099003|56012099006|4143699003;
X-Microsoft-Antispam-Message-Info: vSy4cjYWCnXbM8r2Vac14+Q5OxGbxkLDu9prGR3Y2s5sAbYetMANInYqI1b1nps3QuiU6VWRb03RtuasDizdU5bvDEOzYzMBvi6Ygh9VbBrEwhQKKQa+iezyaYmy94jbXwHqL/N4OngQUR5HSwyEp0pxlXX7rexbt+PhKNr6h3LK8Uiq0WL02GDhMp/0hDUW6FUPebaFKoMqng+tlLmVDbYGNSghW4ZU7N6SDaUkoi3gj4uVuLHcwy5NLgP/fN4FFdXQRjeK0PbEbpfDFP5943IfT5vC4CfR2UYb+dbcQ4XNIuKyzyjHTphUZbeWBE5I866du3gM72qlC3BkfrrZYlOPWOoFC+2I/1LKd4Nj82pzI8hRg2CDJpSbBoRspPzRGv/kNb/dqz7HGz9nEq1Sf/UGkxI8z3w/YAlgmkKD2KmkouR4ZEc6o2bINJElmoNhmQOr09INpxJp0KcSG7aYuzl0O67fLEvQ8HZ1yA6VnDzjc3uOvPhpQpDsxURg9MMu8Z1UcvXrqKhJ7cizvDtX6b8CRazTAO9wCQRYZP2e67BA98VEtLH/wt+2yjDSQrfNaxgixmS89dK52jPqHYxS96fYj+xmxKRfrRZqjbQa7uiJtWEcbydKEYFU7jGGOcdQcG1ToJ4CvGtJ86Q1W6sF5f43xIQLQul+zvbvFAqFjkw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR11MB7187.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(1800799024)(366016)(376014)(10067099003)(11063799006)(6133799003)(18002099003)(22082099003)(56012099006)(4143699003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OjCARB21+cruoqTFH57y4pImd/Hbe7gD6REMsz1+5FHL968JemO2B7/xvZQJ?=
 =?us-ascii?Q?KZHpQLLa7AT9VAnSin0Ma9xfovOnPLmQspRMSpPx/AxpJ5CzCn9kpj5XyZOc?=
 =?us-ascii?Q?27FGXu52/8kflianzyHv1pof7wo84GP0Ibj4P1DGPXy/A48BCn6jlOl/KkCP?=
 =?us-ascii?Q?mH9jsrVgWw/IyM3BSO+K+l3BnTJKydVoMo3jaiDQEes+V4hJSyQP1owDQuL5?=
 =?us-ascii?Q?sYap/nmt9UIv0tW7L1JqBMhypeWTXi8kivTAoozb2ZRbGNPI/QpZUmjriAqM?=
 =?us-ascii?Q?IxdwmkXVM96OpyZ/qryluQo0mUIh9mtsemNV5UHTDxKSQYcTE5t1Wc+i8aMA?=
 =?us-ascii?Q?5I4BnRr9ZUmTFORVGBa7D8rp0TfonXtXjZU17bx/R3Es0paLV57wvfIJQmnG?=
 =?us-ascii?Q?E/HVkvQP0P9SNTOLHdrLcfnAd9vbHRaUSpfR2ARGditXaM0ei79dtEzyMicY?=
 =?us-ascii?Q?34Nb19cprGfxKgSxCUqzdneQtoSlzJQIaf2eMqE0jRCodr76gS7UUBout132?=
 =?us-ascii?Q?53TAgWw3eT/p8Be+XpLFmEynnUAu9085dX5yYlQdva0oakh6SsZfn5q4l8tY?=
 =?us-ascii?Q?1PVsJoDug/ZiUBJUYnb1W3gxJs9tferZ32D4P5kNu9mhCQNdtO2V8bPG4boz?=
 =?us-ascii?Q?JfAz5pPw2/KeSSta8a/KS8roAdgiYmNiwqiRHrV5tMgv1hAIE47azjzCmq64?=
 =?us-ascii?Q?QQRXxw7Co3rfgUoENXjlXtVEBPyv7l31/vNWewI7bO03nNdQ+HXiZDUZTH5Y?=
 =?us-ascii?Q?u8CjQNXaXznqoy+Unp9fEeipzYaLozbQpRmAN/3xUM/MIOzN67IQU3du5dfl?=
 =?us-ascii?Q?ZuWhypYrCE5xjOnSHB5L8r8Ug2iQ4LFaVvm1KgMATIqW8CYoZgEkA58pCDvr?=
 =?us-ascii?Q?ZFZ6imjhL+bX806mMbGn3b872+IiqHQSSpAIb7gtUeMOROv3p1KISD3fWPVo?=
 =?us-ascii?Q?YbZf+MhXHpGbIfGsfzlVtvKuxWDD551C8e89oHeOwl8ujKavhqGLJquyCwQD?=
 =?us-ascii?Q?vOlXYwS/Wz6sjHNpakrzlYLIjLdvZCzIYbxRJqYe7fE0xIxAwr9rntMJM+dH?=
 =?us-ascii?Q?aEWVO9U5UxBNleAY3wAhfzQISWiczf+LjIokDuvR6vga39THDaDjT6s9ZfFK?=
 =?us-ascii?Q?GIIvnCy5Dswic3hjzYNxPtEP0ktk4ZnenI618Hev01HtejDN4M0jIeibvoIO?=
 =?us-ascii?Q?HXH/9UNv2JoVMik5MWXtE7wnsZ84d9C/IKto4b5QYUwZEUDEBs3SVh3iXezo?=
 =?us-ascii?Q?hyZcJ37hT6QkPszIUfDxDMh5nuTxja09e3NKRLKzr3U/naJrL3BwfoTk8BlE?=
 =?us-ascii?Q?jgfIzNOsqdNpxf43n5Hg/Lop+FUe2/wvT9rzs96hDpUnqpEOjNHm02g+xKe2?=
 =?us-ascii?Q?cVCkqAGbJE6dOnxjEz34naoPD8D7vjVC1R0FJbFvhL6hLSo+XTMoIxrzNwl8?=
 =?us-ascii?Q?yIWCJLrQzkOmh+5mBEnU6/ZXX4rzqg9ROkxcdd9Bk92OJS1ABuMuvZDYI8S/?=
 =?us-ascii?Q?HPfvYCagmwWR588hrHlcSEjvw3hbUl8z8xnsdk3dGZ+SJ5c0o6tr4sP3WgG2?=
 =?us-ascii?Q?I11zRF8wrXWQkYpBLewX7H4NcpwOM4NVvZYfI6pe4sf5P65ImfznuYlK3NfW?=
 =?us-ascii?Q?BQWSnpwMyyXWxsvDHl5VXmwWBrHa9MPqXKoJsVL9dP9HXVCWA2HSS7p0BOa+?=
 =?us-ascii?Q?mmZcF4D/63jc4AJizFHHyX6Q9Pzg/Q9wJAAPQOR9RlbJUS/bklaJtUlhui4P?=
 =?us-ascii?Q?KZSGgrr+cgoaxW/0avVLDY+FhQB2nRw=3D?=
X-Exchange-RoutingPolicyChecked: KrnTC8ibmN/YEiBAyAE1yLe8AqnL1LTmd3fPo3i5ho+ktUDpIddfefVQeCn/EDmW3DXOlsoJyM0wv3o55Lawpv63wh+amSNGuauVPvdq/DqVzCEC71L5sVh4MQi012NcvegcBGd+ANWYbmAWvdFN0XN5lBGAG3KfspujWEQkApMiwbP04QXu9Kgt3NSUUnDXwEeevZMjQ77ALMVeHTYeslUgKWP4sk4dv24+DUs1uyqfWwOSvVyfAc5S0DwP3BF6i8E+9m8hfRKHV5IFsuMm+HbTFIUhvDwHB0XdY/S9JKGL9XoNknb0pdZ835bI2+zKT9QjiM3dka25wBFXxdhoNA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 4dc1a3c1-8bb5-4e7a-5e17-08df1568f1d6
X-MS-Exchange-CrossTenant-AuthSource: IA0PR11MB7187.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2026 09:40:59.3180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAv/CwCoph7rfkxwePERvUasVjsQHHSQseUUeynrGodLx7EQ572fDXAFBk71bHWoCIa7+czMvXq6+B1HJDHZfA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8366
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

On Thu, Sep 10, 2026 at 11:57:52PM +0530, Karthik Poosa wrote:
> Add is_temp_available() to validate sensor presence.
> A temperature reading of 0xFFFFFFF on MMIO and 0xFF from mailbox on CRI
> platforms indicates that the corresponding sensor is not present and
> should be treated as unavailable.
> 
> Use this check from xe_hwmon_temp_is_visible() callback so that attributes
> for unavailable sensors are not exposed during hwmon device registration.

I'm afraid this patch is doing much more than what stated here.
Please split this patch into smaller sections.
It is likely regressing older platforms becuase it is hard to spot the
differences.

> 
> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
> ---
> v2:
>  - Address review comments from sashiko-bot@kernel.org.
>  - Address review comments for Badal, Raag.
>  - Update is_temp_valid() to check values based on mailbox or MMIO.
>  - Add is_temp_is_visible().
>  - Update is_vram_ch_available() to is_temp_available() to check if sensor
>    is present.
> 
> v3:
>  - Rephrase a debug log.
> 
>  drivers/gpu/drm/xe/xe_hwmon.c | 100 ++++++++++++++++++++++++----------
>  1 file changed, 71 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
> index 5284cab6703d..faed2f5da394 100644
> --- a/drivers/gpu/drm/xe/xe_hwmon.c
> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
> @@ -813,12 +813,20 @@ static int xe_hwmon_pcode_read_thermal_info(struct xe_hwmon *hwmon)
>  	return ret;
>  }
>  
> +static inline bool is_temp_valid(const struct xe_hwmon *hwmon, u32 value, bool is_mmio)
> +{
> +	if (hwmon->xe->info.platform >= XE_CRESCENTISLAND)
> +		return value != (is_mmio ? U32_MAX : U8_MAX);
> +
> +	return value != 0;
> +}

first of all, please use 2 separate functions for this.
second, you have a bug here and the mailbox logic is never protected s8 is passed,
so U8_MAX will never work.

LLM suggestion:

static bool mmio_temp_valid(const struct xe_hwmon *hwmon, u32 v)
{
        return hwmon->xe->info.has_mbx_temp_sentinel ? v != U32_MAX
                                                     : v != 0;
}

static bool mbx_temp_valid(const struct xe_hwmon *hwmon, s8 v)
{
        return hwmon->xe->info.has_mbx_temp_sentinel ? v != (s8)0xff
                                                     : v != 0;
}


> +
>  static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  {
>  	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>  	u32 *dword = (u32 *)hwmon->temp.value;
> +	int ret, i, count = 0;
>  	s32 average = 0;
> -	int ret, i;
>  
>  	for (i = 0; i < DIV_ROUND_UP(TEMP_LIMIT_MAX, sizeof(u32)); i++) {
>  		ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_THERMAL_INFO, READ_THERMAL_DATA, i),
> @@ -828,11 +836,23 @@ static int get_mc_temp(struct xe_hwmon *hwmon, long *val)
>  		drm_dbg(&hwmon->xe->drm, "thermal data for group %d val 0x%x\n", i, dword[i]);
>  	}
>  
> -	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++)
> +	for (i = TEMP_INDEX_MCTRL; i < hwmon->temp.count - 1; i++) {
> +		if (!is_temp_valid(hwmon, hwmon->temp.value[i], false))
> +			continue;
>  		average += hwmon->temp.value[i];
> +		count++;
> +	}
> +
> +	if (!count) {
> +		drm_dbg(&hwmon->xe->drm, "Memory controller temperature unavailable!\n");
> +		return -ENXIO;
> +	}
> +
> +	average /= count;
> +
> +	if (val)
> +		*val = average * MILLIDEGREE_PER_DEGREE;
>  
> -	average /= (hwmon->temp.count - TEMP_INDEX_MCTRL - 1);
> -	*val = average * MILLIDEGREE_PER_DEGREE;
>  	return 0;
>  }
>  
> @@ -852,7 +872,13 @@ static int get_pcie_temp(struct xe_hwmon *hwmon, long *val)
>  		data = REG_FIELD_GET(PCIE_SENSOR_MASK, data);
>  
>  	data = REG_FIELD_GET(TEMP_MASK, data);
> -	*val = (s8)data * MILLIDEGREE_PER_DEGREE;
> +	if (!is_temp_valid(hwmon, data, false)) {
> +		drm_dbg(&hwmon->xe->drm, "PCIe temperature not available\n");
> +		return -ENXIO;
> +	}
> +
> +	if (val)
> +		*val = (s8)data * MILLIDEGREE_PER_DEGREE;
>  
>  	return 0;
>  }
> @@ -951,19 +977,39 @@ static void xe_hwmon_get_voltage(struct xe_hwmon *hwmon, int channel, long *valu
>  	*value = DIV_ROUND_CLOSEST(REG_FIELD_GET(VOLTAGE_MASK, reg_val) * 2500, SF_VOLTAGE);
>  }
>  
> -static inline bool is_vram_ch_available(struct xe_hwmon *hwmon, int channel)
> +static bool is_temp_available(struct xe_hwmon *hwmon, int channel)
>  {
>  	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
> -	int vram_id = channel - CHANNEL_VRAM_N;
> -	struct xe_reg vram_reg;
> +	struct xe_reg reg;
> +	u32 reg_val;
>  
> -	vram_reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> -	if (!xe_reg_is_valid(vram_reg) || !xe_mmio_read32(mmio, vram_reg))
> -		return false;
> +	switch (channel) {
> +	case CHANNEL_PKG:
> +	case CHANNEL_VRAM:
> +	case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> +		reg = xe_hwmon_get_reg(hwmon, REG_TEMP, channel);
> +		if (!xe_reg_is_valid(reg))
> +			return false;
> +
> +		reg_val = xe_mmio_read32(mmio, reg);
> +		if (!is_temp_valid(hwmon, reg_val, true)) {
> +			drm_dbg(&hwmon->xe->drm,
> +				"channel %d temperautre unavailable, val 0x%x\n", channel, reg_val);

typo

> +			return false;
> +		}
> +
> +		if (channel >= CHANNEL_VRAM_N)
> +			sprintf(hwmon->temp.vram_label[channel - CHANNEL_VRAM_N],
> +				"vram_ch_%d", channel - CHANNEL_VRAM_N);
>  
> -	/* Create label only for available vram channel */
> -	sprintf(hwmon->temp.vram_label[vram_id], "vram_ch_%d", vram_id);
> -	return true;
> +		return true;
> +	case CHANNEL_MCTRL:
> +		return hwmon->temp.count && !get_mc_temp(hwmon, NULL);
> +	case CHANNEL_PCIE:
> +		return hwmon->temp.count && !get_pcie_temp(hwmon, NULL);
> +	default:
> +		return false;
> +	}
>  }
>  
>  static umode_t
> @@ -973,14 +1019,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_emergency:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_SHUTDOWN]) ? 0444 : 0;
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_vram_ch_available(hwmon, channel) &&
> +			return (is_temp_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_SHUTDOWN]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -988,14 +1033,13 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_crit:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT] ? 0444 : 0;
> -		case CHANNEL_VRAM:
> -			return hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT] ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_CRIT]) ? 0444 : 0;
> +		case CHANNEL_VRAM:
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return (is_vram_ch_available(hwmon, channel) &&
> +			return (is_temp_available(hwmon, channel) &&
>  				hwmon->temp.limit[TEMP_LIMIT_MEM_CRIT]) ? 0444 : 0;
>  		default:
>  			return 0;
> @@ -1003,7 +1047,8 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  	case hwmon_temp_max:
>  		switch (channel) {
>  		case CHANNEL_PKG:
> -			return hwmon->temp.limit[TEMP_LIMIT_PKG_MAX] ? 0444 : 0;
> +			return (is_temp_available(hwmon, channel) &&
> +				hwmon->temp.limit[TEMP_LIMIT_PKG_MAX]) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> @@ -1012,13 +1057,10 @@ xe_hwmon_temp_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>  		switch (channel) {
>  		case CHANNEL_PKG:
>  		case CHANNEL_VRAM:
> -			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_TEMP,
> -								channel)) ? 0444 : 0;
>  		case CHANNEL_MCTRL:
>  		case CHANNEL_PCIE:
> -			return hwmon->temp.count ? 0444 : 0;
>  		case CHANNEL_VRAM_N...CHANNEL_VRAM_N_MAX:
> -			return is_vram_ch_available(hwmon, channel) ? 0444 : 0;
> +			return is_temp_available(hwmon, channel) ? 0444 : 0;
>  		default:
>  			return 0;
>  		}
> -- 
> 2.25.1
> 
