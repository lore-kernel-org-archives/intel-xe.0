Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F00CDB465
	for <intel-xe@archiver.kernel.org>; Mon, 16 Oct 2023 15:52:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1DB1F10E20D;
	Mon, 16 Oct 2023 15:52:45 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.93])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 882D510E207
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Oct 2023 15:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1697471562; x=1729007562;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=MvlVj+j6fOhptSwPrtNdP8VBJ33z29HFjexes8OKdys=;
 b=m2gvZ4i8wIeDe7wvBkCJivRWM2u8atjzAyhHBBlVUCcwCNeOdGGRyit8
 VK87jSFr0rHQLyDPk4Xy40cDhvyfmOs1ljrs72JbexDWukbiKmKRpfujJ
 FkEG8htvq+KZK93CVUdt6VG7EBWXFmrgQRAtoeSc3TZX2XZCR6Tn2vtIl
 s096PCWT09FneydJanlkr7fOf1rm60h/66lYlksqH9pByZ7xPnQCA0xbx
 U06aXPUQQpNu2BToOBtnJANcdi3LJtCmkGp6ZlH9ZemM4gY5z8i0B2Ac0
 Wbb1pZz1HOynbp0BOtwtwdzPa3fUhInDirEdItGgfelpuTFtuA5WgVsQ6 g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10865"; a="382781189"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="382781189"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by fmsmga102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Oct 2023 08:52:01 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10863"; a="879465768"
X-IronPort-AV: E=Sophos;i="6.03,229,1694761200"; d="scan'208";a="879465768"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga004.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Oct 2023 08:51:59 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:51:58 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 16 Oct 2023 08:51:58 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 16 Oct 2023 08:51:58 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 16 Oct 2023 08:51:57 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gLhhFXlVm8YNv0sCXBvMHh/nEDVf1iT7ECAqFRnYEZ0NGc7DqighdaqNPdVZur0HEZlhf0cSiGa9QuJTFh1Cmv57gAxQopCgpTi56tW7mw/j+9WlKIXfm5AZiJpx7V5+Jjg3Nrahr2JCc6lnDba985v6l2L8XOeRJp8N6Hi9GDsn5ryhJqPxjG0wQfdlUcHMEVoVxiXpoFfMZBW6x2V4O8Of50TZ6grjPVGWlVLMjV1bFFNFF7TyD5DRFafnlCHTX14eIz/E5F46OQ8BLbShCnttcwjpQmAUjkFb2AXru+m3NvZjqdtSXm3hweEhfTZk5Irnpl57iV6rO9lDduHaJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jIlBkxOIrtSlj+9qWhpOLhuKkpryYk7iAVcMEE1infM=;
 b=R5QTxQuvZW3SZKeqAIm/XIgLEvtEB0SitdH0hpbgEzTJW3cQxFulxT0ueaAcml9DtxAHlmnzBSqKgO0G03ECkT1IWxOaQ+Be6rAqOcrylF4zwDqpAhGPQbzG9NfbxkD4/TijlECWjCC0PwRxe4IoGYDKJ7aQ//0q3ekcpptVZRM3KvktN/LnmQ78jrCvCJyjfNnGNa4w1cGuujD5Axcuz1yrrRKnTnuYusapaZLlyTYKD1HoRysZu4COgkiufLMqR+FmKDB2gqd7q1BS9YjgU53EsDu0kJxJwXBwBHlnBRnZtDH9rTrmy93nG4XdnC7fgKd/94O9I4VoLWxUkjXi2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CH3PR11MB8773.namprd11.prod.outlook.com (2603:10b6:610:1cb::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6886.36; Mon, 16 Oct
 2023 15:51:56 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::f345:2318:9a82:51b5%7]) with mapi id 15.20.6886.034; Mon, 16 Oct 2023
 15:51:54 +0000
Date: Mon, 16 Oct 2023 10:51:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Koby Elbaz <kelbaz@habana.ai>
Message-ID: <qvuhtciy6gasz4s5f5opebdepse7x2ubfttnb4alhjq4e5zz4b@fjs6d67fcmex>
References: <20231015122307.1191684-1-kelbaz@habana.ai>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231015122307.1191684-1-kelbaz@habana.ai>
X-ClientProxiedBy: BYAPR07CA0089.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::30) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CH3PR11MB8773:EE_
X-MS-Office365-Filtering-Correlation-Id: 5950cef2-eab2-4b88-2886-08dbce5fd230
X-LD-Processed: 46c98d88-e344-4ed4-8496-4ed7712e255d,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: jegtLkQyKI3a00tpWhAk5zW+KJ8rERqgKBsIV1VM/mMjc+39GRA6MdB9SemgUJpaUoNJcxuqYj2QlNozwbiZQBO8T8uc7HcfybAMz9+v/cym8MfUqJ2wyzaRcrDnBC7gayxU1Mt2S4gP7zNqT+NQnhdOm5Hy/Xd7N4wSDuc1hZ58ZAaTXIc06tvP+mw828WMCXd5WFlf0xT8agU8kOok9wK7ylY7APh79v/zyr4FrdhtzP7x0kZ6sSJAhv9fQQoOcefqxhs6RwHkxuMTHgbCAHCPBPoYtwUrY6idNlv79qhkw/gWCuYkd3V9+nFlP6zXiIL1gAlR02x+Lzz5ymkW6+mp7GzHEu9fTeHPYxnEzip+8Pwiw+wcwXcoAgV3ChAxA+ZWAMQInT/MKvcTtZauVHNK9jpJXhv7K/dQ15bFfFt621m8MkFB9PspS0f2WXrB3xj/xmepouWK9/JcYQh1sUBjht11IBk0Fjzw2vK67tG39y7Y8bw61cWTheDdkcbltbtgbNf+JYBZtA9tEfJyi/2/vq4wzUslJC76Ve60iFW35Z6x7sJdAWz8anatnsCB
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(396003)(136003)(346002)(39860400002)(366004)(376002)(230922051799003)(1800799009)(186009)(64100799003)(451199024)(6486002)(316002)(66476007)(66556008)(478600001)(6916009)(66946007)(6506007)(9686003)(6512007)(26005)(2906002)(5660300002)(33716001)(8676002)(8936002)(4326008)(41300700001)(86362001)(82960400001)(38100700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?DQJBoCV3l7CVFcq8WFUS5K6XuaOSMW0NjHPgsO9OESsVr2hwIJCuTGVkNNEx?=
 =?us-ascii?Q?mnGx0DwxwX1K0jo3jwI9X7RGPyN4UnNAu5ibh8VGvRQAqeT0A27mzPY7d/Dm?=
 =?us-ascii?Q?GKD9H19LlLmY32/b/M43YMu8ot4zD1fJoND80oJyEaZ27Mdcdk5CUWKU9D6f?=
 =?us-ascii?Q?lywba4LMEbRtJ4LC47WSOaDc+RHgdB77iA8BzojX/vIFKxQTQqgcHWzbeAyk?=
 =?us-ascii?Q?kK3LLT4rceP+pg5HEGuvmcvTTii4wdfpJVk5+QW8i7ibGSOw8+Bu1aJNWxKy?=
 =?us-ascii?Q?PikIelL4BRUmyEYmSlhlU8IB5eY6gRbYZENWrXS0WZeSWKEBUX6McNCdMAgp?=
 =?us-ascii?Q?LxG23O5shE+Rm5U1vm2hSXXyXC9jLifDyOsNnF2or/OmG1I6eVFY47Ldee9V?=
 =?us-ascii?Q?DPXabZi1Nrn8WxqmoTOTWjszzl43yBGOktJNCQqxvXWXf/ns2g8yCaSjENqa?=
 =?us-ascii?Q?nwUWDSLw8n3e7T2WfQU09ojZHZsFLmr4EE4uLsU/wkaY/E/gJSbYljw0bK1b?=
 =?us-ascii?Q?syrvX87pHqa69mRpaqF6Gt/IHzTyzZPp2GzFufXiLOKntk/XrfaVz+0ZLw1P?=
 =?us-ascii?Q?2RQPdduGgEcGhMFtI2KVU/1bQFpT+XvYnSkyu5IAXOeuYznojcDUQRaofzvc?=
 =?us-ascii?Q?eJ4tE+9HEjQiALIZf6e70nKBAOL9PqstN3a4kp5seJ96LHmyu0bGLpu271IZ?=
 =?us-ascii?Q?+lRfMzPLbuc1bbOvN7usZiqIT4iiSMwi84t/jOxcNbPDWUdc2XsyqsOg2Xnq?=
 =?us-ascii?Q?Ch4sQBTHFnvUvI+53bEep67roHllKDfw1ntpgROt4mycHSiCy2A7/gw12qH5?=
 =?us-ascii?Q?EJZqeMt1HlGpWVkRp3Ip2FM+TUGJvF7x93ZSO8TlRlNR5KEgkHxh/GgrTe+n?=
 =?us-ascii?Q?5CNzwqIHJATQnZqg71cpPEpUA0exCDrfirxPwtgGE5x21q3f5ayRDDGBv8mX?=
 =?us-ascii?Q?llWDz3wSLDWJDNTyAFN71UyywJovStHjeBhWonHXSFZ5T4728P3rsGXiZowJ?=
 =?us-ascii?Q?otVt0GA21ZzleaIOcYeSsHwbT0gSZU9vA7UrryfUJjkz0bZFRPuVacGfs8LQ?=
 =?us-ascii?Q?TOCSqsaV/zIWaGgTXcb0i6/nYqC/ypE9dYyq1l8mZqp+NnTSxUVZPjBo7cPW?=
 =?us-ascii?Q?er98sJC6gdpAc7PzyunlzhFUuNC0n+G48fJjlYOC80FUqyQk1KEAJAIXO+7E?=
 =?us-ascii?Q?Xn6G4Q+yssZINpql6TtU/FY5WLRBnCarKIY5Z7qdqi8HxO0kaEEBLGhIuHhz?=
 =?us-ascii?Q?9iFu8bg0X/F6K2qYlwm3/o4nx0TRKhtGDjYYM8mMTqYwNugBpDLVPWdmcMrK?=
 =?us-ascii?Q?+7n2/1B23f5QAEtSoaJXTsqP8fwRV4rSpsTdpWGt3aHxkl51EUD8W1Dotj6k?=
 =?us-ascii?Q?mLNk/+p/s/ibyp+p2U9NCz9YIEXASrJZAmnLEnn8JvXkMP2pdVVxKSap3Pu3?=
 =?us-ascii?Q?jUrLvrPc+ZB7wgTjANUBTucbnXQlBq+BZTA4esMmo8z1SzxDbHeLgmHcRNls?=
 =?us-ascii?Q?htXRj2tRq05BSJf3ffcxYDD0+iwK1w2q7nKm3CcT1CUpUtw+HbS6RSM/MoFw?=
 =?us-ascii?Q?LydjjNQjng5DaG05/deNE1hiTIu+5FEgrn/YNXatruZd5Vh/vjsUwmMdLEVR?=
 =?us-ascii?Q?zA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 5950cef2-eab2-4b88-2886-08dbce5fd230
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2023 15:51:54.8642 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z3Kva7zn0o9KFfy7xhiHtuxcT5NUmXRIqSk9H7FFv177ImjYA4fiZs84W8NPyDlQN75g6fDpyKRBpz1vgaJmK9hRIhEm6AIMnW/uLToGW9s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR11MB8773
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: add has_pcode flag
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Sun, Oct 15, 2023 at 03:23:07PM +0300, Koby Elbaz wrote:
>Per device, this flag indicates whether PCODE uC exists.
>
>Signed-off-by: Koby Elbaz <kelbaz@habana.ai>
>---
> drivers/gpu/drm/xe/xe_device_types.h |  2 ++
> drivers/gpu/drm/xe/xe_pci.c          | 13 +++++++++++++
> drivers/gpu/drm/xe/xe_pcode.c        |  9 +++++++++
> 3 files changed, 24 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index bc375ddda5a7..8e327673c05c 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -257,6 +257,8 @@ struct xe_device {
> 		u8 bypass_mtcfg:1;
> 		/** @supports_mmio_ext: supports MMIO extension/s */
> 		u8 supports_mmio_ext:1;
>+		/** @has_pcode: device has a PCODE uC */
>+		u8 has_pcode:1;

please group has_pcode with the other has_* flags, although I wonder if
we could have some other name so we don't have to update all the current
platforms (and probably miss some that are WIP).

>
> #if IS_ENABLED(CONFIG_DRM_XE_DISPLAY)
> 		struct {
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index 99ccee07f8cd..2aac0f4df50c 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -61,6 +61,7 @@ struct xe_device_desc {
> 	u8 has_llc:1;
> 	u8 bypass_mtcfg:1;
> 	u8 supports_mmio_ext:1;
>+	u8 has_pcode:1;

ditto

> };
>
> __diag_push();
>@@ -212,6 +213,7 @@ static const struct xe_device_desc tgl_desc = {
> 	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc rkl_desc = {
>@@ -221,6 +223,7 @@ static const struct xe_device_desc rkl_desc = {
> 	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> static const u16 adls_rpls_ids[] = { XE_RPLS_IDS(NOP), 0 };
>@@ -236,6 +239,7 @@ static const struct xe_device_desc adl_s_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_S_RPLS, "RPLS", adls_rpls_ids },
> 		{},
> 	},
>+	.has_pcode = true,
> };
>
> static const u16 adlp_rplu_ids[] = { XE_RPLU_IDS(NOP), 0 };
>@@ -251,6 +255,7 @@ static const struct xe_device_desc adl_p_desc = {
> 		{ XE_SUBPLATFORM_ALDERLAKE_P_RPLU, "RPLU", adlp_rplu_ids },
> 		{},
> 	},
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc adl_n_desc = {
>@@ -260,6 +265,7 @@ static const struct xe_device_desc adl_n_desc = {
> 	.has_display = true,
> 	.has_llc = true,
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> #define DGFX_FEATURES \
>@@ -272,6 +278,7 @@ static const struct xe_device_desc dg1_desc = {
> 	PLATFORM(XE_DG1),
> 	.has_display = true,
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> static const u16 dg2_g10_ids[] = { XE_DG2_G10_IDS(NOP), XE_ATS_M150_IDS(NOP), 0 };
>@@ -295,6 +302,7 @@ static const struct xe_device_desc ats_m_desc = {
>
> 	DG2_FEATURES,
> 	.has_display = false,
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc dg2_desc = {
>@@ -304,6 +312,7 @@ static const struct xe_device_desc dg2_desc = {
>
> 	DG2_FEATURES,
> 	.has_display = true,
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc pvc_desc = {
>@@ -312,6 +321,7 @@ static const struct xe_device_desc pvc_desc = {
> 	PLATFORM(XE_PVC),
> 	.has_display = false,
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc mtl_desc = {
>@@ -319,11 +329,13 @@ static const struct xe_device_desc mtl_desc = {
> 	.require_force_probe = true,
> 	PLATFORM(XE_METEORLAKE),
> 	.has_display = true,
>+	.has_pcode = true,
> };
>
> static const struct xe_device_desc lnl_desc = {
> 	PLATFORM(XE_LUNARLAKE),
> 	.require_force_probe = true,
>+	.has_pcode = true,
> };
>
> #undef PLATFORM
>@@ -576,6 +588,7 @@ static int xe_info_init(struct xe_device *xe,
> 	xe->info.bypass_mtcfg = desc->bypass_mtcfg;
> 	xe->info.supports_mmio_ext = desc->supports_mmio_ext;
> 	xe->info.tile_mmio_ext_size = graphics_desc->tile_mmio_ext_size;
>+	xe->info.has_pcode = desc->has_pcode;
>
> 	xe->info.dma_mask_size = graphics_desc->dma_mask_size;
> 	xe->info.vram_flags = graphics_desc->vram_flags;
>diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>index 4a240acf7625..d895cb1e16c7 100644
>--- a/drivers/gpu/drm/xe/xe_pcode.c
>+++ b/drivers/gpu/drm/xe/xe_pcode.c
>@@ -61,6 +61,9 @@ static int pcode_mailbox_rw(struct xe_gt *gt, u32 mbox, u32 *data0, u32 *data1,
> {
> 	int err;
>
>+	if (!gt_to_xe(gt)->info.has_pcode)
>+		return 0;

I think we should rather protect the functions that are exported from
xe_pcode.c, not this one.

Lucas De Marchi

>+
> 	lockdep_assert_held(&gt->pcode.lock);
>
> 	if ((xe_mmio_read32(gt, PCODE_MAILBOX) & PCODE_READY) != 0)
>@@ -249,6 +252,9 @@ int xe_pcode_init(struct xe_gt *gt)
> 	int timeout_us = 180000000; /* 3 min */
> 	int ret;
>
>+	if (!gt_to_xe(gt)->info.has_pcode)
>+		return 0;
>+
> 	if (!IS_DGFX(gt_to_xe(gt)))
> 		return 0;
>
>@@ -280,6 +286,9 @@ int xe_pcode_probe(struct xe_gt *gt)
> {
> 	drmm_mutex_init(&gt_to_xe(gt)->drm, &gt->pcode.lock);
>
>+	if (!gt_to_xe(gt)->info.has_pcode)
>+		return 0;
>+
> 	if (!IS_DGFX(gt_to_xe(gt)))
> 		return 0;
>
>-- 
>2.34.1
>
