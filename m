Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D23FFC76196
	for <intel-xe@archiver.kernel.org>; Mon, 10 Apr 2023 18:37:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFB110E220;
	Mon, 10 Apr 2023 18:37:33 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D56DD10E421
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Apr 2023 18:37:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681151851; x=1712687851;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=HMkk1yW65woggIoXzls89B/ARIH7o8CiwsofwMDCXqU=;
 b=PIN2AQWdq2aiP3zqeMxH6Mo6yitw1HcQuxXFIUwo09VOnGR551zZGUoa
 xTvqA3yZP9zEYQSAXHdCXKOzPutWrQFFVoltnIev2obL0/YP9ryDsjWhg
 cEkH0Ca/eCO/HuBXLtQJrlprLh2MCsbJvuiSXsiuvVlyDj8TWcUlGU/od
 gBiBxva8SvBtz55Y+ZWeauurxokSkqYyM++e5E9TdkXC6A1UwSIu+zYle
 lhbfAHd6s2Ozr405VKAfeG1Ai+qGHN6Eo/DevuzHFMc/ms750lSwLiRET
 NAVrVpKa3n6QJjDN8/HvlZTDyQ17M9xu0eb8MOG4C7Ew9SZY6AKlT/M81 A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="408564727"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="408564727"
Received: from orsmga006.jf.intel.com ([10.7.209.51])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Apr 2023 11:37:31 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10676"; a="665694658"
X-IronPort-AV: E=Sophos;i="5.98,333,1673942400"; d="scan'208";a="665694658"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by orsmga006.jf.intel.com with ESMTP; 10 Apr 2023 11:37:31 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 11:37:30 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Mon, 10 Apr 2023 11:37:30 -0700
Received: from FMSEDG603.ED.cps.intel.com (10.1.192.133) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Mon, 10 Apr 2023 11:37:30 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.105)
 by edgegateway.intel.com (192.55.55.68) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Mon, 10 Apr 2023 11:37:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dB0fLOhxCM7Nn0R6yYeHYGm0IfJKLPIYIerbz25nGP9WNn5ae+DQrGFFSO71vmHa02ZuyjHHQtDlWfMk66+Mp3HqxzovaYaIHUI/lRvQ/sje+gmRZvflJP8Zd9xQU/ts/RCDyUpGc3e2G7uyei7A5GIEAGZlHlvgGCotdjIKwuIpC4uQ/dDJM8DBioWzcaXBrjP6gX/VsgdFSdolN5q9a06jU3dTLT7zf1FggqINkl3yQJA01/JltvAslNCuYOG88pCYPvgnzM9M92IGotvNxYAKyjb2XP+sH74XO9cexv1fLTM6wttbd8qGQxqKrIy+byzQ0p3/V8av2bSKurd9SA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LNe2J8QdruGXutHrqxxaI47c2geM1GrE/QXOVF6qQgY=;
 b=f+zrJsR4BXgRF+g+GZx1dF7BWUmE6eglNg3P4Jn1xXm5mlmUTgXlHCDTFEjM4jEHGuZWBnr9ExIYE+iVspaDa7jge0nwdON21FhUU0pmKTUIVpvQ3hradsumGlmEcvace+XMPjTmVuir2Smr8Tdzeyjp/6ebInU9IgOC4Wgwty6TlGPAXh5ESq8qnWIXrR5v9eeclAZXySoCcUPnq24K6SGViX/QwNJyzPcxwiCsitirFjIL4LtrfKzlItmhF0xCYouH1QDUPu5Y9v2jAWduxwL7MgoDj+DfCTDxf9JgIaZqWBE3WCDzBb5kXbiLPjVuf/RzOCulyBY64yvoUw4jsg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB5023.namprd11.prod.outlook.com (2603:10b6:a03:2de::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6277.35; Mon, 10 Apr
 2023 18:37:28 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%6]) with mapi id 15.20.6277.038; Mon, 10 Apr 2023
 18:37:28 +0000
Date: Mon, 10 Apr 2023 11:37:26 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Anusha Srivatsa <anusha.srivatsa@intel.com>
Message-ID: <20230410183726.r7hsj55yuqaouuyq@ldmartin-desk2.lan>
X-Patchwork-Hint: comment
References: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20230410180504.2706189-1-anusha.srivatsa@intel.com>
X-ClientProxiedBy: SJ0PR03CA0213.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::8) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB5023:EE_
X-MS-Office365-Filtering-Correlation-Id: 40e154a7-63e2-49ef-7b1d-08db39f2a2e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u4Y1D1nqv3DUSbPaaG1X9kgitiun9CvexPchfBry5Ij/4vbpUBAalnTOg3fkcurm/h2NMiyXXTaVf1EAdPu/N+3awtgfSFV674+GH4rN0HX1l5C3B1aWR8/qWNUiqMpgrQJN84aFYohjsHApQdOEQ9GSmnBlEVhPQCkN/m67Y/GD3tEpxwHVK6N0uALw8aEbjHaUtj/e6KR2A+zXsjksPZvuLMl+opyKVWIWEPU5NNucHMhR44JiQ6QkICHB0jH8UzJ5cmVlqpHF7uefdy1dpyL5q5CxrQq1bj/7hDtT9qcz9muI/QuFvZRDLszmag4IGf91ibspFeBDUBn23h2sU8i5poiLfmp45uSap+elDFEFqdyqfrrJ+WX7ZIGc/lXMqsDEVUYhbMR8NQ2/4NipVmUW7B7pCwB4AKoPZPj1G4Vd8mAf8/56anpAPkbGLmYVy+rktLnMCpgbO0Bf1S6WiiPH9fUcrTJj7hpQ5j+VLErB+jAHb0IvpPVpfjENIPuI+lraDPNeolXFH07BTqAqpqvBhyxNGAbw7P8ocEseG3RZi0QHyeaX8ruSuKVFKTld
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199021)(6486002)(6636002)(66476007)(8676002)(478600001)(4326008)(66946007)(66556008)(41300700001)(316002)(36756003)(86362001)(6506007)(9686003)(6512007)(1076003)(26005)(107886003)(8936002)(2906002)(5660300002)(6862004)(38100700002)(186003)(82960400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mS8B4lmk65T15hVNousVPvPhx6bARdH/6l18AwydUy2FJREfe5IXRj3QL6kx?=
 =?us-ascii?Q?BbzeTOxOAkZDTCaJX/OLDWGhcv6BYPg0LsrOzX39xze3WHzIj3j5ytTWwpY7?=
 =?us-ascii?Q?3PO1ItEjHxlUIMhAsOPzDbttL6/bJzUnLmcTFV+i+Jh3a+waxF6Ih/KSAQW/?=
 =?us-ascii?Q?+cFtZCN7pKiu3ohgRdOn5KiXP/kIzd0S7csVMAUJwtPr1dnL4inbD/MEsZpB?=
 =?us-ascii?Q?Z+ZM8dQOTP6H2AfVUWagplpvuc+WMjHnRW1tPmSypHr3lg+ohJncJXUbZdZz?=
 =?us-ascii?Q?oM9K5YFbjF+LHjD47Cty91kT+qh+e7CuSpGTZz5keRD6Tqyie/DfUf5JtD5v?=
 =?us-ascii?Q?RYJz9H5ceeoXo248DUJjdZEAar8nlvnvAos9gF4nbSL/d4DE+2W7NLqtBmzM?=
 =?us-ascii?Q?FQCGBRfb/LGVKUO0bEP3pNq+dKhoUrAGSlOhd3TXOE7TSot3x8XfkJiLxMgr?=
 =?us-ascii?Q?RsD01Kq8rZ8JEuF5Rk7AbojLAaMELrEFAUD7REki+/lXeRvxiWdEh4XGpSoQ?=
 =?us-ascii?Q?wzEXF+HAxx3Xhe7PTW65oPoI9GC+D0V8Qx2/UMK4lDH8jNdL7BWzcCCQX8KN?=
 =?us-ascii?Q?pZQ1fWJMSKVSZIuggFLGPeERRra09tpe/hpSSkUPZ64gx+vKvFk6Gpde2q1U?=
 =?us-ascii?Q?iXhn08vV89L2wUqMNpM3rq2ie5qg+30M6kLiOZIxAEMjRTNwTXKPZLTKS3Cw?=
 =?us-ascii?Q?rEhrwaTn01Y+nk5/a/+WpQw0a9z4wcN3SNocK1Kd9vxF20yiB3MuRnT0kmQN?=
 =?us-ascii?Q?JnbPLduQi72m+WFxy6ECSEAiKOuHa7M6ayrXD4nz7XpJwRcPp6MWBA4clH1U?=
 =?us-ascii?Q?m+L64UyMuuAt9HVRlca7Jzo6bJklpAsbiq57DtOYo6HssgN0gwekt/IoxCra?=
 =?us-ascii?Q?F9lJQPxJDjNppRITtjewK59/sDlHUvWIFZtur+tUD3nNb0gdi6rPm6lb9Nwt?=
 =?us-ascii?Q?N2MQ8/dCWQFwP/zbQTbxKnaxfGa7t42VUVBKUCiP3uiGrktxehaYOZ+dqRGM?=
 =?us-ascii?Q?gA5nQZLl0BxFxcyn+7qBPhAyolg1RFGzR/WFlKDvpVexw2BbHI/XydaNCOJL?=
 =?us-ascii?Q?IzRHDOLBX6nqRsGAO0MaMaqR63p03QsWzWOe34Mhip4ItonY4WNUB1zmjIWI?=
 =?us-ascii?Q?skblT3eQKdmUloWjh0nU+Sa2k+kZJ8PlHi628TxLUp8SKtUHONyJaDB1vwte?=
 =?us-ascii?Q?F+c0dD2jBcupBEY+fqaUyYFmM/t0FBI7eFkVq1pk1POeRl5fByAgPnZ8wwbW?=
 =?us-ascii?Q?ORmJlzUxsU/3SYUevBzVrMoYLExKz6Sr7wfIpL79ouiANFp4xxmWHpARmTPI?=
 =?us-ascii?Q?ZCZCfShDlVZ9FZlzZHoXX/GhVG10kwXmv+DmM1uIaLayBCf2UYfM0+95hv+m?=
 =?us-ascii?Q?lsdhxcGL1H1wVuCidl4piLdKkzGKWHTqNZvirX2/akJWHrBZyJsUg6YZWVp1?=
 =?us-ascii?Q?qTmHp5Yf3dJFJm8Pvj9miIC2rp1PpaF75N6X3bhciSxZu6KJpmApVtx+j3VF?=
 =?us-ascii?Q?/1ChVAc/7O+u6/riPyLIZpPowtOLMqsg35ND0NWcvwuzsDEyufw0fjmQhfgg?=
 =?us-ascii?Q?Kj9E+wbOe45SxdqTDPjiQVpsQtkTnHjWyrGw5Tg76luk6B18CQJlWqadRu3J?=
 =?us-ascii?Q?7g=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 40e154a7-63e2-49ef-7b1d-08db39f2a2e3
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Apr 2023 18:37:28.3025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M/CUiSyhZzFDEVqnjmvtSmQ2UB3hxCY2b1Vy9iCTQ8W2T2zk8PjFniioxvWUDJ8B5hVGgZroEHK1pNDWc+BwThALy6PlqXCK2OnvVgIVtX4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5023
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Add Rocketlake device info
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
Cc: Matt Roper <matthew.d.roper@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Mon, Apr 10, 2023 at 11:05:04AM -0700, Anusha Srivatsa wrote:
>Add missing device info for Rocketlake.
>
>v2: Also add abox_mask to the device info(lucas)
>v3: rebase
>
>Signed-off-by: Anusha Srivatsa <anusha.srivatsa@intel.com>
>Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>(v2)
>---
> drivers/gpu/drm/xe/xe_display.c | 11 +++++++++++
> drivers/gpu/drm/xe/xe_pci.c     |  8 ++++++++
> 2 files changed, 19 insertions(+)
>
>diff --git a/drivers/gpu/drm/xe/xe_display.c b/drivers/gpu/drm/xe/xe_display.c
>index 5fab5b9fbde0..44697c0f7fb5 100644
>--- a/drivers/gpu/drm/xe/xe_display.c
>+++ b/drivers/gpu/drm/xe/xe_display.c
>@@ -488,6 +488,17 @@ void xe_display_info_init(struct xe_device *xe)
> 	case XE_DG1:
> 		xe->info.display = (struct xe_device_display_info) { GEN12_DISPLAY };
> 		break;
>+	case XE_ROCKETLAKE:
>+		xe->info.display = (struct xe_device_display_info) {
>+			GEN12_DISPLAY,
>+			.abox_mask = BIT(0),
>+			.has_hti = 1,
>+			.has_psr_hw_tracking = 0,
>+			.cpu_transcoder_mask =
>+				BIT(TRANSCODER_A) | BIT(TRANSCODER_B) |
>+				BIT(TRANSCODER_C),
>+		};
>+		break;
> 	case XE_ALDERLAKE_S:
> 		xe->info.display = (struct xe_device_display_info) {
> 			GEN12_DISPLAY,
>diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>index b92d8b5a391e..a81427019d02 100644
>--- a/drivers/gpu/drm/xe/xe_pci.c
>+++ b/drivers/gpu/drm/xe/xe_pci.c
>@@ -179,6 +179,13 @@ static const struct xe_device_desc tgl_desc = {
> 	.require_force_probe = true,
> };
>
>+static const struct xe_device_desc rkl_desc = {
>+	.graphics = &graphics_xelp,
>+	.media = &media_xem,

now it will have VCS2 as a possible engine. Not sure if the fusing
will handle this correctly or if we should create a different
xe_media_desc for rkl.  Matt?

Lucas De Marchi

>+	PLATFORM(XE_ROCKETLAKE),
>+	.require_force_probe = true,
>+};
>+
> static const struct xe_device_desc adl_s_desc = {
> 	.graphics = &graphics_xelp,
> 	.media = &media_xem,
>@@ -301,6 +308,7 @@ static struct gmdid_map media_ip_map[] = {
>  */
> static const struct pci_device_id pciidlist[] = {
> 	XE_TGL_IDS(INTEL_VGA_DEVICE, &tgl_desc),
>+	XE_RKL_IDS(INTEL_VGA_DEVICE, &rkl_desc),
> 	XE_ADLS_IDS(INTEL_VGA_DEVICE, &adl_s_desc),
> 	XE_ADLP_IDS(INTEL_VGA_DEVICE, &adl_p_desc),
> 	XE_DG1_IDS(INTEL_VGA_DEVICE, &dg1_desc),
>-- 
>2.25.1
>
