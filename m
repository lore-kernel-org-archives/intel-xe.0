Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8ED48C4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 18:40:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6553210E3CD;
	Mon,  4 Dec 2023 18:40:58 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4098310E3D2
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Dec 2023 18:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1701715246; x=1733251246;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=2cc7lgbo8UelwdtkGAH/bucfI+T10gVsZl463D3dW4U=;
 b=BBw0y7mfxZBjCx0CGl0tXljnefODfQQecVGEP5Qv7DsTmYW1M+5c1my7
 gM7PzUQdsECk8IDb01KD3ByXMJ07F5m001fJsHICr7GNALXS4Zc8W5lcm
 ty5iL2OgN2QKZxOzcUk56jkKO3/eKxP0iDorpCwOEnW/9/S0ePXMzOt5/
 SGaec84DYN+kjBEhcwwHvYEOocgM7rJQzbML/w8v9xnMw3poOYTvaVYLY
 MvrUvFZDAUwKU+itTTjPNeSpXydnkPlxj9HkTLCcaUGoJ5GDEzpO8eT0T
 tWdVl0Awk/ZS2mfmwfcii7eHi6Il4VrpqV9s5elpDNHP2Y+GXHrIXnDgf A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="378808056"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="378808056"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
 by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Dec 2023 10:40:42 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10914"; a="914532501"
X-IronPort-AV: E=Sophos;i="6.04,250,1695711600"; d="scan'208";a="914532501"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmsmga001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 04 Dec 2023 10:40:41 -0800
Received: from fmsmsx603.amr.corp.intel.com (10.18.126.83) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Mon, 4 Dec 2023 10:40:41 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Mon, 4 Dec 2023 10:40:41 -0800
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 4 Dec 2023 10:40:40 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K/WUGSrP77nAW5v1jbiQuyoIB8M9NFrIB7N3Sfvh4UY7dz+JNOQGRdrd3KU9dXWa09boVjQTyiaqjGZeJzy3Eyp05PhHKfUoSfeXuc3ePP73U63gvdsd6Yhd+zMSK2oF5hiYdCqqCM2UfL7v4jxbOqdKa2p+P+wxSgbgJiK9Py5cHKxAK9g0qRGs9ul6oNX6gn7jFYfCmNIntEFrdmO8juW7Rf2N8x8icf6DoY3L1FjDNe+Uba+tYI/BDmZsg7+sjvo6epBdKu7M574eqnLXdpF2kVSTG6K+uCHADT0nLLCB63cEdGd7eXZGViuiF5pJvGAZAZGz7P2O9A6QQbTMig==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M1Go2iqXBHe+JnC3JtnE8p793OFRdiJjjAzy6WUgALk=;
 b=BtaNBkC21KR346ieR/Kmrh90HB3lTHxysqfbmEdma3K4B0Cym3KruRj4YSLqsVrcn6SkaYmvk4D5o9EH+qGSkJwomTKo72xXzOcJLaDqcPJR+neKbHBGEAuI4VOgB/XML8y13vUFpjOXAUW4wCKAWaFfV3KVMJ4S3GXq7nYNnGsZ3MQY+WnTIxUtFhWjV7xxKzCiLCQKmry7IE6qtJwiUtl461C0uSpuyKuMFQOvgcxa2JqRTBBAxP3zlLTYC7ch7twOj94FXlJbITTp5E05P4caRI8y5SivdFfV54l5p10JTFG6tZl0R2xhv9nabj96fvvaYrvl0s6FUvsnob593w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by IA0PR11MB7331.namprd11.prod.outlook.com (2603:10b6:208:435::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.33; Mon, 4 Dec
 2023 18:40:34 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7046.033; Mon, 4 Dec 2023
 18:40:34 +0000
Date: Mon, 4 Dec 2023 12:40:31 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Tejas Upadhyay <tejas.upadhyay@intel.com>
Message-ID: <w4zznqo5xdko2gpx7sfhcmkncxgmqk5ewtopzpof6z6vvry3je@pla64iszsa3p>
References: <20231204114525.791141-1-tejas.upadhyay@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20231204114525.791141-1-tejas.upadhyay@intel.com>
X-ClientProxiedBy: BY3PR04CA0023.namprd04.prod.outlook.com
 (2603:10b6:a03:217::28) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|IA0PR11MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: d5f7b4dd-c08c-46cb-b7b1-08dbf4f87feb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KXKkrx7xVTnoP41no7NvSji/Wp5KfBPZYEfqjnTZVAiFARmE3EBds5aaDEtdYhuQFzp7EB0hH/Xom+AqJvp8lmDjABikIyY94y8+ovrsfCrM+Ct4l9O/g4jtKRKgOLI9qn4dyHA4sOUmCPbSbnQhmfTEW7o8S/WJWUyLwy6GB3/RrYGWOPsFj/IN5jZRGPj6N/wnE/+gHFFtxRWgrEJ57srxGJ57CvvVr/8ZazNl6b58ZfDOAqfHEgOks9BgsKbaVBw/uhdRXAZfRXRSZ4DC3fl563mHEp23QUYwvGnN61tuYGuzyCcX8QeluZbIWggqEABkkpyRAtGN7KiwqV9iKH9uwnbgzGahuJINmMYBiOIiMaxGB6yNh2Q7G9ymmFWOG0fmc6NtJwiWrNG9RVHDLsN+veD2+U4JqarRB471GPp+Zz0amD5dht2b8pXyrbcESChI+r/EAS5bNbgngkt55+AFvLt85o5S/s3ORQW6SfP9z1UfmIgFmZrMbnoFhPOC1qL9Fh0IGnXR/Oc/8tphWT2LNcwXy1XCHstq/gtTnJWPysJfD8GZ+Z5lHVppZfJL
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(39860400002)(396003)(136003)(366004)(346002)(376002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(316002)(66556008)(4326008)(6862004)(86362001)(8936002)(8676002)(6636002)(66946007)(66476007)(478600001)(6486002)(41300700001)(2906002)(5660300002)(38100700002)(26005)(6506007)(6666004)(83380400001)(82960400001)(6512007)(9686003)(33716001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GJqm1LC+JQ4GU6bdUwt2ERzCpxwXw0IpWBVAzNoffLatMJUJHsQENC+8xH9t?=
 =?us-ascii?Q?dyzSdnJTNY85G4uovyH06kpsheESzSA5Rj4mEPx9zLGdD1J9yLgVuoFh3Dj/?=
 =?us-ascii?Q?jqxrOBbpVNI6X5P+v0IXsn2eFGhtkgawWduJjH5407J/WSgNr9add5KQM+Ql?=
 =?us-ascii?Q?6WH6Lfm41sPnvNxw/aT9C173e2dyCm2o1arsAUYkzCLjBzHe80lRS1OOBWX0?=
 =?us-ascii?Q?ywEWFqMvqsqUOrvcmkMwTDH48233bHaipGZpOsPY+AW/OIqpZ0FrJ8r95nGb?=
 =?us-ascii?Q?cXfl4a5c6YzgBkHEMa/InVLQV2WGZ7mxQX5ilxHhm8vl/EOKrkUYPw/baKlc?=
 =?us-ascii?Q?BhLlPO/79vOleqgbGGPOEKA5D1wEq6uiUN8wLbdfhX5CEGVXZvWkC7GjZerX?=
 =?us-ascii?Q?vq8XucJaRYGervnr5FJXxTNSsrD1Ye0vOAIS/8P9T5WV6ZMWB7adZqI3+PVo?=
 =?us-ascii?Q?aiuBx7i4BSj2LR0I0WrGR77sHKAfVKTvWMsNNlCJlZbQtfVK49jQixKz+hw1?=
 =?us-ascii?Q?1FT7Zii3yD++mxZ3miLW+PsdrMmlElVfiCz3xSsbSQ5HSlWW7tIvXYWQNSiz?=
 =?us-ascii?Q?USW/wwpRK0izrvCLlO2y+Tn7wBWMdvpINm3cp4vsQEVPVfdZAcop+8X40ZD6?=
 =?us-ascii?Q?vxoMoAHTw+He6+PaGEA/nwfGT/FKjqyAhlfVJoVmrSj7zPop7QAK/jV8o1qz?=
 =?us-ascii?Q?dM4rGr3jpjKKKNKWU1MdoYhSxFqjkDBQyyukZwxb9XknAlO5qeXPxxl19OC5?=
 =?us-ascii?Q?BhjPCzALONrzCgcmqSxkv32j3WlLX2dHEh6b1puXcD9lc+8lsZNYTTpY67UH?=
 =?us-ascii?Q?3HTNJ/7R9oz7b2UUEFeeAyg/pDl9lIzl19xsXuuKp38cHZMXxF1Vr/aGIAq8?=
 =?us-ascii?Q?X0SmtU2Dd8ugJLBawzvX52D7ilUagIlCAP+YbfFO/MHRxyu5741Njnz8/Kki?=
 =?us-ascii?Q?L2ZKQbeOoehLZbgu/VLp+1fgWzmCtTjd1/rlS+Nyb5zCCkBgAiC4tCdMtVtV?=
 =?us-ascii?Q?vDQjLnGAbCdzaGvhJW0JzlsIpZdUpT5uxZD8M3y9usck0be4afZnD+as5Dwt?=
 =?us-ascii?Q?kQTvTx2RvGqfosHMDggXQ+v9sJfStfMQvmw6Ra7rDJqVRJjykIaxvtuT7guT?=
 =?us-ascii?Q?9vh3D7l71C2VJoQMthmcTSIMsghQTqTfrQ1qdeK6kPXakWd7l0R6p4HukOtH?=
 =?us-ascii?Q?12eiW3ZXqEeUWiXJ/SSMidAPTb7zIxmkSQymVULey9SlKmRNxWVKyqrKbibc?=
 =?us-ascii?Q?xI7MnJpNJCDVdCrm5nXzQsHC2kd7z7A5y52ctIWIrFDNxgeHxiu9zebV+U5B?=
 =?us-ascii?Q?AWp6J/Ph6N5lG+uUNxe9KYt/WdM731GzwHmA2t0TuJxt58Zd8CRNwmMLTDn0?=
 =?us-ascii?Q?5NL7j5uU1844jBekIgbZRQTURjvRONc+oEInZ+CN6wFekk9imVUQD4zOUnIq?=
 =?us-ascii?Q?eK0IK4GPXfsKCh7AmIX26lrI5q5BVkDL+cZOotFoy5JZp2adREeXuYu80r8v?=
 =?us-ascii?Q?Z37708P9bIj2xUyMW44OQ8JOSzcki80unuTbKBPEjI3+fnhx25/5sFAEwxHS?=
 =?us-ascii?Q?plxTqKOVqlr/FRrqmlTpJvoW3oplEKM10Z1Aaxq/lj55qCJyvoQoj4h5fJWi?=
 =?us-ascii?Q?mQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d5f7b4dd-c08c-46cb-b7b1-08dbf4f87feb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2023 18:40:34.0459 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: zAbB5feQTd97syGJAT98XJ8/y/sBp3OoWu4rDz9Eq20Jqe3AYit3aP48dQue4M3oQOyxocONEFC4hm8FeUAm5w3OjB/HO4pbDBrDzuGCSsA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR11MB7331
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH] drm/xe: Apply mask to RING IMR
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

On Mon, Dec 04, 2023 at 05:15:25PM +0530, Tejas Upadhyay wrote:
>As per bspec RING interrupt mask register will have
>lower 16 bit masked by upper 16 bit.
>
>Bspec 60352

am I reading the wrong spec? 60352 doesn't say this register has masked
access, i.e. in order to write any of the 0-15 bits we also need to set
the upper bits.

Compare that to e.g. 60279 where we do have a masked register
BCS_SWCTRL.

In this register it seems the upper bits are just another field to be
set rather than considering this a masked register.


Lucas De Marchi


>
>Signed-off-by: Tejas Upadhyay <tejas.upadhyay@intel.com>
>---
> drivers/gpu/drm/xe/regs/xe_engine_regs.h | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/regs/xe_engine_regs.h b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>index 444ff9b83bb1..d9013c698710 100644
>--- a/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>+++ b/drivers/gpu/drm/xe/regs/xe_engine_regs.h
>@@ -39,7 +39,7 @@
> #define RING_MI_MODE(base)			XE_REG((base) + 0x9c)
> #define RING_NOPID(base)			XE_REG((base) + 0x94)
>
>-#define RING_IMR(base)				XE_REG((base) + 0xa8)
>+#define RING_IMR(base)				XE_REG((base) + 0xa8, XE_REG_OPTION_MASKED)
> #define   RING_MAX_NONPRIV_SLOTS  12
>
> #define RING_EIR(base)				XE_REG((base) + 0xb0)
>-- 
>2.25.1
>
