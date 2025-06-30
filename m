Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E641C83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 22:29:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EDFC10E07A;
	Mon, 30 Jun 2025 22:29:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="E4/kRe9F";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8841B10E07A
 for <intel-xe@lists.freedesktop.org>; Mon, 30 Jun 2025 22:29:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751322571; x=1782858571;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=Xvb7twzOJJ3Zs2BrLOJFYlLdpjLx719jAZElNgHVeb8=;
 b=E4/kRe9FzW5LqX7Id5AKvH0nQqxTi6Xy8Rijgy6oC76kEF/NJ3DmqP7k
 imo5vww/ALYU8sQ44hP2WN+NkJnIemdSHdxvbgvoyOja0Cj1rX6sJCT8c
 pL3KdAVIjBtOp+LFieAIqzg64KLK/gTMH76y+OEgUWexrmz5jluhtr7XD
 6KYkIWxZnb9o3jGlCR873IiNIFMMHs8FzNtZo0eeKF/i3ZAeyV5k0G5xR
 fk94PGLKh73cKtSoj4CrW+n1e/BsmJ/Ys8ZQ4O+EIxZFZ2ksTrKDbQZvR
 C6/QnMdSqLMtizeKoWhg08ZFqpHvUd4Ateg25O629e0fUZ7usLe9knk+Y w==;
X-CSE-ConnectionGUID: 0pGXEKaeQziF/CcmNVeRyg==
X-CSE-MsgGUID: AB8WSgxQTC2TCYxvoRSpSA==
X-IronPort-AV: E=McAfee;i="6800,10657,11480"; a="70993427"
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="70993427"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:29:30 -0700
X-CSE-ConnectionGUID: F+oX61PpQYu8n5d9hfwkPA==
X-CSE-MsgGUID: yLi6vfEmRC2yezFjtdSnZg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,278,1744095600"; d="scan'208";a="153331739"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jun 2025 15:29:30 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:29:29 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 30 Jun 2025 15:29:29 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.47) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 30 Jun 2025 15:29:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MALlFxEi0K2l7BarForhQ3F41YsgXuEAoBw7rYDdXxuXGVK+m07fUE6OUHYTg1c3mlEnxNMpjogAswRHCfVij4tqNi+YYfVpomxx8teJH927ddj/hSSNl8qqVxzWNjHFr1nMBnpiR7EDY8Ws5h0RJ14qC99P6nQdI6mSnC9+mlHtt6TeNVDemC4L820Okny1+dmf3YKavO7z+GFf30Q9LW0Dd0qfu+rnsWTx2f4aRAVKyFhUvt+oPtN+cMXToiIgeBaAzvITYIwCeCUQvturkeun5l0sbtCqLnW8swaFHAiMHin/UuByqvPpfoVimaKE88hXoqAmdKd4H+M61bpbvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Xvb7twzOJJ3Zs2BrLOJFYlLdpjLx719jAZElNgHVeb8=;
 b=nxRhg2XTC9UyTOVWCVE+BwN8wFzEgpetiNQYkuHBzoU+Yr/okY8/LKb5YVM22MLNIO3o60P5nGoiHTOUZPAJNzpsR86t5vBigDidMhei+hYaIUBxnEJJreSfwYJbp7q2tKBHsBRfMZElHVh9fINzK/wKU+TsM9/w5c3V8x4kfQUmgIZrtOpK0GdnZS3NC6TrXk5sKpBKCihZgr/S0UqTbS4+9GJJEZ+8eNeNbHrw4vOR1pzD8ZNqju0COndpyDRluGt1WS2vUABCbPEAxv7LmfzSW6QIGsAnSp0byJQmBFVrvGGf5QFqSwah9Q8/KIETLx2hXmMSUuNxzdw/ByRcfA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7467.namprd11.prod.outlook.com (2603:10b6:806:34f::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.30; Mon, 30 Jun
 2025 22:28:58 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%5]) with mapi id 15.20.8857.022; Mon, 30 Jun 2025
 22:28:57 +0000
Date: Mon, 30 Jun 2025 17:28:53 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Riana Tauro <riana.tauro@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <umesh.nerlige.ramappa@intel.com>, <sk.anirban@intel.com>,
 <soham.purkait@intel.com>
Subject: Re: [PATCH] drm/xe/xe_pmu: Validate gt in event supported
Message-ID: <q7bmmb7s3v2wxjeamrcuhcpwm23tlju2l3uqobg3mo4y47dj5r@ndr2kbjfhhkc>
References: <20250630093741.2435281-1-riana.tauro@intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <20250630093741.2435281-1-riana.tauro@intel.com>
X-ClientProxiedBy: BY5PR04CA0007.namprd04.prod.outlook.com
 (2603:10b6:a03:1d0::17) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7467:EE_
X-MS-Office365-Filtering-Correlation-Id: 2cf0fe90-f6e2-4705-33cf-08ddb825811a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Yy4FotsN1tyFrDevj9HEj6+SgPB/kkDTmzOBElV9iSfhn74MfHX0oN3Rx3yS?=
 =?us-ascii?Q?eyCXywL/WfcBPGnIO0hPsPlBSmQEtvL7U+YWqgnv10fkfDAduMGZpd7olMQg?=
 =?us-ascii?Q?skUi5mjrp3edrltAYn0rAF7M5tfDxYaQsZNhnJLMXqOGT39gw1vvN5wZ8GBz?=
 =?us-ascii?Q?Or5JQVEMnVapYlXdO99tkBMqREfY5B/aL0augCBiBjcVIYW07+GjjJK65/7H?=
 =?us-ascii?Q?z+oUx6mrPLVLgcAkVR3SjcjYE8M1EbAa/DIrDAta+ZqlAJu3XGrx8dkj069E?=
 =?us-ascii?Q?vb1l9JyBUtYeX6vUZQiw6SGCwav1Nd1bd2thlSSAgPkRsXObBtAi8ew0ecjH?=
 =?us-ascii?Q?D5eFNdDOviCEiaqoaNolTwWilnRCdL/1K5JwarxylcaBQY3PwZOaj6Qx/5xZ?=
 =?us-ascii?Q?qnoQz78aH7EM6K9DlGlYg9mR2eb/k2ULfnikJPcoInRMWmCTQupvmo5cGzk9?=
 =?us-ascii?Q?Dhgm+pr7Q1Xy89hiOiulhnbFj1eXhBZy+qnrAEtd8ELmm2c4lJCmJeEHMDcw?=
 =?us-ascii?Q?XkXJ4lPlRUw7ZQWRR9hvMHwQ77/clrf3KCBc7nEYl1FAgztKCwCzP0Z2CwTX?=
 =?us-ascii?Q?lhFURZ7m5P2SuikaynoY27/9O2+dCUapsIIfLBqBvqUScUBgBRGpIONLx0mR?=
 =?us-ascii?Q?MA4MR/tGa+/MxS4veDK6JMQeMjHrP6dFkzQRRjzbw/tF7jtfZ+S171A41Agw?=
 =?us-ascii?Q?I7uKVTVVb2FfUXGa0ZYY+QPpAl2PV+bqypO5wrag2eQOoj6TvacsXhj5YKDF?=
 =?us-ascii?Q?pN5jxGA5fcyWMZh2vqU44kOxD+cA0ClWZmv0efMf4nscZPrpjkoHmyBH5BZv?=
 =?us-ascii?Q?rSmDUPaiY7XeAFqk/dxAvBn8lMfCskN8AriDCeLeEqRrI4P8EvbpDKdu6w6x?=
 =?us-ascii?Q?tlSVTlQEHRCL1Yy0ZFeAoPb7DCjnxPsuDVXwNewaFl4CemwMUTps3T+V3wrZ?=
 =?us-ascii?Q?plxTSsJZgD2/KbAj2O9RDp5kyuyMvo8u9O3CF/Y64xH5qZR1LvBYWAQ+RWjh?=
 =?us-ascii?Q?kCJn0yS2Kc9we3zn3i+AglJpmxVD/uTRvnPnhK/lTdzFLkRh6DSf/omwbjz4?=
 =?us-ascii?Q?PmSbr9igD92H1lPc9CkYceSEn200K4y679dV7RBu/CVGyTnGslFSogIkzXG8?=
 =?us-ascii?Q?lz+pi+bpRJ9j8hKiF1Rww0F9lyNbKD7fTGYe3BeOBb4vdkFP5h9DySRGu9F0?=
 =?us-ascii?Q?rypYzWb2+Nj1mN6oeMKaIM1O7Ldv0Slp66S4hlGlFUsGxQAgjIHWridYwwa0?=
 =?us-ascii?Q?wXPnXntAPahzujSB0e9OwsbRvnIvX3av4gHnTRaWMjh6ferB4ZjOEMitLryM?=
 =?us-ascii?Q?tgIz2IOUMPFZ6yLmdqqdy1C2DhxQwOoDnUF2FO6Kssva6lnFhrYIx3nD0nC9?=
 =?us-ascii?Q?+Kkam0/EoZ9S1cFzxoIwhpn7WwIYEZut7Zgt8YvdR/p9tZ9bjwQDif+SDhSF?=
 =?us-ascii?Q?yKMh8mYLD7Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TiaOE7MANPX59pA196fL54oaRxtdyvKA5ErWZbMKDEowXLV03ZgYwSh16wxi?=
 =?us-ascii?Q?mWfWIFDMfNAdbH7kWXimM4y1oSzrsJHiq2pNQTa9DLSXn+XaAViJRTLx/Nhw?=
 =?us-ascii?Q?c28IThZJh4UGxez+PG5ayEfMtFtpqlF5MjjIl6kWCa+GicgX9GCe6oEoMPBv?=
 =?us-ascii?Q?X+yLdRAJ3zjEQNVbKsiLis05RcPfbQcqyCYQnoBp7AFUz1pARVvZCipdL4Dl?=
 =?us-ascii?Q?gZZzphKc7Y6YCBDGG2MjLfRo85oEO1ns+Mz3ggyKC75ynrA4oQE38l8WFxhx?=
 =?us-ascii?Q?cxeJeVvMBHoPQuzZJx8PK9qao0Bj4WbMIEYkIrtsOirmANkSSCOoZcdCVJlz?=
 =?us-ascii?Q?s+U0sHvogruVifH2sOABrWWN9mZWhTGAceeEFamrKOI/BNQaxWfCD7PbLRJw?=
 =?us-ascii?Q?/o3iFiMvy8mRbjfwo4kOo1GiidsbkJv9b2Eu4uhZ0myX8AxyPsI0ZAqDpy6L?=
 =?us-ascii?Q?5f8n9v/xtWj+ClCRJCtHaVyUl+ayx3V9puqQ8l4RIlQYZNHnQMAKz7/PLdqQ?=
 =?us-ascii?Q?4K+HfMgsFqdfSIPWMNHo96S4AkRmCT9HJehI/kosZo+Wx9RaxbqtSCa4DikY?=
 =?us-ascii?Q?wR3lDYSNkrstiUQ5bKpNQEUr/Kjax2EGac5wAEvd+CFM1ObYCLe0JErWy/so?=
 =?us-ascii?Q?6IkAuGaDvMjNk9KCTR3Pk2Cnk8mI6H/Iopc/IIp5OREKaQjTp1SmDdG+R4vg?=
 =?us-ascii?Q?ayep21usDIZX/0wWhQIfFekJd7xkidvufYjJo1rjSU5BrxnbDF1UcGFdi1kO?=
 =?us-ascii?Q?rCv3oOkZIAdhWSD83cQHQBZL0/LCbx3XMG8gY06kpfI1N2Uw+JCRYX9GCwXW?=
 =?us-ascii?Q?UsYluPMHNMPh6HTu1UNuZILcIbMDbWrwL8oRgNg4sF9/AT6GQtbvLHntcfzI?=
 =?us-ascii?Q?7bN8fCNi14xpJm3Q4ikUOWr97JhdoWC+0+iWdO2lSRkJExDjOjMX7/cY1gnJ?=
 =?us-ascii?Q?WLqaJE8v4AFnGcXwsaEdAuRZ6mHTy/dhTAKJIzn4tuhH9gRmGmFdrrubjUWv?=
 =?us-ascii?Q?aX4uTd0Z27AYc2Y5TfswWLL0ETYjHg0s8Ga91y2Ekg11O50VimGBkU9SfYMM?=
 =?us-ascii?Q?/DKfRbDTQjlrzGs7pkQsYRoe9tZQtJLET4yRfAAk+2MwrmUrMKybKQZp3uAy?=
 =?us-ascii?Q?R/bHLC4uKVdoIH6RIj5bRucUgLwyTtHrHc8HIbeJFlOUlYimsGYgC0MKPlbu?=
 =?us-ascii?Q?J6BCQ1WOM+8oZ5AL83SoxRDll7hbbP/ft3xOflyXEyA2OYROGU2MBztWpiWz?=
 =?us-ascii?Q?BwwQUEALvPCZKVKiCtEQFHo9CZ51rck91Qk5wX3xogbM2oMEng6Q1aQy3GG3?=
 =?us-ascii?Q?gJLyouM2UOwmdCM6KC/Yr2KQ/puto74swpOpCCIHGoHUxRtaNCn1Gqhq/Cta?=
 =?us-ascii?Q?crXEzr/Z7sqFijoNEylP7ziQe3jKXuvJvDtMxYw46NnFz6eDPp5JgsezBJnl?=
 =?us-ascii?Q?iSHXSyChoBnOEWHxQOTRJR7nCkXGK8OfzodlESx9KVzbbpQeMIczRDG2BD7A?=
 =?us-ascii?Q?UkPe3iFixb/VH/Gn7tbn8mm0xJL+ph9/h+dwE/xITngh2S9MM6lDIkv7wqlQ?=
 =?us-ascii?Q?abxrXho2QmL/7VCoXDGykaNFGGoLRL2mqwLYQXsFl1AroHo+mUPwszcetdzH?=
 =?us-ascii?Q?gQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 2cf0fe90-f6e2-4705-33cf-08ddb825811a
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jun 2025 22:28:57.8673 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hgpy9tz8dwReoa/VzY0QSRsQjyX0x0s3sL5Cr6G928YxNKvNZAzNAvS+7gkn9o1Rhp82GbrfVbWpZjKhWt3/HN0kietv7LpNUhl4/LenS6U=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7467
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

On Mon, Jun 30, 2025 at 03:07:41PM +0530, Riana Tauro wrote:
>Validate gt instead of checking gt_id is lesser
>than max gts per tile

I prefer the series from Matt Roper that is refactoring this part well.

Lucas De Marchi
