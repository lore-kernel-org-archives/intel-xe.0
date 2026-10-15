Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB24DCC6B3A
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 14:53:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 501B211238D;
	Thu, 15 Oct 2026 14:53:22 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B130B11238D
 for <intel-xe@lists.freedesktop.org>; Thu, 15 Oct 2026 14:53:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1792075996; x=1823611996;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=eJx7FF1CAvAfSzKOOHCSd41tY/10mthuQv0XCao1mTg=;
 b=Xxdy9G9PAy840BP95lRMBMSnEg4O3CE6KqO1iHIcl0CzH3HNrPhWmpKj
 3z8pwI2w1LBD2yltLhtOJR3jhbo8fqzavVAZRg8WI4ygUFK/stcbJ0MaL
 vwp5vhCs2FHuF5eySK2Kmzsk9UPkQCYwxi7AmivRWHvlWVAuncO4niGtP
 8ZwaAyvo818DJKrFAyOxnHTG5k/WTttSGvax8ZUwDolyL+qP3ND3OZNOi
 4Yh7mhd7WlcAI4p5eHUxGEBrHwx8+jfWObLt01pgZP6j1Kb9eovAI2dr6
 XbLkwA/YWPt9irP0h+UnyFQ0ZuNOWMlvT/chCl6Kj5dTK5q0sl83/VvR1 g==;
X-CSE-ConnectionGUID: o/uduARkR8G1hehsBgM5Zw==
X-CSE-MsgGUID: XoSI0BftQXucj8o+XCy/Mg==
X-IronPort-AV: E=McAfee;i="6800,10657,11936"; a="861075"
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="861075"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 07:53:16 -0700
X-CSE-ConnectionGUID: +rvt5+BaSZGTw+g5JTeztQ==
X-CSE-MsgGUID: afOzMQD6RrOqoQsWTrGWEw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,160,1787036400"; 
   d="scan'208";a="1684363"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2026 07:53:15 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 07:53:14 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49 via Frontend Transport; Thu, 15 Oct 2026 07:53:14 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.51) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.49; Thu, 15 Oct 2026 07:53:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pNLLghzqyH44zIAEBNcFpDvkOY4jNQOHX16zZb/YFqMtPsvcrhnETeXzan6j9oxKuELKcEP52j1kDG+KOQdMaW//tv/i0lF9cSUgW4ou3gr75pg733126OeYOo+3XTMOo4zMmjPc9zwUAa3F4VDeglFHh9pq9dNf92xFE0nX/hALKNtX8BKBoyLgk1iLup1mS5ALTLXxK87h6QKwFxXFDkrN4Hqo2r1IqRI7RDIPDMGlvbdc8fw+ECMRc0fp6uJZnXNLifd3r7dC6vXArfAe25Job41+XkvrbQx4JJqnY5Y5DeusxbFazEXdhRZaP3su+lEs4n8Nni2N2Se7J4I4jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xkmq8OdxbA7p39CXUAsVWSux1yINvg84AiucjiorQkw=;
 b=wMMUl1d51gVPsnelr5RBPaNI12vHpoCAA+lSl3ZhUocs77BWOGYTgac98FOP74VlhRoYCiaOEor2Rxok1p3qI6YeqnGQnhh65HgJ4HfKZfKOxMGqZ3FWQWd7t9A5eOVVNloFjnHKuF6CbkEpirurqIPfOD6Zj66VSWIs/9RK2kryDM0Vp8c2CuGUKva+cXaFNA6w6camWWW4mmvcXyDzuIOShn7JxxnniJGgmrJXRrhrY7oyaH73X3VLpOOVT2+fCrjmFqIA1Mgf7c2sH2CC60B4k91vSDAnHhXw5R66uEj0XrpXMX1lnvyEkUZlUDORiF2DIOnDDDDOHBxGqj/G1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7408.namprd11.prod.outlook.com (2603:10b6:8:136::15)
 by CH0PR11MB5218.namprd11.prod.outlook.com (2603:10b6:610:e1::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.522.14; Thu, 15 Oct
 2026 14:53:06 +0000
Received: from DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057]) by DS0PR11MB7408.namprd11.prod.outlook.com
 ([fe80::53aa:3f7a:59cd:e057%6]) with mapi id 15.21.0472.015; Thu, 15 Oct 2026
 14:53:06 +0000
Date: Thu, 15 Oct 2026 07:53:04 -0700
From: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
To: Shekhar Chauhan <shekhar.chauhan@intel.com>
CC: <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v1] drm/xe/xe3: Fix OAM stream broken on Xe3+
Message-ID: <atDo0EwTH82de16g@soc-5CG1426VCC.clients.intel.com>
References: <20261012112158.180251-1-shekhar.chauhan@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
In-Reply-To: <20261012112158.180251-1-shekhar.chauhan@intel.com>
X-ClientProxiedBy: MW4PR04CA0221.namprd04.prod.outlook.com
 (2603:10b6:303:87::16) To DS0PR11MB7408.namprd11.prod.outlook.com
 (2603:10b6:8:136::15)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7408:EE_|CH0PR11MB5218:EE_
X-MS-Office365-Filtering-Correlation-Id: 376ef344-038e-4109-6b81-08df2acc0589
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|11063799006|261009223027099003|10067099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: rcQ+HirSx/braLln5zgrfnJ8Jgx5x/uSJWNDH1jaRYjByjMdibetpqcTf0DOka8eZJIHHLIyt00//hXZ6ET5kJYyV7mQRDQmvP41WcBgneq9KWK4XEbbcE3QppyFb20FCbAGgMHqm7eNydh6LeEingJHV97authUsHP1d6LKzdvQTqK8I5vYneyQHdtSbnGbnG1R5VPyDnFpvDgmvtiTOzGdKm7juVytv8tzV0z2SaHxeF1rc99QVqlq57yOmFxKomSfbEyabGy7lpPiuyJ3HqEnBD835sJT3e7mE9uoneZKbOvS/v+vXKMJ8KkBT3hucQ0IEDcRl6Cdc1wC1NjukVh98+7CoXuT/FyJ6TRqYfRfX/TkR90Y3bEWN64YgqC2DUiSzgSJHFta+x2l8rUQqOuKyHTu8ztXdg2QifIc5yyZljZRck+bpQzZJ2CwLQkJW2dUXsjv51O+tkAZEwQlvcDbFBry05WAdw3Uuk209W+8YWO0t4zWuhG06GVju6/azdPN9sgNY074yqvIlZZPueFzi3aVRoe8fxhYf/FctAgXLTK3X+LIzx5dKhvUe61sIWzp1lMyIYnCli+KfvajQzWpO56DN+TJWfKkaSIC+e3Iq4aSmCs0xP9X5huqbf1tzXuCWmUVMcTfV4nLqq+FoY/VIwW0JGTzPRVFR0Dars8=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7408.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(11063799006)(261009223027099003)(10067099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bC8yell5L2FpNG1iWUhRUWY5NSs2QTdKUjlhM2VzVklEME5JS0djRE9tdE5u?=
 =?utf-8?B?TEdLeGwyU05UNTN5bnFvQzJPWWszbFdKdXlwWkdJZFlUZzVOVm5TVUNFUU9J?=
 =?utf-8?B?VjgybTBKRkZoTDl3NDFJZFh2WnJBQ01ZZGp0Z2V3dzd2Nk5RaEpnVExFQmxl?=
 =?utf-8?B?aVc5Tmdyb1NDOUEvZm5JOHFLcnZhTzRYNjhuNEJTcnVCVXpoc2lEUmI4R3c4?=
 =?utf-8?B?cFIwTWtjOU1MMFExcFVrVTAzVlNVTHROYkNzZFpFRlRQcXRobHgwZmU5OHNk?=
 =?utf-8?B?amlCM0QxNGJvSmlKbFVxbnpwb2lUalBCcytZenJYZ0I3WVhveWtKU3lET3Yx?=
 =?utf-8?B?VGdLaUdwNEtjTjE4bnI1aDEwMlFDUkNGelc2Y3k3ZFpwUjFOWlZpNWxyYVRk?=
 =?utf-8?B?ZTFxTkRlVXB4bFlwS3Y2R1RrY3BiQTJaVmNzcHk3LzFnMmQ5cnJ3blQzZUtB?=
 =?utf-8?B?RVlKNkEveHJsby9WRktncmxpQW44TE5MdkNxeVdaVitmTG1FWkplNmxoY1JY?=
 =?utf-8?B?MSs1NVJ1dnVKU1FwZHhvbUNJMFhFQmF3Rml6U3FCSWF4aTRJSG9hQnlXM0hn?=
 =?utf-8?B?QmpkajRJaXQzSkhsOHRMZFZ6YU9GUGtpRHRrZ1ZXWVg5MHZxWjJrdHBiaVFV?=
 =?utf-8?B?bUxMOGJnZjFWTTNmc1VGcHYwa2FSYmN6NVkrcVlEbWhmdGpqKzBiZWJaeFBv?=
 =?utf-8?B?K2ZoSDhJeEpRMlhZZGJsNWVDT201WWRadmlsTEM4S1Z5dy9FZTRpSXp4eGxE?=
 =?utf-8?B?bGtKOGR1RkdYUkxxUEJnLzEyRmJBUzZsTXFZaGF2ampsNVEwaDFub1hoc0or?=
 =?utf-8?B?L05QT21LYjZjaE9VS1NaNzVuUG9oZzkxUDB1dlZTdDExOVIzMEZ2bEFGTWdJ?=
 =?utf-8?B?MEY2K2hBZlZpU3VmUWVETFZNSHZ2WEg2UjFsdVhMQTM3Wng5RUdEbWtSMWZ5?=
 =?utf-8?B?NEFjTVpieEViV0k5dU5UZS95LzltUkdVYlBjUk9KUCtMKzdJMzFic3NsU1BL?=
 =?utf-8?B?MzBra3I5SzZ4bllnbzlOcG9URUFxSEZhTTZ1TnVtTlZNMFpWc3BsSjNIUGR6?=
 =?utf-8?B?UkZRcWxXYkZTNWVWajI1Y01RRlhYMCt0NUVWR0phdFNUZjlwNmI3SU5VY2xU?=
 =?utf-8?B?bVBTN2ZETWN5cXR4NDV4Vkg1ZTU1dDMvdDFqaVF5bTMzNkp6MU9RQkU3dk1G?=
 =?utf-8?B?em5VRXp2ZjhXMFduY0lCTzlvNWYyV29hTHl1NVhGTWcvamhWcnlXMDdkbjFq?=
 =?utf-8?B?NEJRdFJrTXc5Y0J1djNIUUw1S2JiRThOWmJEWmd5bDk2K01aZFBZaUtaeWJN?=
 =?utf-8?B?S0JseWJWTWdQR1JhbkU5QmNyQ0lCUmE0UTh5N1pSd203ZWQwTGpYTUdPWGlW?=
 =?utf-8?B?OTFwRXllY2N1Zm5GYUczUHZCSDVKR2NEdHc5OUxkWlU4OUpzRkJrNXUzZXox?=
 =?utf-8?B?eEdYMUhleXdxZzhFZVdiRHpPY0RXSyt3MkVtSjVxSUtKRmovdngxay9xYzZQ?=
 =?utf-8?B?NVdndWFNbS9mV3pRUEVRMFJHM2hmc20rbnlqZkJobEEvMEV6U3BhZWp3Rmx2?=
 =?utf-8?B?WDR1ekF6TGdXVnlGQm5ScC8rSWZXb2h4ckc1TmxJbUZYalJEU2FxZ3U2ZkZy?=
 =?utf-8?B?Q1pvM0QrbTNpYXpZQ0haNVlGT0wwUE9BVTBZZVVFT1dPdUpOTDgvNlpVV3pZ?=
 =?utf-8?B?U0xmQUFGUSszYytGUStEcjQrZWs2OENUbWRiZkZzUFJMVHFjbzFzOU9SSTRC?=
 =?utf-8?B?ZVBZTG11c1BTYnFkWTVzTlNLNUl0c1hPRHR4bGo0ZmNlMXhwLzVRMEJXRGhi?=
 =?utf-8?B?WEtWc1Y4TGVYbU01cGwrOWxJWTBNUkQ1UGE3MFdRb2w5aGVaSG5mT0Q1M1JB?=
 =?utf-8?B?NGNvQ0lyaVg5c1RKNGhrODhsTmYydjdzWVIrVUVPdkc2Vit4OURReHdxQTdz?=
 =?utf-8?B?RDlQWlhXR0xBd28xb2NvTGxpcDllTlVlRjVIc1FpcjdPbytIaWRwS0toUjhG?=
 =?utf-8?B?dVhYZjZEVjBMemwwNEI3dEEzMnFNM0NiMXN2SllJR25FZmxmVDRrbFUzK3lF?=
 =?utf-8?B?LzR2ejU3MzdPcHEyd0JUS3J2cWZXMFF0RlZpakN3OFIrNHpVZkNpa0FsVDRy?=
 =?utf-8?B?UXE4SE5ONlpXZmZCZWt3QldnWFpOM29kVlQ2K3N4TWlZVTJrVkVPTjh5azJ5?=
 =?utf-8?B?aitGbVR5bUw0UFkvdE5wQk5IaTVnQXpZRHJDRUlBT2szbXlFeVdBUnZiS3pP?=
 =?utf-8?B?K3o5RXFFUWRkY0I1M3dkQjRTUlJkWjlza1U0elkrL0JVUnBCYjRHOVJDYm1K?=
 =?utf-8?B?cUFUQStsV0Q1RE93cC9YZ0RONStHcjMxM2lTam1zdSs5L2pnTGpyVFNlZ3NT?=
 =?utf-8?Q?j9hXRHGZpuiWx8uw=3D?=
X-Exchange-RoutingPolicyChecked: m/cw+s4Iitywa4zkQJHBgeuD34jmbDlMcnClIxeMxRcYxlofHFnYywyUr/VXlQByLLwSmgMfi8DLMc7ErSr4zhB35MD8fZWG9q1zLOZHvOiPIA6M9nfZAObsTw2UKhhXNR0cfar3ySXEX5xppf2/9dLGaOybGifZgCsoD2A1n7jyT7LdTNEJ3UNXZDy73KxJNgx3tdg5b6mZj+HCBbrUNjXUE2lCFbd7+t3a/x2PAmRl7k8yLjCY/oegnZw65MNfR0o5EUPJJnflcPNxO+R9kw+/5zY76a+0QfSfv7NUaj/DXkJ4f10YG/4AWh9SXA4XPHlESQkMtReXmRvWEZl9lA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 376ef344-038e-4109-6b81-08df2acc0589
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7408.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2026 14:53:06.6445 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nDdScIN/efLSUi2XTvzR9at27pZhmXum8oaUrjF6U0x3300K/o39MOhtY0DzFniYRWS/+1JwUSg0T3jQexWUuRywWKtzPXkOiH83KiapLlQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB5218
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

On Mon, Oct 12, 2026 at 04:51:58PM +0530, Shekhar Chauhan wrote:
>OAM stream: Prevent partial reports at the end of the buffer
>when overrun mode is enabled by making the buffer size
>a multiple of the report size.
>
>Signed-off-by: Shekhar Chauhan <shekhar.chauhan@intel.com>

LGTM,

Reviewed-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>

Thanks,
Umesh
>---
> drivers/gpu/drm/xe/xe_oa.c | 20 +++++++++++++++-----
> 1 file changed, 15 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_oa.c b/drivers/gpu/drm/xe/xe_oa.c
>index a3484e943c55..f45d4970b29b 100644
>--- a/drivers/gpu/drm/xe/xe_oa.c
>+++ b/drivers/gpu/drm/xe/xe_oa.c
>@@ -1743,6 +1743,15 @@ static const struct file_operations xe_oa_fops = {
> 	.mmap		= xe_oa_mmap,
> };
>
>+#define oag_has_tail_address_wrap(stream) \
>+	(GRAPHICS_VER((stream)->oa->xe) >= 20 && \
>+	 (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG)
>+
>+#define oam_has_tail_address_wrap(stream) \
>+	(MEDIA_VER((stream)->oa->xe) >= 30 && \
>+	 ((stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM || \
>+	  (stream)->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAM_SAG))
>+
> static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 			     struct xe_oa_open_param *param)
> {
>@@ -1767,12 +1776,13 @@ static int xe_oa_stream_init(struct xe_oa_stream *stream,
> 	stream->syncs = param->syncs;
>
> 	/*
>-	 * For Xe2+, when overrun mode is enabled, there are no partial reports at the end
>-	 * of buffer, making the OA buffer effectively a non-power-of-2 size circular
>-	 * buffer whose size, circ_size, is a multiple of the report size
>+	 * For Xe2+ OAG and Xe3+ OAM, when overrun mode is enabled, there are no
>+	 * partial reports at the end of buffer, making the OA buffer effectively a
>+	 * non-power-of-2 size circular buffer whose size, circ_size, is
>+	 * a multiple of the report size.
> 	 */
>-	if (GRAPHICS_VER(stream->oa->xe) >= 20 &&
>-	    stream->oa_unit->type == DRM_XE_OA_UNIT_TYPE_OAG && stream->sample)
>+	if (stream->sample &&
>+	    (oag_has_tail_address_wrap(stream) || oam_has_tail_address_wrap(stream)))
> 		stream->oa_buffer.circ_size =
> 			param->oa_buffer_size -
> 			param->oa_buffer_size % stream->oa_buffer.format->size;
>-- 
>2.53.0
>
