Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D576EC61DA4
	for <intel-xe@archiver.kernel.org>; Wed, 15 Mar 2023 17:40:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 993AB10EB69;
	Wed, 15 Mar 2023 17:40:47 +0000 (UTC)
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D988F10EB6A
 for <intel-xe@lists.freedesktop.org>; Wed, 15 Mar 2023 17:40:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1678902045; x=1710438045;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=jySChz2rwgAHBYk1iXXtzLh2qM8E2w5GdUP3b4KT7cw=;
 b=edzfdF0ZBPC2aCWDoKUTmtWXvToUIKWa64YWICdDcGdaAmPFmfO/FRST
 FStm9qRKxXW0lDMSDiDleVmLq9204PnthTEx4BL5R1zSAo57X7s3o0vO/
 AR+gqGRtEZjpBVGqChm/YZnLjxrXVuOoafQrmThwDESkm9KaN/K5kBX8C
 V8Da4uhXYrdqkPHp4BoGMpKu6h4ZvnGPctg/rq9iVz3wXZpPVlGtTgVeE
 9+7rlv1demqZg/5PNZe2TkxqjudBFye6iNPprwtVRILMG+ad9tnGn6gaK
 68ibsgAqV5CZA7rIeJ3lXNaGOoiEd3BwkPSGz/LX1Av5uap3GlWPsmR36 Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="339318470"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="339318470"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Mar 2023 10:40:09 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6500,9779,10650"; a="629544339"
X-IronPort-AV: E=Sophos;i="5.98,262,1673942400"; d="scan'208";a="629544339"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP; 15 Mar 2023 10:39:49 -0700
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 10:39:49 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Wed, 15 Mar 2023 10:39:49 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21 via Frontend Transport; Wed, 15 Mar 2023 10:39:48 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.172)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.21; Wed, 15 Mar 2023 10:39:48 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Gpz/9Zil4BAXF9TM/jjrNdu01MgcEuOgSXer+JdyhgS3TDATZXTK8wJCub3Zdz33GUloCZMhAEXErZIZMKn7vX+QdPcFL2EhvdV1yr5UFCCWp5btKbdIaGqdfy++zkACCwEwSx1liIHLAIqnYMafNo59+axXfL3JpTZjjZy0Mu+2hNcgsuzKopKOAJizP5g4fg4Q/GRj5o7l/q4pGX1TQkPh8+YbgUfTCCOqNtUw1Frq+m64FW0YK4qAUjxswD1tcZVSLj/ag21kfRthybXxHF4UfPztgPGkTVeb+cMfN70BkW+JgZ1/TEEpTZFRT+7yujrIaLXR2olglys4xEjcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hd5w4ptVTQuFjsYFwiMscMJ3lrnM+7qimcFrqVKo1HE=;
 b=T4jio7bKuiN3NJgBnQggjHO+Ll3WFJWkke3rhD1Hm97edJ/Akg77h9pEGAh8wW5ghg8kEJRJx9eW3aIt3gWYTY6e1tAEdnawuiFlsx3Gb527nV8S/5I0HktseRwC+7P2zdVgI//1fz9UhIeLLOb96Yj0iUVPHjsyNucXGMtf4+O1iwpWkHDKHLgg/CQMo/vFfgVyco+JcXfK1pJHIkvbmRg7rYA+qF9iW9tmlFWts05xyuQd+f7LvbOJp+0a7CxnWKoewdSXgxIoNIE+ADL5ReLGJrBZyDd3WJEz9hSNTDnC6w5Iu7pgyw/vjfV8zJ5S1nd7isWOck/Jm8x6fyECmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by BL1PR11MB5528.namprd11.prod.outlook.com (2603:10b6:208:314::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.30; Wed, 15 Mar
 2023 17:39:47 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::2629:fb12:6221:3745%4]) with mapi id 15.20.6178.017; Wed, 15 Mar 2023
 17:39:47 +0000
Date: Wed, 15 Mar 2023 10:39:44 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Mauro Carvalho Chehab <mauro.chehab@linux.intel.com>
Message-ID: <20230315173944.6b7kuhxzpmwu2gyn@ldmartin-desk2.lan>
References: <20230310081338.3275583-1-mauro.chehab@linux.intel.com>
 <20230315071145.27b77c86@maurocar-mobl2>
 <20230315171424.qtkj3gp3tetokeaq@ldmartin-desk2.lan>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230315171424.qtkj3gp3tetokeaq@ldmartin-desk2.lan>
X-ClientProxiedBy: SJ0PR13CA0143.namprd13.prod.outlook.com
 (2603:10b6:a03:2c6::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|BL1PR11MB5528:EE_
X-MS-Office365-Filtering-Correlation-Id: 33e884cb-0c7c-41eb-8dc2-08db257c4522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ReRtL+iQX8/KRTPfVlOylr4kwYpH/B0ywxDxdqMgGW1NM2EXNUUBtR0AJWuthUfob6h/16+Jh2apK4Hy+Ntt/boZPeHcsRabMwk+Mzw6ocfxkdqBSqzgf4sE3boSrpfaPlZ2JefL0rGnIwO36p1lVbEWFGJWxtEoSGWNdgYWhs/TuaEKTr1IbZwoutg4TNJo9xnrnX8kBb3QXrQrSiMSg9AKxGx8xJ/x37woH5QgfPQhWNO7o6j4Mi8clGTpMoKk08vDztUJFs+fSto/n8oZXG9sAeEZUsb206CRJUQkjag/akMSZjjKyqgqkFNqprryuhZIuhH7pFoT6DIDGRhrgRJPyG6M9Ki4Q0vUlj6iwiUWpZvlHm4CZ+szwpBDuej3p+JEXjZF8IFdg4YSskQ9LLxJ7EhaZm//0opz0Qx1i5ynOZp1VrSPwSLw4uzy6PoZgW8K9IdZowk5sJ8P5NYNnGDyOayqzqlrSxZW5Y+WxiTOEANhOre8ZXeoQxBmO09uUL0OzJFPHsJFw4ysoXd0kYEtQGb5TjGa/C1fn8on7ASPgQT97+bjBOfpaaCOJa2c9xB3efOufBlwzpg26Wsb15p6bZ7NL2jTLwYcCpdH5boz9K+cuTE0zkzJz3uU1v641ozUbjBX5DYAgNa3xYRHAg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(366004)(396003)(136003)(376002)(346002)(39860400002)(451199018)(8936002)(5660300002)(41300700001)(4326008)(6916009)(86362001)(36756003)(82960400001)(38100700002)(2906002)(6506007)(6512007)(9686003)(83380400001)(478600001)(186003)(8676002)(6486002)(6666004)(1076003)(26005)(66476007)(316002)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cHTmwmVc5DAhRWCna5srwHzHHN3CvvsxMW7vp6a83TlVJzHmAOLzEun+EB?=
 =?iso-8859-1?Q?WGwZV34ALqJlebr4HYT8lmmGAWrPkwtuXX60MQ4Z/Ga2wu9hkHTs7lTvBH?=
 =?iso-8859-1?Q?//XMtUyk3898RTrQhn5ERzAx5VqPM1L2lKFLnGbOCR26hi2E8VHM5J322Y?=
 =?iso-8859-1?Q?VtM5OR0Rip49crAomYqVqcJ4TWaanK9CFtGuB27OnT/tLeylfuUe/tXetX?=
 =?iso-8859-1?Q?BIu/l3dquCbNFEwPKm6+ATgfhspfeSWs1B1JU8WqpSQw/X/3/2Yl1+Pe6d?=
 =?iso-8859-1?Q?p8g4LFvJ7PPzI38RcFqYEb4xMwSx0KuIqC/9ccpiAwyQas8KayEnfLl9nG?=
 =?iso-8859-1?Q?vltMVdj+UCw8RAO+nxTvKceokYH0p7j8eTdaQcx7p/xGwewEnP/XBXWTOO?=
 =?iso-8859-1?Q?r1rqqWcLLjwHqf1trMax+3uxpKqyz9NxLTSK/GaKL1Egph5inP3tCdpRBR?=
 =?iso-8859-1?Q?uS7UaaQNlt7hk9YUYgD0vtj7Q73nwISaRLfnvUTd+a2pogz3nhnZuvoYZ7?=
 =?iso-8859-1?Q?ENoyW0MI1HQTSwGwAFzEKZ6UNiuEnKFCDiMbbYxKwedXglK76eJm0XHidK?=
 =?iso-8859-1?Q?PBNAlz9RTI1vqNRE6Qguwkhivh1t30uCYv30WTgOqAqub9cPsmJ+UHRVSY?=
 =?iso-8859-1?Q?xZ3z8H/CjK7PMCAOXZGY9BgJAFcWUSs9orgo4GagmDTjoJoiXQIHNHmljV?=
 =?iso-8859-1?Q?cKwJrsqVa5MaJ+b5vQsqN+cmjtpsNbl2Gi3BgUzH0r24J58lOou40d/nEp?=
 =?iso-8859-1?Q?DNs7+88GBefpD1Sf4okgQBHth633zAOlyyO5rEqUMSx4v3s86e6qYwd9kd?=
 =?iso-8859-1?Q?8+0uhsbtT+0qqSTl0jHyr8rNmJHxA/AIrI+ZYMKYbEjYbpMIYZixACTh26?=
 =?iso-8859-1?Q?Fsnu83LGWHEQzVsypnPoDpoc9lNVEyJRleVXSrZfOXIV2MbZrWGUM9ayCW?=
 =?iso-8859-1?Q?GdMAtxRElzlE+cMkdjfi1+JiOt9amMmMnCEp6QR1XBJN01piENIXcFPPgc?=
 =?iso-8859-1?Q?2vOfj9nyispiLaw0h62XMyo8b4EKwBNxzH9Dg2JjvZcTtWNYY03tMG2DIJ?=
 =?iso-8859-1?Q?OGlN8uY+yXLXbJ8xMC8j3CxnI8r6MwNgWKduDHX2Ji4u6LWZfpu/yR0DQa?=
 =?iso-8859-1?Q?VEnqJn450gtuoR4tX1dWa25bHw6wMa2NkQhBzXgxxZKkfGRw52dbnz+lou?=
 =?iso-8859-1?Q?YhHF+9oNyhrR8kU0QVV8XchJ6mhzOJdN0+AOjS/n+kyGRZ8dMQz9GbuxYx?=
 =?iso-8859-1?Q?ZTW29lR05YV6kFK1Pg+5dkL7fmoMFQHz98kSLHjDWIKE2zaa652TEd372B?=
 =?iso-8859-1?Q?1jAhM76oZH/Q2xN8XnI36a7E2Xty33aZAm23pxkRan+aCvet2L7vSAvedJ?=
 =?iso-8859-1?Q?f9wlIcDky2P162C8Ef4V9LbeeQmXRxRuG1VOB3e1I5cUEzvO2UX0862fCN?=
 =?iso-8859-1?Q?4M5BHaoU8EAMfKecIMO50eBxRZtP1tPN09zbxTGpVXruKteJVnjC9xr6EG?=
 =?iso-8859-1?Q?tzcEZUFZH+OwnS0w4mV5yp4P9zE8jhBwDBOi4ldNUVrkktxkfnqYjxVH/c?=
 =?iso-8859-1?Q?2J8C/0GDikjby21E0YSCmHy719H5hBBTq+WX5iVCxdK3kNjFzNJ9qLfyNY?=
 =?iso-8859-1?Q?xXopH3XtLujMR/EIRY6LCmKJ9SzHtf3JCoNYOrm9CEMVRXwFTvDfx/5Q?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 33e884cb-0c7c-41eb-8dc2-08db257c4522
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Mar 2023 17:39:47.0996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: QBwslWuVwMybhS1L4nf8ljEZfktWL2Nmnz2773ZjNNGTX7Wz+lknA40UdGdBZ89U4r2zH9iBDUfZSYyQ6cfiHG0XC1JnkTj8YC6aFaYgWrA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB5528
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe/xe_uc_fw: Use firmware files from
 standard locations
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

On Wed, Mar 15, 2023 at 10:14:24AM -0700, Lucas De Marchi wrote:
>On Wed, Mar 15, 2023 at 07:11:45AM +0100, Mauro Carvalho Chehab wrote:
>>On Fri, 10 Mar 2023 09:13:39 +0100
>>Mauro Carvalho Chehab <mauro.chehab@linux.intel.com> wrote:
>>
>>>From: Mauro Carvalho Chehab <mchehab@kernel.org>
>>>
>>>The GuC/HuC firmware files used by Xe drivers are the same as
>>>used by i915. Use the already-known location to find those
>>>firmware files, for a couple of reasons:
>>>
>>>1. Avoid having the same firmware placed on two different
>>>   places on MODULE_FIRMWARE(), if both 915 and xe drivers
>>>   are compiled;
>>>
>>>2. Having firmware files located on different locations may end
>>>   creating bigger initramfs, as the same files will be copied
>>>   twice my mkinitrd/dracut/...;
>>
>>Heh, it turns that it may not even be placing the firmware at the right
>>place, if someone does a symlink for /lib/firmware/xe pointing to
>>/lib/firmware/i915 (or vice versa), depending on what's implemented
>>at the mkinitrd logic.
>>
>>I found this on /usr/share/initramfs-tools/hook-functions:
>>
>>        # We don't need to replicate a chain of links completely;
>>        # just link directly to the ultimate target
>>        link_target="$(readlink -f "${src}")" || return $(($? + 1))
>>
>>So, basically, using Ubuntu's default mkinitrd package, if
>>/lib/firmware/xe is a symlink, instead of storing
>>/lib/firmware/xe/bxt_dmc_ver1_07.bin, it will actually store
>>/lib/firmware/i915/bxt_dmc_ver1_07.bin at the initramfs, which
>>will cause crashes if the Xe driver is not blacklisted.
>
>storing /lib/firmware/i915/bxt_dmc_ver1_07.bin in the initramfs is
>actually the correct thing to do as this is what our module is currently
>asking for:
>
>	$ modinfo -F firmware build64/drivers/gpu/drm/xe/xe.ko
>	xe/tgl_huc_7.9.3.bin
>	xe/dg1_huc_7.9.3.bin
>	xe/tgl_guc_70.bin
>	xe/dg1_guc_70.bin
>	xe/dg2_guc_70.bin
>	xe/pvc_guc_70.bin
>	xe/tgl_guc_70.bin
>	xe/adlp_guc_70.bin
>	xe/mtl_guc_70.bin
>	i915/bxt_dmc_ver1_07.bin
>	i915/skl_dmc_ver1_27.bin
>	i915/kbl_dmc_ver1_04.bin
>	i915/glk_dmc_ver1_04.bin
>	i915/icl_dmc_ver1_09.bin
>	i915/tgl_dmc_ver2_12.bin
>	i915/rkl_dmc_ver2_03.bin
>	i915/dg1_dmc_ver2_02.bin
>	i915/adls_dmc_ver2_01.bin
>	i915/adlp_dmc_ver2_16.bin
>	i915/dg2_dmc_ver2_08.bin
>
>And i915 is also using those dmc files.
>Note that for this item here, the duplicate firmware blobs (if you also
>have i915 built) are the guc/huc ones, not DMC.
>
>I still agree with the change here as it's expected these old platforms
>are primarily supported by the i915 driver and we don't need the
>firmware files to be in an xe directory.


I added a note that I don't agree much with the commit message, but
overall agree with what this is doing. Pushed.

Lucas De Marchi
