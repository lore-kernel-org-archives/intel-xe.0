Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 719C5C7115B
	for <intel-xe@archiver.kernel.org>; Mon, 23 Jun 2025 04:29:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66C7110E0AE;
	Mon, 23 Jun 2025 04:29:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="NPd/QgQb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF1710E0AE
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Jun 2025 04:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750652978; x=1782188978;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=X5a/NcSYtImCb9gtLr4BQ6Vnpbx2/mV7O0uJL0RZIbM=;
 b=NPd/QgQbx29voErMDNQR76D0+ec1WuGsTymjRBw2ButQEqynwM95rcnc
 TS6WkVwaVvFVxbcKvIl5Zts43iqNj76DZDQ6bRIRnGl4D0ihwT9UIWMmP
 CI0yliuBDSArb2XWsbIBXgz8cgQCawXHWf4ttWM8cmV9DzYGRBHACp9hp
 fB46h+y6CFQoxnCSKDfKzR7t3u17rBo1M7VJQbVhafHsUOHV5ZP7Dchap
 muYCC8Lm9ePhhJoLr6VH1Wq3m90mvQq0g2xDhEHOkMjsFGkxWYsXxxYuW
 bCsCi6p8b91wd4EbP5hwNMluQAbfa5B9PusRpb2O1I8DfYz3P6X2SaL78 g==;
X-CSE-ConnectionGUID: i2bt7ov3Q2aQvpMR7xi/sQ==
X-CSE-MsgGUID: lOH8V5SvSLSgeljSu0IERw==
X-IronPort-AV: E=McAfee;i="6800,10657,11472"; a="51962481"
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="51962481"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:29:37 -0700
X-CSE-ConnectionGUID: Fb2+XP8fQqy4vS4y6UjlzA==
X-CSE-MsgGUID: 2ymoDbgcR3mhHNDl1JVN2Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,258,1744095600"; d="scan'208";a="151064493"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Jun 2025 21:29:37 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:29:36 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Sun, 22 Jun 2025 21:29:36 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.41) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Sun, 22 Jun 2025 21:29:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=in1ja7JXW/y/kadHXP5buNGWPAUYX/n2UKAP/ofvnMJD7CHl6BjcexmcJ3F5luFch7AAQR5KqryPn3KKvY/aoROL5o1btxz2mgDDTOVexCcH4fTu6mYnDhjomE+lX9xYpFQPuvnWdd5Psx03aTDlevZrzMf9dUiSSLCT6GRusr1NzrqFWeUqpqWB+8Z2krQ5RXyK2pNxrh5vJ5A+jUWUmRGTEeHMFuTDfjB1pgud1b6XgYVkJR4gqFwyFTI917cnlkFwA1Ag6Av9zw0r03J5YyDjwQPY6Lwbo3vpyZi2/7dma6CwlThBOJ4UaHioGH/oGoLPWNYW7E+1/rdR/O9PeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eraMYBkwjwJ0MeqtjeasMkT+29Ov9dq27NodnrtOuTo=;
 b=lAanbeylQQgprSUrgqmjKd04Ih/iwQMIFyxB71HMAfTm5AtMl2n9q4uPKHNHc5eHXYnGILO92QRL3ibuKj231e98MhT++sCXrABPxdwFEPmhFvwSFTNyvtSbtolMhhQHSfM8q9ZCYRvj9FiPZmDD0WyTYMGXchdz8BDGLrqAOvuGhZseghRIZk+dPni+SNTuT4TKeFNYmrPECcxcjO6BwLDsF7tzjywA1c1P/5NeY3vO+7zZfpa9rCWw89/7cAmiJ1+k8sQvuwJp/U/QQFeQG7o54taps0HsNiVtOxf6kGB7PzUA11ciQACrX950xeLzI5Hck5YzYQV3+04YdjKZRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BL1PR11MB6050.namprd11.prod.outlook.com (2603:10b6:208:392::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.27; Mon, 23 Jun
 2025 04:29:06 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8857.016; Mon, 23 Jun 2025
 04:29:06 +0000
Date: Sun, 22 Jun 2025 21:30:45 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>,
 =?iso-8859-1?Q?Jos=E9?= Roberto de Souza <jose.souza@intel.com>
Subject: Re: [PATCH v4 02/20] drm/xe/uapi: Add madvise interface
Message-ID: <aFjYdUYGIazU3XZZ@lstrano-desk.jf.intel.com>
References: <20250613125558.2607665-1-himal.prasad.ghimiray@intel.com>
 <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250613125558.2607665-3-himal.prasad.ghimiray@intel.com>
X-ClientProxiedBy: MW4PR02CA0010.namprd02.prod.outlook.com
 (2603:10b6:303:16d::8) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BL1PR11MB6050:EE_
X-MS-Office365-Filtering-Correlation-Id: ed982c7f-b70b-4e2c-3798-08ddb20e7dc2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?I1PFxOpmlCacaHgFOMSXz7O1OICprdqS8W8NBiOZOkdZRtDhi8VgCOmLdq?=
 =?iso-8859-1?Q?ojTWF1+Fa/8VBQcOPk7d25+5AIpdEYlLvLk1LrGT/DuEowO58tR25I+BDA?=
 =?iso-8859-1?Q?/0xNpZDqu1KSQxmIWSLE5ktDUAzDzXMOi/R7GARii9O6C5S28Z3MSQDPXW?=
 =?iso-8859-1?Q?u1u93PO+AknK6wc+YvjhthtEUHp1fT0ATlEaQApDZr2K8xaCngFQQKHCHc?=
 =?iso-8859-1?Q?W+eLtJERqI4gT7z5mZl2tVve1nA2hO8C0LneauD3mDthHH5l9IXIoBOEH5?=
 =?iso-8859-1?Q?4fQE6/VjgMsbDeYP2EBLTyb7cJnpEl1mtjXMYmheB5Y6lj7ySkDV5w/5la?=
 =?iso-8859-1?Q?y6pHZKiawaKYHsvHFqoDVOrjZ2ibZ52qWk9Z3kVaZYhGkevT/j5491Q0s0?=
 =?iso-8859-1?Q?hJ1EWXJU6fdTLDpbgjDgajlw7ceGefG4cVXr+jt8v6ywW67rlvD3O/uWiC?=
 =?iso-8859-1?Q?BvlS1oOG111EfnWlHoE+HLUucgreIh88uzRfl3UraUTnUEANKxVRPFqguS?=
 =?iso-8859-1?Q?SN90HIFtI9E+hzJyGO52aTUlNjPt1YbkYyG1LQF8tUFDp/QanBNb7MqxGI?=
 =?iso-8859-1?Q?Mh3BrI6iIRTroo88vaxHS/C3cTQFoxZX6KIJJWYVV5vjTFDrq0x/keH9CG?=
 =?iso-8859-1?Q?4DWiOW2Ak06OmDJcqm9i3lc75uXbjfmH9C5Nltp1lTQGWR/RxTz1af9dw4?=
 =?iso-8859-1?Q?d53zda7TcmkmZeSonKhRZpsRMon1cp2QkulHyRW2+MSvN+gdb9WAIYw0ir?=
 =?iso-8859-1?Q?GZmoXnXZtMQfKdC2HeEtv/Vc+T9K1o99HIWbbkqtNZVLE26pL0/TTdCBoe?=
 =?iso-8859-1?Q?Xu+KGUzgdO0fKQs6cj63aoqxIyuqZp1nTZlWJq+fFNnR6YA9Kh5wI1SbgT?=
 =?iso-8859-1?Q?ziD19o8Ea6jQaTwBKluykh0jqTqZYdwWU+7FwlF1H3JsVF5lq7Q+5tvnGT?=
 =?iso-8859-1?Q?5IxVrOFvPfz9d/pClDFSd29VreuNH5sfNVL5aGtugNyJbKL+kzjny9HzZ5?=
 =?iso-8859-1?Q?f0KFi6SjTsgZ/m/b1pITJRsLhtRKE2xOrCo8mzrKtWQbWBJHDnRMM3ajPx?=
 =?iso-8859-1?Q?cn4ipKoIklqa9E8oR1pDKYO7qF6O6spIJScslKfNwPEk9kfykYxILKh9Fd?=
 =?iso-8859-1?Q?cUQ0ZmnUnaxrohvJ6ULWJSUuz8ITRuIWZijdXOMqhm3Jsj9Aej0ps3mB18?=
 =?iso-8859-1?Q?i2Xysrc+8jYb41b/bhAgpipfmb0AJCDKyG8DP0UkxCDocRBmFECjN7mgpO?=
 =?iso-8859-1?Q?uPdFHrcDpf46C+w6p6OOWCMgKJGIKc+gTCKwEbRfLdRI6lJT0e0s4iEeLh?=
 =?iso-8859-1?Q?bl+Mey/7HTCrYpmrRgwJu6FlO5CGnj5j4d/RrdK3E0GiXF2urlyZ39LMRv?=
 =?iso-8859-1?Q?zKQ+3bUe3uckOsD2VXkmCcql75aWIh8RnA1Nt/khkPWUBtAyaveQmVLlau?=
 =?iso-8859-1?Q?PHDmde7DcBosRX7jvMC+/cdU50NhKv2ZK7XTjg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?/Q3HjMU+rwg0NLmHBUE2XUfgY/TMhcp8CLOQajEc9+ZctwQH7WtLbwqG+F?=
 =?iso-8859-1?Q?hpOWeZ8BU16MhFVgYrc4pnLBoCOY5IXHSE09Pf4qi9OkjHBK8WvDJeETf7?=
 =?iso-8859-1?Q?k6/1wvvFYoCE6wywy49jmi/M61hArqOKP4pF2R7Qy2LLMJTDHBaDD7BZs8?=
 =?iso-8859-1?Q?gdfoyr8hV6guRdxd5xrjFdQPf5xLOLrr29V55CQmlTb/T62lU9eYZVQ2x3?=
 =?iso-8859-1?Q?hxdftS/OWxaLtGKuk+eia6xNWiawteAj1M+hNMsb5xObtU2f9T/NWIY9Fl?=
 =?iso-8859-1?Q?zRvEVpawZz3oVhPTcdZgt1BdE8F9EseVkTC1kLCpRkgYPBgKKNomQCaPIz?=
 =?iso-8859-1?Q?AKX9IbpkVWPhxpbkdw7u707GLxhWF7h0QlXfus4j8nCFrxBxFNTx9VbcYD?=
 =?iso-8859-1?Q?TedmPc+byjYFl54sg/R5EmTRfHoPdv+izhFYk6jmLD/bX/Xfh0Kz0KqwwM?=
 =?iso-8859-1?Q?Cvia11qH7qVb/VuPbUEzy4ijZdmqOzCOzX+hMa/k6WyS4i3NgyrQU3xFmY?=
 =?iso-8859-1?Q?mVIfCz1zx8iAtJwqpjCxDhGfoC/aQbofjQXU15zuD35bHGJfQ+06o3oyq2?=
 =?iso-8859-1?Q?Ou2ej30fC1VIxMWE6vTR+N2UWgWLuGS2wqdvxtKeukUK30vVWkovQQ0jIX?=
 =?iso-8859-1?Q?bwP/l/DhxRG4g3LWgXl2dkznC784bFzwhLbwTac0UmFacLhMy9W78F4+t7?=
 =?iso-8859-1?Q?Lm0xGg23VGlfTAmEIMwlWqsAYV/Z+ent4WPYdKou5lmbPCuINVGgg40n8y?=
 =?iso-8859-1?Q?f+Yop996GB/UA3CdKieA63NibwNZc4WhHK950dN8SGzi6Lml6UPWdrPY3y?=
 =?iso-8859-1?Q?h0HkS9akjXCgX5iHnqfIn42pMvLvLegifzCVj8CZT+zA8eVA8LCH7E/Vf3?=
 =?iso-8859-1?Q?S55RQiFxZtbCBq1+exYWaRvATxK/a5UNrZxcCjh/AUvFITLdEecQGIe5Ms?=
 =?iso-8859-1?Q?CSt4hstDyErHHmapfQr9T83ST4JQHpG65zblKt6fwErRT+HcMu3sUDi5He?=
 =?iso-8859-1?Q?bG5aUhpkBdCtaVhbU+IGtqfNFOCpGylBI7W47vf2CJcNLs2BN1+OJ3Hi+F?=
 =?iso-8859-1?Q?dj5cq5GxjkTa680NPDyinHX67Io9Vw7Toyruwsu6uab6/4p6WwJjsUjNoW?=
 =?iso-8859-1?Q?sgEqYEhohXOsObLzGBXppafH7V8KUKLmy5Amzh9S3reAQRZ3clC9q2qKVg?=
 =?iso-8859-1?Q?E1prV+X+6XyDFN3V0dWn9G+lP6+KSzNvls8o+LndKjOIb2Zd9N5GgSII9m?=
 =?iso-8859-1?Q?Pmg9UG6ZdfI76jBmfrHE+LHq0lbHQglaPXGB3XHDluHohjs/vutDTJx6I8?=
 =?iso-8859-1?Q?oPdEzveXSoj61ni2LuZRrLKROB64jBpo0M8CjlgLBjk9jgWN7hitTj58Vm?=
 =?iso-8859-1?Q?k8p5ZODXawswEyT0xB75au1mHXWJfIx9B5yPxXX4oNtBYbUafz3DTbQEqs?=
 =?iso-8859-1?Q?y8ICIIhkVRSn1eNDl8Zt2q8gsUC8QKBPC7TyU8fFe1XUhuF9vqdVeknWIh?=
 =?iso-8859-1?Q?bimt8tSH+gOaLXJWrHj6KTaUA+1jUxokSgmyvpIrhq1oJ2Vg+kxyuxwsEf?=
 =?iso-8859-1?Q?q6Y+Xb7hE1I3vuQi2x/URgBsNVh8QOY6nRP8RBfRUr1cQ4E33TScWlFHvB?=
 =?iso-8859-1?Q?jCqNdxQa5EWer2XwYKwspAULvJnhdCUVxpDBUN/UYKRrriaT2CtdNYYg?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ed982c7f-b70b-4e2c-3798-08ddb20e7dc2
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jun 2025 04:29:06.7383 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GbcoC9u8U1dK+mlKfSF2UwcFvfRRpIkZlnpt+UJgcB1vuKXFAkbXqc+8mDyAQLsuWuCtzjepKDD8r0Htd3vg/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL1PR11MB6050
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

On Fri, Jun 13, 2025 at 06:25:40PM +0530, Himal Prasad Ghimiray wrote:
> This commit introduces a new madvise interface to support
> driver-specific ioctl operations. The madvise interface allows for more
> efficient memory management by providing hints to the driver about the
> expected memory usage and pte update policy for gpuvma.
> 
> v2 (Matthew/Thomas)
> - Drop num_ops support
> - Drop purgeable support
> - Add kernel-docs
> - IOWR/IOW
> 
> Cc: Matthew Brost <matthew.brost@intel.com>
> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> Acked-by: José Roberto de Souza <jose.souza@intel.com>
> ---
>  include/uapi/drm/xe_drm.h | 118 ++++++++++++++++++++++++++++++++++++++
>  1 file changed, 118 insertions(+)
> 
> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> index 6a702ba7817c..b5f8d11faaa8 100644
> --- a/include/uapi/drm/xe_drm.h
> +++ b/include/uapi/drm/xe_drm.h
> @@ -81,6 +81,7 @@ extern "C" {
>   *  - &DRM_IOCTL_XE_EXEC
>   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
>   *  - &DRM_IOCTL_XE_OBSERVATION
> + *  - &DRM_IOCTL_XE_MADVISE
>   */
>  
>  /*
> @@ -102,6 +103,7 @@ extern "C" {
>  #define DRM_XE_EXEC			0x09
>  #define DRM_XE_WAIT_USER_FENCE		0x0a
>  #define DRM_XE_OBSERVATION		0x0b
> +#define DRM_XE_MADVISE			0x0c
>  
>  /* Must be kept compact -- no holes */
>  
> @@ -117,6 +119,7 @@ extern "C" {
>  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
>  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
>  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> +#define DRM_IOCTL_XE_MADVISE			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
>  
>  /**
>   * DOC: Xe IOCTL Extensions
> @@ -1970,6 +1973,121 @@ struct drm_xe_query_eu_stall {
>  	__u64 sampling_rates[];
>  };
>  
> +/**
> + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> + *
> + * This structure is used to set memory attributes for a virtual address range
> + * in a VM. The type of attribute is specified by @type, and the corresponding
> + * union member is used to provide additional parameters for @type.
> + *
> + * Supported attribute types:
> + * - DRM_XE_VMA_ATTR_PREFERRED_LOC: Set preferred memory location.
> + * - DRM_XE_VMA_ATTR_ATOMIC: Set atomic access policy.
> + * - DRM_XE_VMA_ATTR_PAT: Set page attribute table index.
> + *
> + * Example:
> + *
> + * .. code-block:: C
> + *
> + * struct drm_xe_madvise madvise = {
> + *          .vm_id = vm_id,
> + *          .start = 0x100000,
> + *          .range = 0x2000,
> + *          .type = DRM_XE_VMA_ATTR_ATOMIC,
> + *          .atomic_val = DRM_XE_VMA_ATOMIC_DEVICE,
> + *         };
> + *
> + * ioctl(fd, DRM_IOCTL_XE_MADVISE, &madvise);
> + *
> + */
> +struct drm_xe_madvise {
> +	/** @extensions: Pointer to the first extension struct, if any */
> +	__u64 extensions;
> +
> +	/** @start: start of the virtual address range */
> +	__u64 start;
> +
> +	/** @size: size of the virtual address range */
> +	__u64 range;
> +
> +	/** @vm_id: vm_id of the virtual range */
> +	__u32 vm_id;
> +
> +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> +#define DRM_XE_VMA_ATTR_ATOMIC		1
> +#define DRM_XE_VMA_ATTR_PAT		2
> +	/** @type: type of attribute */
> +	__u32 type;
> +
> +	union {

Nit: I'd make this union is same order as the defines (e.g., preferred location
first, atomic second, pat third).

> +		/**
> +		 * @atomic: Atomic access policy
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_ATOMIC.
> +		 *
> +		 * Supported values for @atomic.val:
> +		 * - DRM_XE_VMA_ATOMIC_UNDEFINED: Undefined or default behaviour
> +		 *   Support both GPU and CPU atomic operations for system allocator
> +		 *   Support GPU atomic operations for normal(bo) allocator
> +		 * - DRM_XE_VMA_ATOMIC_DEVICE: Support GPU atomic operations
> +		 * - DRM_XE_VMA_ATOMIC_GLOBAL: Support both GPU and CPU atomic operations
> +		 * - DRM_XE_VMA_ATOMIC_CPU: Support CPU atomic
> +		 */
> +		struct {
> +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> +#define DRM_XE_VMA_ATOMIC_CPU		3
> +			/** @atomic.val: value of atomic operation */
> +			__u32 val;
> +
> +			/** @atomic.reserved: Reserved */
> +			__u32 reserved;
> +		} atomic;
> +
> +		/**
> +		 * @pat_index: Page attribute table index
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PAT.
> +		 */
> +		struct {
> +			/** @pat_index.val: PAT index value */
> +			__u32 val;
> +
> +			/** @pat_index.reserved: Reserved */
> +			__u32 reserved;
> +		} pat_index;
> +
> +		/**
> +		 * @preferred_mem_loc: preferred memory location
> +		 *
> +		 * Used when @type == DRM_XE_VMA_ATTR_PREFERRED_LOC
> +		 *
> +		 * Supported values for @preferred_mem_loc.devmem_fd:
> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE: set vram of faulting tile as preferred loc
> +		 * - DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM: set smem as preferred loc
> +		 *
> +		 * Supported values for @preferred_mem_loc.migration_policy:
> +		 * - DRM_XE_MIGRATE_ALL_PAGES
> +		 * - DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES
> +		 */
> +		struct {
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_DEVICE	0
> +#define DRM_XE_PREFERRED_LOC_DEFAULT_SYSTEM	-1
> +			/** @preferred_mem_loc.devmem_fd: fd for preferred loc */
> +			__u32 devmem_fd;
> +
> +#define DRM_XE_MIGRATE_ALL_PAGES		0
> +#define DRM_XE_MIGRATE_ONLY_SYSTEM_PAGES	1

I'd double check with Thomas / maintainers if they want this (migration_policy)
to be included in this version as still more or less unused in this series.

> +			/** @preferred_mem_loc.migration_policy: Page migration policy */
> +			__u32 migration_policy;

Could we future proof a little, maybe migration_policy is a __u16 (or __u8?) and
stick a reserved __u16 in here?

Matt

> +		} preferred_mem_loc;
> +	};
> +
> +	/** @reserved: Reserved */
> +	__u64 reserved[2];
> +};
> +
>  #if defined(__cplusplus)
>  }
>  #endif
> -- 
> 2.34.1
> 
