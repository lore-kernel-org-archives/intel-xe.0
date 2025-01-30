Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA301C0218A
	for <intel-xe@archiver.kernel.org>; Thu, 30 Jan 2025 16:24:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8382210E9AE;
	Thu, 30 Jan 2025 16:24:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QQumGxAd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A80DD10E9AE
 for <intel-xe@lists.freedesktop.org>; Thu, 30 Jan 2025 16:24:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1738254242; x=1769790242;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=3q3iT781Q+WmesFg0+Hhwrx00aGGr/YGqibYW5rAq+k=;
 b=QQumGxAdbKMEoL/CpDdmpcTOqlbmqWjHrM9lEHraUpThJhiinHvDitk4
 vqo4gEmxIUHEz2J1FxAhb1kOMoZfW7TlJVSbPZHCFUNbzbBHfec6K6kvW
 SrHcawPcfHgbzzRcyIvn84CjufLSlKIBLhT3crYM6j+VnkTiiXCKH6aP3
 tfNNOo7DojdK/cnkFVJxGyeRjVGU2crg+sAO0RuL1M/7qYCjUzl1v/M2U
 /TjoEO0MIyouaHdltfA+yg2BCstzpnn3icBKjwkXcCVgboBq36OS9MubG
 gbTovRc54Dh0jJ7E5NehmNJH1BQpHyuFWqPVL0tqy2GGeVMMvYTXDl7ON w==;
X-CSE-ConnectionGUID: s60H47kZQ0mwyeuTfMYAbA==
X-CSE-MsgGUID: gtqAOQppTI6l5l8mbZgJ0A==
X-IronPort-AV: E=McAfee;i="6700,10204,11331"; a="56348320"
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="56348320"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2025 08:23:40 -0800
X-CSE-ConnectionGUID: lYRSc+0FSmKjz5HQ42XI1Q==
X-CSE-MsgGUID: yzY2lhaCQi21bR0cCuUklQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,245,1732608000"; d="scan'208";a="140265971"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by orviesa002.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 30 Jan 2025 08:23:40 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Thu, 30 Jan 2025 08:23:39 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Thu, 30 Jan 2025 08:23:39 -0800
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.48) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Thu, 30 Jan 2025 08:23:38 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mgkanClBy+tgY2XcQZI9oClRHWZbBrXU9eLXFmbPxYYz8JZN+YEOUGxt/GHlCswLcqVTlw2szFoHDLlRr7L+ENzdGBpeldy1tLjx+OeBgNLX9e7vP+darLm9f7Umilmqcl+Mp5c5Wzmc/bczaKrc5m0hLBUYKMXvluw/0e9FslK4MB8q0Phv8dCvOfLzr+WtSjQolXqMDDVkh+nwCLHQ/uZTm9UjnXvZkSDY4SmIa3q2r3IiW9nwkk7hGhashtZAQXeNf//g8wniWVOSCOpGIXaxgmPiBcIOV2NBykP0OyH4QSaj1b8SdEoAcTBcf2glcgT3Ysol7s4CLz8H+z/Ecg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IO/ZqBeu7yvfFcL72mq8uEdpkrPXQdnWIu0yoltVVno=;
 b=W2/xTMPNlZW013U5ntM+pBLnvEAFfWiSPccg1i+IBm4/4NwuTcrB+HudhUo9NpW3wjqAarv1uZ7b/kK0XFcT+3H4/svX28kIB/i5Ta2/xTfqa0D/TSMPmTTnpoBlntGZwrfM3pln6mgWmeHy1ELcE9jcnqKzjedGk2q9OcJ2sFpwfh58PkUN/67vrgIEI9lW7mi6+vU4L/9+qk9ecybY96hqWm0dyAeQMYf9iXCuPqCHQr5nDWGxaAlbZ6Wlvdopqr69/ZpJCqPyAHdq45HaJrsskEmfsw8XsN5XaJN24n64kv7DSbypD+ujjaHFUwmUobr0pmO3m4V4ORkvsalMsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB8182.namprd11.prod.outlook.com (2603:10b6:8:163::17)
 by SA1PR11MB8860.namprd11.prod.outlook.com (2603:10b6:806:468::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8398.20; Thu, 30 Jan
 2025 16:23:36 +0000
Received: from DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e]) by DS0PR11MB8182.namprd11.prod.outlook.com
 ([fe80::8dd1:f169:5266:e16e%4]) with mapi id 15.20.8398.018; Thu, 30 Jan 2025
 16:23:36 +0000
Date: Thu, 30 Jan 2025 08:23:34 -0800
From: Matt Roper <matthew.d.roper@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>,
 <intel-xe@lists.freedesktop.org>, <kernel-dev@igalia.com>
Subject: Re: [PATCH 3/5] drm/xe/gen12: L3 recommended hashing mask
Message-ID: <20250130162334.GR5109@mdroper-desk1.amr.corp.intel.com>
References: <20250129155627.93827-1-tvrtko.ursulin@igalia.com>
 <20250129155627.93827-4-tvrtko.ursulin@igalia.com>
 <uyje2ytdlfmkitygqjqo4lobspearzzwt4edkeetpupngrckcl@oy4ebrtn23yt>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <uyje2ytdlfmkitygqjqo4lobspearzzwt4edkeetpupngrckcl@oy4ebrtn23yt>
X-ClientProxiedBy: BYAPR03CA0014.namprd03.prod.outlook.com
 (2603:10b6:a02:a8::27) To DS0PR11MB8182.namprd11.prod.outlook.com
 (2603:10b6:8:163::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB8182:EE_|SA1PR11MB8860:EE_
X-MS-Office365-Filtering-Correlation-Id: 473b3cb7-74e8-4898-230d-08dd414a72a1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EqbmyOcbWxBc9THOzA/sdPcXRcjUXo90fnzREV2XzxkdkTNO4coOjW7S0NsG?=
 =?us-ascii?Q?r9NyVsMm7kxyf559/dpy5gRGHhijbjLknf78qSWrf3hksHLbgVZMnDd0zEal?=
 =?us-ascii?Q?xjczFUA5sTxOgal7qtgE+EgkKJ9akwOYpz0MG2myuc9ZM/DhzZXHoyX0Psdu?=
 =?us-ascii?Q?KVOxrqzVdCiYWOtnOIBNsMYz0IJiZhg2Twrh4RPwZ4Zpgx8JOMkUft6qt10V?=
 =?us-ascii?Q?NBkrib8qPbSVm+pvO3HIihYpxAH5b+AHLq17t2Twp+crNnSrgvVIOhl1xgxQ?=
 =?us-ascii?Q?PYnXCfzlqvA7W0XalKUR78Z1aXJ++xb0ABq2rGlycBuRwNiqcXzuaytnhNJY?=
 =?us-ascii?Q?ALSbzlwlJV2BQxPv+mas08542xqQ5JWqnZ9KaDooOkERQaCdf4PwY/rYHco8?=
 =?us-ascii?Q?PwCS2sfMyKVvS7mq/HUIi4ZHMoe5mxcoyhE+RVRnxnGBiG+MIPVR8LvgN9fO?=
 =?us-ascii?Q?qQX9GNbAUAvrKgg8QtqlPpuKblouXsA4pdnONF6wAN+nOhuj+T8nlWKkBDID?=
 =?us-ascii?Q?/QAHULoC86PAG6RlyYY7Z/qEY6fwdgLE/XGvidU9uQ/YVDapdM4IqU56U7BE?=
 =?us-ascii?Q?D1zKt4uZPZEdMf2RZ6rSulz2PYR+5PioeugSdySRNKBXwzajzivBB08wygFh?=
 =?us-ascii?Q?ygGezynGK7DTBjVT4h3GJu7FpSqGZoIUvZGSrXbc/Zi9SkOvhYyvkhxghQUr?=
 =?us-ascii?Q?hhErOXy29yZaYcoLGhmeaZcY06cThPM79CYazQ30/brbBeVgUHsUmxfCMXPD?=
 =?us-ascii?Q?F133o1YJgmiQ/+yEyP6Y9un5Fv6TmrJa1DyVPhU2Nn+mXtS3kGs8Z9Pmt3iI?=
 =?us-ascii?Q?/pb21K/z8nbAChwoHovTOOyqbvSCfd+n7U0FaZMDtiIWzdQSXXmOrxRtMJ3s?=
 =?us-ascii?Q?XHg2SS7DNLzc9LRxmswAmhjQu2MlTPcFceDU/BEkwq3cvFlF3nP1NMF6EapR?=
 =?us-ascii?Q?zTYqxTLFMvUy1V9CXIh4eYv0SiYWj15C6qzOBOZ14ajLnW+IP1fjn06MNRJc?=
 =?us-ascii?Q?LrIg0nw8wNHbrxvCjno0/beKuK5/m2BpUdlcdGW1j7SAoBcRd8AbOobacIwA?=
 =?us-ascii?Q?/Vsl3QXlLS4AqRXdh2iGCFVOLD/IXxGpuoBlsl58+1SozaQot3PnEd5fJ71o?=
 =?us-ascii?Q?7iHGSIqUff6Dl+S+iH673ShbbNHFlMeiwQV1v6Bquaq+1HMTUPDNE21BcRT8?=
 =?us-ascii?Q?MPNtztZ6eGM01lWwCHhsN/yCqcCgyb4io3wNCOZCbpBa0Bk0L4ELEvg82FKl?=
 =?us-ascii?Q?Qc/IPkxFklRfDYO362ZrkH2qQLLdjqRY7amQ/sofwEIfiO4wN5Bz0u+W55gd?=
 =?us-ascii?Q?gNIZCV6eksBZJ0bHVJBmOHVHJdaBZD/uxICfYeq9xm+DcNlEgIdoz+8HjxT0?=
 =?us-ascii?Q?KH5G5i2dP9WObyVXuQ4FVRz5oQDY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB8182.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2e/ayNS3E5Avv85MUoSWRmIB70YvU2ks/kOD06I4jDZkpYjC5ibPoJB+R5l1?=
 =?us-ascii?Q?9uqRE65s+/tvB118ARRevfwtnbswBmEpBWVbKsJs9Jfk8lXFQKSC47ncoIPS?=
 =?us-ascii?Q?sKRRDC5R1FOsyjr62IJqmg6IUa7sRP9B9ABDDkdgRC7gZE4Ds4ekDBUeP2yd?=
 =?us-ascii?Q?qF5KcA4c9CqBy1wIO0sxTyaHZbMLAWPicnHE2YqmO853dXfwLiRre55S3oz0?=
 =?us-ascii?Q?QhbK/iVi9lFz8pejSsbamJ8kPcP3dvZyLhuCTpIBicG7mzbXZ2hSw6oYWKiE?=
 =?us-ascii?Q?f6aFLe49An86P2uXasgFamDWOCQT/8hSaA7jvBI00wMfvge1sr0Ex+XdRaI4?=
 =?us-ascii?Q?P8aKIrU0t/06GTJGMxdzQaClY5qAnF7FTR74U9xMIBU+Fg5e981rPXMMMoj8?=
 =?us-ascii?Q?Y4IsZjeRUs54FFZi1IQdE8D9DX7Tp+JEL6XFsMvONmBPq/DMwzs232w0eYIn?=
 =?us-ascii?Q?lfqmTlUB0FqivV63qvky2aKE9f7LyWejDhKfdWMBSk5BNxVyN8rTTljMZZ4D?=
 =?us-ascii?Q?PXQ0gL0WWI/iW0Uh4pdsSsIQYxlioCZjX6jJiioVKPhtqDI/RzjCuHC0OTYh?=
 =?us-ascii?Q?14MRD03Tr0ipekUIgjhiAnvp4jaIUFekxJ2kCGOqxqlKr2dSwH9+OL+Ot+hB?=
 =?us-ascii?Q?tAtYOnt96DgcJx67prAKCWm4CugDIVi/ITfPLUbADNkytO/chCBpoLXnsQcC?=
 =?us-ascii?Q?x7km1+AZQ+Noqdr0XYCfdNdNGzsbGNFMlqOb6dtEt+TwEYVBOMdAj4N4kP39?=
 =?us-ascii?Q?3N/YuSxmV1OnAYTpDbBasYVKRI7D9WkJh5zEPN509EPp5wOzHtIc6IgyhcSJ?=
 =?us-ascii?Q?SdLztGmc/TXhPcF5i9J3aD6co2x6nMXrw3frIjd/AINT2t8sSgib9ie3vlvx?=
 =?us-ascii?Q?qDyDIUOC8x075Qw2zeilgvxHLzTFX79rtkPygFDS4PJX4gyJtu91gQQb/qTr?=
 =?us-ascii?Q?DUxnK/IBTNZxG6Nuu89+Mzpr1pcY8NAXRUINAbJLVmmPeMNzpp1iFmVttlaq?=
 =?us-ascii?Q?dS4aAzRwbmfpSx9xISRDo6hx1Ytny8hPq0wpWGxVHK6kFkEjGqA4AnjXutlX?=
 =?us-ascii?Q?07VylnC0/jLBolsu3A4Z5/ogZq3ZkoO3vhGv8n2DH4jWzc/e9vh8gKd7ApJ+?=
 =?us-ascii?Q?o2YGPjUMz2h52j+huUW7HoSgSL2PtY+RFbkbOr9hGhBupEEtY0G2S83zdFfh?=
 =?us-ascii?Q?du/May6J0uWaB0ROWdqpazxbADfe6bu03tUM+JK6M1XQnfU/tm4k6TGxXJ6d?=
 =?us-ascii?Q?wX8aItVSBVQzhz1rLIv+QivSQjrCCy3yyBZhdyuRt3WigTHycEVBD66kZSWd?=
 =?us-ascii?Q?+eD2g36BDzbOn1IXpspCryiIce+90XDnjTf5fc9qC6k0dMmCXUTakg5czlhD?=
 =?us-ascii?Q?36BFTSZ/FqqnZcD4JcHWJylOxQjq9UvYtKE1YY4ePscFLcHWzGWZpha5YbMP?=
 =?us-ascii?Q?Vht+8KevYSlSX/kpowYx0o0diaT0WSQiq2JxF4onXkCVRmISeQBIyJEtVI6D?=
 =?us-ascii?Q?PtfnXm0TvRw1SJKocuyrUpLgPaXn73r5dlyhSJsk9ArIsvMRFne8EII4vIlS?=
 =?us-ascii?Q?gmEAvNTZP3CCyOJ7iNUiD69MizaqQTHZYAD/WhBoFveXwK2XBnCnJu/ifDx9?=
 =?us-ascii?Q?EQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 473b3cb7-74e8-4898-230d-08dd414a72a1
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB8182.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2025 16:23:36.4232 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vujxRZmqpnRdXaAyVtVWUI6tShbH7EbGqdIJKaqYxuZgfa9a9zPEio3Dq4Bt+PKEQwE22rL9+VAiRor0Kh5C5UiRi0+7w96haESanwCkzvo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB8860
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

On Wed, Jan 29, 2025 at 12:30:28PM -0600, Lucas De Marchi wrote:
> On Wed, Jan 29, 2025 at 03:56:25PM +0000, Tvrtko Ursulin wrote:
> > According to the i915 codebase xe missed to set the recommended
> > performance tuning for L3 hashing which is applicable to all legacy Gen12
> > platforms. Lets add it.
> > 
> > Signed-off-by: Tvrtko Ursulin <tvrtko.ursulin@igalia.com>
> > References: c46c5fb725be ("drm/i915/gen12: Apply recommended L3 hashing mask")
> > Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > Cc: Matt Roper <matthew.d.roper@intel.com>
> > ---
> > I could not find the reference to this in the public docs, including
> > confirmation whether 0xb004 even exists on for example TGL. Then for ADL I
> > don't see that PRMs have been made public at all.
> 
> leaving this part to confirm later. Matt Roper may remember better and
> chime in.

The tuning setting here is still documented for Xe_LP and Xe_LP+
platforms on bspec page 31870, so this seems legitimate.  I think the
only reason we never added it to this driver was because Xe's support
for the pre-Xe2 platforms was never intended for any real-world use,
just for early driver development when Xe2 hardware still wasn't
available.

The register itself exists on the Xe_LP and Xe_LP+ platforms, even
though it isn't included in the public PRMs for some reason.  It was
removed in Xe_HP, and the tuning no longer applies after that.

> 
> > ---
> > drivers/gpu/drm/xe/regs/xe_gt_regs.h | 3 +++
> > drivers/gpu/drm/xe/xe_tuning.c       | 6 ++++++
> > 2 files changed, 9 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > index 096859072396..909638b18557 100644
> > --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> > @@ -366,6 +366,9 @@
> > #define   XEHPC_OVRLSCCC			REG_BIT(0)
> > 
> > /* L3 Cache Control */
> > +#define GEN8_GARBCNTL                          XE_REG(0xb004)
> 
> mind the commit 0bc519d20ffa ("drm/xe: Remove GEN[0-9]*_ prefixes")
> GEN<x> prefixes/suffixes are not here on purpose.
> When we refer to GEN12, it's XELP, or simply drop the prefix when it's
> not needed.
> 
> Registers here are sorted by address, so it should be before
> XEHPC_LNCFMISCCFGREG0
> 
> 
> 
> > +#define   GEN12_BUS_HASH_CTL_BIT_EXC           REG_BIT(7)
> > +
> > #define LNCFCMOCS_REG_COUNT			32
> > #define XELP_LNCFCMOCS(i)			XE_REG(0xb020 + (i) * 4)
> > #define XEHP_LNCFCMOCS(i)			XE_REG_MCR(0xb020 + (i) * 4)
> > diff --git a/drivers/gpu/drm/xe/xe_tuning.c b/drivers/gpu/drm/xe/xe_tuning.c
> > index 9e7ec36dbd47..b21a59578ba3 100644
> > --- a/drivers/gpu/drm/xe/xe_tuning.c
> > +++ b/drivers/gpu/drm/xe/xe_tuning.c
> > @@ -107,6 +107,12 @@ static const struct xe_rtp_entry_sr lrc_tunings[] = {
> > 						FF_MODE2_TDS_TIMER_128))
> > 	},
> > 
> > +	{ XE_RTP_NAME("Tuning: L3 Hashing Mask"),
> > +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(1200, 1254),
> 
> 50..55 are made up in sw... I believe it's safe at this point to just use
> GRAPHICS_VERSION_RANGE(1200, 1250)

Generally we apply rules to the specific range of platforms that they do
apply to.  In this case the tuning applies to Xe_LP platforms (12.00 for
TGL, RKL, and ADL-*) and Xe_LP+ (12.10 for DG1).  So I'd just write this
range as (1200, 1210).  There aren't any platforms that use any
subsequent version numbers until DG2's Xe_HP shows up at 12.55, so it
doesn't really matter from a functional perspective, but I still think
[1200, 1210] is more precise than [1200, 1250].


Matt

> 
> Lucas De Marchi
> 
> > +		       FUNC(xe_rtp_match_first_render_or_compute)),
> > +	  XE_RTP_ACTIONS(CLR(GEN8_GARBCNTL, GEN12_BUS_HASH_CTL_BIT_EXC))
> > +	},
> > +
> > 	/* DG2 */
> > 
> > 	{ XE_RTP_NAME("Tuning: L3 cache"),
> > -- 
> > 2.48.0
> > 

-- 
Matt Roper
Graphics Software Engineer
Linux GPU Platform Enablement
Intel Corporation
