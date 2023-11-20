Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F3E1C5AD4C
	for <intel-xe@archiver.kernel.org>; Mon, 20 Nov 2023 18:20:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3135210E217;
	Mon, 20 Nov 2023 18:20:27 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.88])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B9310E456
 for <intel-xe@lists.freedesktop.org>; Mon, 20 Nov 2023 18:20:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700504425; x=1732040425;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=Aj+dNX2FUvdmddyylb3zxjxBfbUThp2n3c8Wsx5YW5Q=;
 b=U70Izr+A+fg5AVG3v2HPKwEoHQmntOVaaq99yKTfMuicNBBylMV9bGve
 4bTupb90469c0K+BTW5qFvRwZJhpPnr/5RPnwFdByuoNhwhy92VghY87O
 9GA1e6ehGkn9m2zm9AuYGxbZD3J4/QH76VvjFXZAT4aG4fzTN9GxZVTQA
 fqChY2LAjYJyFwb5GznziyfYB9nXfdzuw1t+WFxCk+Nk3OSFeU8qMP0cL
 yAES1iAwA54YBkoR1myV2NZgI0PVWmAYU1cDQBd9cWDWbUjT2m3TN35Pd
 CbUQKXl0br1PGAkrYljQgC2EekKLIoxbpB83zkALt+ClkZaunKY/2OAOO w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="422771968"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="422771968"
Received: from fmsmga007.fm.intel.com ([10.253.24.52])
 by fmsmga101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 Nov 2023 10:20:24 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10900"; a="769986457"
X-IronPort-AV: E=Sophos;i="6.04,214,1695711600"; d="scan'208";a="769986457"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga007.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 20 Nov 2023 10:20:24 -0800
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 10:20:24 -0800
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Mon, 20 Nov 2023 10:20:23 -0800
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Mon, 20 Nov 2023 10:20:23 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.100)
 by edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Mon, 20 Nov 2023 10:20:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VkiZ5h3Xy2S/Ny+wJHkYnIqQrML9VLtEJHRsPadxlW703tBjCnvsMSUsXEPRt+blmOS+7+sc6kllKpRAJ2o6V90MDdUlJmdNGl3DZUdYAKt+/LMIebPh22vtyhFhwKbSJv4iNl0g8thOKK0d89ZRZtJR4vYSb/gj5qvQFAExN76GLPvwE+lZq/UPNDfYVn+ZHopj3Xjvq/mEody650fo3xeKE6Se7nb1G7u1TXxlg3paX7XZ0pDsDrMN9MCWYyTp5REG6lK0BXUdQoWKX8jgPxwFwdnkIx0WrrE09sdLVxyxc6Y/BVnWxBIVSwK20aALsvkYI2vpMmps2hDzclxjRA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RGnVZuD60tOKlNKIun+GPLJOXeZdZdmvkf8Ff/c0WRo=;
 b=OmrwYLm9c6mRXSUX9Sd2zS8+/U6V54R9EAxuZkb60K4qW4KfYgMD8rJ9W0FQlOSVI0tEDetjR12BesL7O2WjUnX4ZK4DyrnLyGmXS43+1cd5Nls7zKgUj0EQA+Bo681WGlDwD7hG+S0aYhn9z2R2Jlsg/egFKcpvqqG3HWCWHlirB05z+sb19Q8qqkdGDkd8o+fZoR7Hp6gAODkXXvG3n+o6tcnbRfpvRMpoxxm1dDpRlVOcD1P+4alZhtZjLwGTHGc41APlaGu5vZ1yLSnH/VtMSLt+Ggx1KNysdjWOb2XTE3ttaMPJiRnmlRfiRCNr0oxtoR7ggKEzW5RChOl0wg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by CO1PR11MB5188.namprd11.prod.outlook.com (2603:10b6:303:95::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.27; Mon, 20 Nov
 2023 18:20:21 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::b870:a8ae:c4f1:c39b%4]) with mapi id 15.20.7002.026; Mon, 20 Nov 2023
 18:20:21 +0000
Date: Mon, 20 Nov 2023 12:20:19 -0600
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: =?utf-8?B?Sm9zw6k=?= Roberto de Souza <jose.souza@intel.com>
Message-ID: <yruodwexdnecbqxuenxnad5xqg2th5n4qqzf3j6p7hcm4ovbh4@ekxxdfzuxkvo>
References: <20231120180717.55182-1-jose.souza@intel.com>
Content-Type: text/plain; charset="iso-8859-1"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231120180717.55182-1-jose.souza@intel.com>
X-ClientProxiedBy: BY5PR13CA0006.namprd13.prod.outlook.com
 (2603:10b6:a03:180::19) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|CO1PR11MB5188:EE_
X-MS-Office365-Filtering-Correlation-Id: d0d73072-f3ed-45eb-7379-08dbe9f55b5e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: akdwyKrlZhdHGWdbATqN6mizDiH8kU7FyiKaW4hJJnN15aQSA1MT4Es3OoF3Svr0MOKS+Y7VQ/UWI2ooBcyQ0rhrTE8K2fByOgkD1IFO2McXF9BcAffadabT2m72ew7g0/78S0MpA40lkb9fkEHEcmlF4UnNzddeun2Dg12z/wen0A2XI5GU+NlbFEJmuxADb9Mwo66OoRYFifptAHeuCIUKHHyW71MA5CGpL52lmmqh6S3RSPkT5pubTOSlsnVU9CE4p+6AKZdAItod1VY3AN+ROoiuBdQEtzXh4l7Qwzd4fYA9tFMpAj8jWACTUzEms1PZX3HKPExmstFSz92k2+BFtxpeiASGw1QDvlCWvrhVrnvszoBACZfbKbc1DKWpjl1oUU+/vuLweqvPwzrJvjHlfH1NtvNHtllnVyHACoOHzlh2j1Oc3rW09BA0GqHGQtyR21gIGgULwh/nxLDlWnGKEqKSh2EUcyGRBhQdaBgW9+1LbuXp/R/sjox25XRh/MYBhJjLwWyy1ibbWUbKIcIIkEn/dRKlModQSGdt2wB8w9AmrnR5yNNdMq2ZHXc2uwLpmmMrVMmVJBp8lly7fa/pvj/G/IQD5vpZIcbzAoMxZXPo7RatC8LXLDwL5IsA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(396003)(136003)(376002)(39860400002)(346002)(230922051799003)(186009)(451199024)(64100799003)(1800799012)(6512007)(6506007)(6486002)(478600001)(33716001)(9686003)(316002)(82960400001)(6636002)(8936002)(26005)(8676002)(6862004)(4326008)(38100700002)(66946007)(66476007)(66556008)(83380400001)(2906002)(5660300002)(41300700001)(86362001)(27256005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?4PfK1/qOauGjk6r8oaxpdZhYqG8qvnlJe12in8g0nqH7TUjNT2GCzOXfYo?=
 =?iso-8859-1?Q?E+kuQZDR59M8++ODR9qt3X9K7v/Jj+Hb+CFnoz4EpgiY443Qz5OHdBSc2k?=
 =?iso-8859-1?Q?Hcfjy28KVHx37vS5ULbMO6Nso2QbkBPaY6schJvXURv7T/JgMGGRudhgDr?=
 =?iso-8859-1?Q?A1jF8qDibF+xYenmFuQDqajRRtlgTfP8XhCeFrdfUuojpaAWHGivL7VfpM?=
 =?iso-8859-1?Q?2QbyhZCwgfPZDSZXm7GDeaf3maJST+OWS/25Uzc2rhk5IPVl5vVFrPTGc7?=
 =?iso-8859-1?Q?O7BaIwsVKFPoeanqPJ49TQ0oaltHs3bYOLgumFGp5ntrysDDUxeohNJvLb?=
 =?iso-8859-1?Q?T5SgZDHi1A2zEXbaQ0g6ZwuNevCFlRC169Khn3ck3ign/XyQG1EFBEMJc3?=
 =?iso-8859-1?Q?w+J3LZzx4e3GQ/PsCoT0n0raa8XY3ksh0l3BrVwhLE9ZoPqJFoOq1qbqT1?=
 =?iso-8859-1?Q?NT1aOVRskw+iAOR9Auv2j3pIgzw/db6Pz4pc36Lo/7YG4ih+oar/hklMuM?=
 =?iso-8859-1?Q?vLrh7k5n0G27pl1lXTbollFb52rgbm+ruFF6zGuRQeVqADyQYvkvCw0MBb?=
 =?iso-8859-1?Q?6M/nSDr1gyD1U9Xn3znbV/85BLkhnHmvnUB5viU5OS8FoL4XZSBylO1PV/?=
 =?iso-8859-1?Q?9vAX7ieko5QAuZ1IDRWqp8sg0G4cZM1Qs53djY/r1Xi6j9zXZmuk0B7Ano?=
 =?iso-8859-1?Q?D8fe7Vk7lSPmBp/CZ14ffl6vJ5dtH0nhWCQWN8UFyKn2vsT6ewQ+WVYmr3?=
 =?iso-8859-1?Q?jTqCiWzQDkCEIY7U5N+UnUVJCJmKr04khG1NWvN69CMDGL7He5KuN/huGk?=
 =?iso-8859-1?Q?GJm8+Tv9qGqrhnd+to/iRNZ8SiLq/bkXJIEXzDQRmXdLvPKbCFVvd/X/Id?=
 =?iso-8859-1?Q?yLWjyowiBVpCUYbvBTfOYP2/vhxzbzNHDeKUGisQh4XmK6IE/WbI+VLqO9?=
 =?iso-8859-1?Q?sBtwJkWv/v3KKmeen4EaxiLMhvuSFNucae7fF3VaPPooEnRnHT7WCTHOce?=
 =?iso-8859-1?Q?KGpEth/Az9ROHbMuyIS7j6nyss4Dv/uXm/fPnafUfCpMV/clGDYg/235ff?=
 =?iso-8859-1?Q?+AkrmNKkoA9kvz+RiDzjt7ymPlutv8ZDuig9sIJc29GG77GVuinx8iu/uc?=
 =?iso-8859-1?Q?2p+dPAY4BweqtqbLMyZ3PXmPs0CuM82GCISuvF1W5/bjL3MazbrRxLnfQW?=
 =?iso-8859-1?Q?ixu/v13oDlTr4qj93MHojFGrjjqMJO3TzEejsKUNyphDV71SGRQIe1Xv4/?=
 =?iso-8859-1?Q?n44NsSkqG7mLTFY/Z1a2ycAdViEzNUeBB6A0ULAXqH/Ol41hAwWe3kLajr?=
 =?iso-8859-1?Q?5FGYIWT1AxriH/V5qJtLQc5P9S/1f2/oX2dNlCvr8De/Tey4lyQ985ty0b?=
 =?iso-8859-1?Q?4i563msv2ZHByM4oOqHctqBWWZKKYvYio1rmABDU/HEBnscTkI7kTwWaBr?=
 =?iso-8859-1?Q?OK0qVDhZsSYF1GE2lvttZmYmQxKivus3cHlIdJOT+blQ4fcuiqNORGCr1d?=
 =?iso-8859-1?Q?bJT79VvCn8b7yJ/VFp+n9Te2oazYB3PxmkPqTlvsCCYKSwG4W/GTMoJUGE?=
 =?iso-8859-1?Q?GnfsV74soRYfzDmT5y5D5yRgQBn8yKgsKPHgdx9YKjIl/RDAOzfQil9wBe?=
 =?iso-8859-1?Q?kT0T3KG8joV6qsuB5e0L/BHs/1f8781/FclSuePe/yUWt88nGghEJx0A?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d0d73072-f3ed-45eb-7379-08dbe9f55b5e
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Nov 2023 18:20:21.4062 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: v3LENCMfqXbZ6jGLDZuSMbPtzB6oeojj0da3kjSXNAytKcubb/sO3fY2sWT7DZ73oTOoC4b/y2fcHyy6+o2EYJAQSZ2K+fgo6EZU5beC3Hg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB5188
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 1/2] drm/xe: Include RPL-U to pciidlist
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

On Mon, Nov 20, 2023 at 10:07:16AM -0800, Jose Souza wrote:
>RPL-U is defined as a subplatform but those PCI ids were
>not included in pciidlist so Xe KMD would never probe device with
>those ids.
>This is following what i915 does to include RPL-U to PCI ids
>probe list.
>
>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>Signed-off-by: José Roberto de Souza <jose.souza@intel.com>
>---
> include/drm/xe_pciids.h | 3 ++-
> 1 file changed, 2 insertions(+), 1 deletion(-)
>
>diff --git a/include/drm/xe_pciids.h b/include/drm/xe_pciids.h
>index 68fbab161feb0..574a17c022490 100644
>--- a/include/drm/xe_pciids.h
>+++ b/include/drm/xe_pciids.h
>@@ -119,7 +119,8 @@
> #define XE_RPLP_IDS(MACRO__, ...)		\
> 	MACRO__(0xA720, ## __VA_ARGS__),	\
> 	MACRO__(0xA7A0, ## __VA_ARGS__),	\
>-	MACRO__(0xA7A8, ## __VA_ARGS__)
>+	MACRO__(0xA7A8, ## __VA_ARGS__),	\
>+	XE_RPLU_IDS(MACRO__, ## __VA_ARGS__)

no, i915 has this:

/* RPL-P */
#define INTEL_RPLP_IDS(info) \
         INTEL_RPLU_IDS(info), \
         INTEL_VGA_DEVICE(0xA720, info), \
         INTEL_VGA_DEVICE(0xA7A0, info), \
         INTEL_VGA_DEVICE(0xA7A8, info), \
         INTEL_VGA_DEVICE(0xA7AA, info), \
         INTEL_VGA_DEVICE(0xA7AB, info)

What I want is to be able to do

	git diff --word-diff --no-index include/drm/{i915,xe}_pciids.h

to see what is different. For example, we can clearly see we are missing
one pciid of ADL-S:

/* ADL-S */
#define [-INTEL_ADLS_IDS-]{+XE_ADLS_IDS+}([-info-]{+MACRO__, ...+})             \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4680, [-info-]{+## __VA_ARGS__+}),    \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4682, [-info-]{+## __VA_ARGS__+}),    \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4688, [-info-]{+## __VA_ARGS__+}),    \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x468A, [-info), \-]
[-      INTEL_VGA_DEVICE(0x468B, info-]{+## __VA_ARGS__+}),     \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4690, [-info-]{+## __VA_ARGS__+}),    \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4692, [-info-]{+## __VA_ARGS__+}),    \
         [-INTEL_VGA_DEVICE-]{+MACRO__+}(0x4693, [-info-]{+## __VA_ARGS__+})

and that RPL-[UP] is the mess you're trying to fix.
The diff for DG2 is because we didn't cherry-pick
d0c908d2978e0ef3c1ac1357c1c58224a153f8d4 as it's
not really needed.

Lucas De Marchi

>
> /* DG2 */
> #define XE_DG2_G10_IDS(MACRO__, ...)		\
>-- 
>2.42.1
>
