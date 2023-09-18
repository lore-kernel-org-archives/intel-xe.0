Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DFD12CD37B0
	for <intel-xe@archiver.kernel.org>; Mon, 18 Sep 2023 15:42:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D96E10E07D;
	Mon, 18 Sep 2023 15:42:59 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06F9410E07D
 for <intel-xe@lists.freedesktop.org>; Mon, 18 Sep 2023 15:42:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1695051778; x=1726587778;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=nCQK2zQW7Ma4tpVFx78Crql4joGaxKQ6n2GiNnO9eek=;
 b=VhNY/UKcO0r8CXf2pw0zUQzc9Xrt7ZoJR7PlgH7FbtteNE6nqHTBJzgE
 qAtMtdvgZbFyys+t3ViPSsQ8Dwgs/10Bm8obD8Oo5yiKtzU2C6A0w2yOD
 7cEmPVBbWDsZDmm7pWZVJxqk0x4dGghjmlXR5YdMf/f6wwhhCKkJMEdQ2
 Lb0D1C1bz9aIlQp4bf9d5L2b+eVxJ9MC6XnqG/7Xh+cGy6k9FTUIy1Jgp
 f2eScaa/Mhvnm+dH36DsJGToTirLpUFvrtUgHROop2bpxFzmUAA6KRD98
 b/0MzAmcK3wkOfayt458MGYutXCwDx66SoP01tXH1R/FHHQu/Nvpa5YHW Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="446157927"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="446157927"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Sep 2023 08:42:57 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10837"; a="836075998"
X-IronPort-AV: E=Sophos;i="6.02,156,1688454000"; d="scan'208";a="836075998"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by FMSMGA003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 18 Sep 2023 08:42:56 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 08:42:55 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32; Mon, 18 Sep 2023 08:42:55 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.32 via Frontend Transport; Mon, 18 Sep 2023 08:42:55 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.32; Mon, 18 Sep 2023 08:42:55 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IBEY/RWmT68AFSzek5Cy42TcQ+k61dIEHEaUYS40fz4vmCMbZspFdDC3eRN1pJPkLrevWbQV1eg+QqfsMYdmKe5wlr2DHva0TojxwhGPbL3mHV1IGL720GrG1ASDKR82feyEJJDlhcoAHwbCZOneUCwABzmEGhaK30M9RW2za0fzutpj0oRENse4wlQvdFJy2gSiH4MgyTEkvFWunwNCgklnf320wjkzU3eCd4W+Ia+Be5F3QpinJwogt6fwR2D0+2jNDEO+Yk0zwe31J45gAEzNnBl1U1xBD6EtjtbKGzZsJ1GKhS3c+G0u0iyOU2LAfQJDl4XTLAxRtn4D9cgtRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ViVnifzWATUYY6DMCulO7oaoLgOwspTERpXINn/mF+w=;
 b=Vh/Efh7yojMp9kPi6N836Qk8fWCkHBgmUTeU2XYEf5yzMhqcuMlCSA7KMPXZ4HR2V1Rh+BO8SIT/oJYVJ2SUUyCrjWgK4xsdR3HtBzevG4qdQm7V6OdLTd2gCYxqHBGcqp0tGrcNAS8tLjigLRYlvqb2tVaDjR1sFDaDWYdK5Hf6FVGjVLnzDO5VVV27nlovJmrsz0UVsU4kLmjk7f3uhFCmXVDAsoPQFIpsdWHuP8uJTRdV32FrrzwYSIAnR1oWMR4ZJbqibX3j5RoCm9vgqgIk+2t4Q9EGHtjdfnapCu+KXAPBhWvQ+wwSukZuqvOfTXPQrSgkd9D2s00qpRqItw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SJ0PR11MB4895.namprd11.prod.outlook.com (2603:10b6:a03:2de::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.26; Mon, 18 Sep
 2023 15:42:48 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::cc12:ab15:1d0:af79%5]) with mapi id 15.20.6792.021; Mon, 18 Sep 2023
 15:42:48 +0000
Date: Mon, 18 Sep 2023 10:42:46 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Thomas =?utf-8?Q?Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Message-ID: <mh2sbpcwsyix6aok6rouzrutyy23uvouqnee4zkd54jhodnjia@yu3fntbjjtfw>
References: <20230915180610.39266-1-thomas.hellstrom@linux.intel.com>
 <f7eeee26-03b4-f0b3-333d-111be65c76fa@linux.intel.com>
 <510b7135-3583-e3de-6403-aaef5a7616e9@linux.intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <510b7135-3583-e3de-6403-aaef5a7616e9@linux.intel.com>
X-ClientProxiedBy: BYAPR11CA0056.namprd11.prod.outlook.com
 (2603:10b6:a03:80::33) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SJ0PR11MB4895:EE_
X-MS-Office365-Filtering-Correlation-Id: ca035b44-f028-4ce4-6d05-08dbb85de90b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: SkC4LtMigKJJR2F5/d7ylaNsfawBcLd9s31uCKiwN/yTOgfYb+NRgr4kzx+Ge9HkRTOFkpwF2f8JLbXoeShTpkFeSkaavyW/GWDKe/H2aA56mV0VUjipYVlEtEqjvJ8etcS7Xn6rGZYcEfTcamKDcGNDnvVYMWncFdkVJTXVthpkh9IbsS8hEjWzSNQlZB7GI/tB63CAs35i2ACj8XZs4G1D3Ndsqd37u7ZjGVnpX+Z/cFV1IrwjPKJ5Khtr4B83pLJctu3JcJhDxEYxS/FsMFlHRwqXec1zT9y+djEWsiIrmOu377kVcyP5TmZh9Gb4an4mZbC2HudDUFusw8LWAHHW31QS1ZQflYvnjbkdqCUj8X89P3s2SMD2J3Osbxkfdp6wgtlwAp2M/fsqt6tuZxD6n6J+4/CcabmNs2X1lFdnqVj1tx30eFwQl7E097eR1VnB1YKSp/TZaileHxYGU+6m1S2zN66+JvVqCmN4BID6/a4Qkyw5dVbWHodekVHublSrvZ+7HRpeNNE6O0iiDgF+IuK+u7Wu+3Lnq+LIHczWaEy+MIeswXcdwqK+cFDM
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(136003)(346002)(39860400002)(376002)(396003)(366004)(1800799009)(451199024)(186009)(66556008)(66476007)(66946007)(6916009)(316002)(8676002)(8936002)(4326008)(41300700001)(6506007)(6486002)(9686003)(6512007)(478600001)(33716001)(86362001)(82960400001)(2906002)(38100700002)(5660300002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?NjTOd57OmwTQXTARO2TtIlQE5S00O2egzvrJatoqAhT8bPOiJKXcTZwvzk?=
 =?iso-8859-1?Q?m2j9O6WoQXozriVqGOQy+QqZu0F78T6t8sf9+gTm4dKxeGhcFhHVuSRmio?=
 =?iso-8859-1?Q?qDqggLxLbEllu49UiyoTxq6+IlfL4PwEJ5CEXP7fOKlJm/jfPw0x59n6fW?=
 =?iso-8859-1?Q?9Zkwa3xRUVIBT3uf4kBLcrFxhhsr9wT1iNI9dVHTcjIklnHFALQz95mLD9?=
 =?iso-8859-1?Q?neiQvwx7916+AiGGEyuM1dihMLDGIcTF6hhkK5EAeRwRzEiHGZlaLwSOE2?=
 =?iso-8859-1?Q?k9Vutj5nfoG+1GWsxD3CUdHnPDnXcPUHeXirT9q7r0GWzycT5NNWc03oT1?=
 =?iso-8859-1?Q?T+EcEyvd5KBMVwHk53ES1lD3WMntxKMvdDY47Ygt3PWUGeYJVkXuTvh9Ve?=
 =?iso-8859-1?Q?sTVYpXzjoGbI8xZ8/xHhpYQnYuMNEIi2lmUyBH7ZRVKxEpzWiRu4Q2rnuc?=
 =?iso-8859-1?Q?qk9HJKQtKJr1T+7rPD4BbU4ncWooagE55oiorzLiRJzamf2eKxs4HkGv2V?=
 =?iso-8859-1?Q?2CzHa3bVZ69o98qE+muNHLbhrapjZxCxbbKjp6l4y4g/hoxFAlu7SuI6k7?=
 =?iso-8859-1?Q?/LIC/oLF4ARN3ce3v5Z1LlVIZlTl2d6LaoIb5MSFFSL4a1CtqEsBocQjcl?=
 =?iso-8859-1?Q?YT18p9jPGWD+0GMnp+pBOYHR8VmU+0t6QxyM7PzYvdJCVwC7j6ezqnfHii?=
 =?iso-8859-1?Q?p2TljHq0V3Tb6Ou8/7dD6zxQNdblfWG48FMToyY0bOJhFTqrr57xivem0n?=
 =?iso-8859-1?Q?rE2UVr8cROjjZ/D6s+X07dYo9PjcW+RB7vE+VY96Nt/8BQrYUSUsrzD7NK?=
 =?iso-8859-1?Q?lCkH8k5OTXqwdS1kaUxFA9PESvBeO6DWK4iEb6eMpM/gMDnBLLHAaR361V?=
 =?iso-8859-1?Q?ZA0uhGPv5T8X71PRXInEFiZNtRoswNz5dpf/o525HeoQ3cL4nIKP9iHRzp?=
 =?iso-8859-1?Q?QrIYg9jNlziD/DI422vF09cg3NVupVphfzphnwpk572dRTR+H8KB2s6c/o?=
 =?iso-8859-1?Q?W3ittan0S4nyFCdJHsIBB39LmBgrToh4nHA3H8fAcfOEonE/p4Xemhr8rd?=
 =?iso-8859-1?Q?CdZj7x7NCGkWIeE/BkUPItT4xS1840zHFSId0TFd5PzF7V65RUXJSO2SzK?=
 =?iso-8859-1?Q?EyNrz3Y1wzjpvCP+47AQNKn5bRzGCQuXr6y7WxVKn7GwHm+p0+rLr3tzYx?=
 =?iso-8859-1?Q?YlJb5JTDUXDF56t/aQIQhY0y3lqxhCWMLeN28LWvCb1+MBpFc0Y90mFJFt?=
 =?iso-8859-1?Q?Dr//sxTZ5MNhKmn4AUPFuSWHpyk5/KwAdebqrtqHjCpuJMQOH+E882xnNE?=
 =?iso-8859-1?Q?FIsstKPx+66/6nxe/gseMuA75cYRGugapI5RuyA/xJwJnI18T1QVkpQMXL?=
 =?iso-8859-1?Q?ZqNOkdxrX1ThGGwcsiSqQSuw0sIccl2pHDr/PQXRutkaNFpxSrfFN3LT7C?=
 =?iso-8859-1?Q?j5QGfBHAhFXJV8GHc4srS19yfqwIRUHzV/qu92BZRqMtbX8dYtCYJcsLf0?=
 =?iso-8859-1?Q?g7fRqPGKImI4RczuhzZqMUQt5JyTlm3NftXQ4s4/T4xhyXAlqXV+p/j05z?=
 =?iso-8859-1?Q?VqHvJhfQJbrpAQeS42dhYqKVDVjs4dqCUCG2QSZ6jBeDY9eyvVJklORrNN?=
 =?iso-8859-1?Q?wrcINOz3mvJsWRN2jsXfBb9i3hBD2NPPgUCUHWB5WICqFVqVj6m+zfpLFz?=
 =?iso-8859-1?Q?Q0TrF2KYUNnyAJZ4I+0=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ca035b44-f028-4ce4-6d05-08dbb85de90b
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 15:42:48.7218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4O1KDg8TRsRDkjn6Uh+Yk2veum/K4tJExoqa4PM0c3OiUbEDSPuFNSw/M2VPdu2icm1zoUwtELw3/2dnAyckf/bxCz9O9vl6LY0yWmjm3Fo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB4895
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [RFC PATCH] drm/xe/display: Select some missing
 configs
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

On Mon, Sep 18, 2023 at 04:18:52PM +0200, Thomas Hellström wrote:
>
>On 9/18/23 16:17, Maarten Lankhorst wrote:
>>
>>
>>On 2023-09-15 20:06, Thomas Hellström wrote:
>>>When selecting CONFIG_XE_DISPLAY, the following missing symbols can be
>>>seen unless something else has selected the corresponding configs.
>>>
>>>ERROR: modpost: "cfb_copyarea" [drivers/gpu/drm/xe/xe.ko] undefined!
>>>ERROR: modpost: "cfb_fillrect" [drivers/gpu/drm/xe/xe.ko] undefined!
>>>ERROR: modpost: "cfb_imageblit" [drivers/gpu/drm/xe/xe.ko] undefined
>>>
>>>Make sure these are included in the Xe Display build.
>>>
>>>Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>>>Signed-off-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
>>>---
>>>  drivers/gpu/drm/xe/Kconfig | 3 +++
>>>  1 file changed, 3 insertions(+)
>>>
>>>diff --git a/drivers/gpu/drm/xe/Kconfig b/drivers/gpu/drm/xe/Kconfig
>>>index 096bd066afa8..ed2dd73f153b 100644
>>>--- a/drivers/gpu/drm/xe/Kconfig
>>>+++ b/drivers/gpu/drm/xe/Kconfig
>>>@@ -45,6 +45,9 @@ config DRM_XE
>>>  config DRM_XE_DISPLAY
>>>      bool "Enable display support"
>>>      depends on DRM_XE && EXPERT
>>>+    select FB_CFB_COPYAREA
>>>+    select FB_CFB_FILLRECT
>>>+    select FB_CFB_IMAGEBLIT
>>>      select I2C
>>>      select I2C_ALGOBIT
>>>      default y
>>Make that FB_IOMEM_HELPERS, and you can add my r-b. :-)
>>
>>Reviewed-by: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
>
>Thanks! I'll fix up.

this will need to be a fixup patch to the display introduction since
display is still being moved in the tree.

git commit --fixup=<commit hash>

Lucas De Marchi

>
>/Thomas
>
>
