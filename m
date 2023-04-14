Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2BBCC77B6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Apr 2023 01:01:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 89A4E10E601;
	Fri, 14 Apr 2023 01:01:51 +0000 (UTC)
Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F40310E601
 for <intel-xe@lists.freedesktop.org>; Fri, 14 Apr 2023 01:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1681434109; x=1712970109;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=pfnjWp7SnJij/CHRwMEthsRqjmZPf0HmjJAtBzb6IMc=;
 b=eci8UHSZMdYEI2P6x3g+1QowYQpioK6e1jJwidGKnMEQ1OLxrVlhXCj4
 4NPoE4bePKxgV7aksCwRLRaHFNHZFdsoYHEL7TUDZa1QXjNsy1hvdI3IJ
 R0CMvVUTye3bMyvT5ree2/U5TrzBrknYOnGidtbMOP3BqQnnI07D647Km
 gg1ZncNygmo0MARKrJyYIu6CHWQn+WcYhOHMexW08qidbjcTtm7VDMT2V
 uL29vvRaLL/tc9WcQjf3sQ6EMTKFo3bdN3E9Vl/tdeF7ifmQsWpiX05Pq
 JXrgAeypVrlTwRojvuTshua/1OgiiD/+w/Xgq7QVV/7oxgCS9N9O6dNrZ Q==;
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="409542664"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="409542664"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
 by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Apr 2023 18:01:48 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10679"; a="813675046"
X-IronPort-AV: E=Sophos;i="5.99,195,1677571200"; d="scan'208";a="813675046"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by orsmga004.jf.intel.com with ESMTP; 13 Apr 2023 18:01:46 -0700
Received: from orsmsx611.amr.corp.intel.com (10.22.229.24) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 18:01:45 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX611.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Thu, 13 Apr 2023 18:01:45 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Thu, 13 Apr 2023 18:01:45 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.42) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Thu, 13 Apr 2023 18:01:44 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IyyBBuI+VLFFHMIbbSix3ikiTZ5yWof7Mg99b5zaiyem7u1iwyy2888kU4VOIlvbQ9llBzb5hSvEHM0xqt+IV7QrQ0gMzbldAqR51Xks1GCOQgmWRvVPfQU8tktZ8LT9CKJ9Eoqqba/6LobEYQFnySkb5K/0VpJfIgw3BLYN4P/LfpSREvYUPTFB/JLGaiuIuyFBTP6/J71XJoneIHkm0reI4SFBiv9eLRp79nzrR+4XJ/td7MZ1+j4YHF+Mx5a8TO1LQu8pelu4HGHPysphO7iciQ19cmIhKw7MJct83SONK1wIiwxZSX64FMyw2SCvHIOIelaAicxEbNMczhBFjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KcKwpYODZ+pHWdzUcJWzT004IvUzQbtEtIxNXT5x66Y=;
 b=kPtIcQbs+Qxra8hZ5Jo8zp/ZFgJ8VsfIt1tcGoQmAt/FmAwH/kMMZjS45Dz7J9pXoS/5x6WQSqa6wBvwCBJWfpAp6o6obG6uTM025VVzUF5GN3M2HilNWM/Q84EXD/5OAVBnk1GUDC8irsJhOYPJKCNskZpy2P/WTbioLNg99zecKpVfL+zb4/Iyf31Bh4iRDj4SnCy6fh1O2wshBc7zA8SgQZtWLN8lceiuzu8G2+9eiOCgw8hEmWZ+ccn9xyyjCfqpy1H5gttsD3sUmA2QfjtNH7miETYOnQhugJUGjtXgOIvdXyo6Z6doA9biDSxbfthXJ0Sm3jyQMwXqFKiGnw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH8PR11MB7093.namprd11.prod.outlook.com (2603:10b6:510:217::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.30; Fri, 14 Apr
 2023 01:01:43 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%3]) with mapi id 15.20.6298.030; Fri, 14 Apr 2023
 01:01:43 +0000
Date: Thu, 13 Apr 2023 18:01:39 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Message-ID: <bcoyaz7y6iizfjrjaexmze5dgdnomslhycmkc2jq2g55zivdpi@a5s6y4kxud5o>
References: <20230412225248.3229571-1-matthew.d.roper@intel.com>
 <20230412225248.3229571-5-matthew.d.roper@intel.com>
 <8fb02acd-8490-fd8b-bbb8-bbe862705538@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"; format=flowed
Content-Disposition: inline
In-Reply-To: <8fb02acd-8490-fd8b-bbb8-bbe862705538@linux.intel.com>
X-ClientProxiedBy: SJ0PR03CA0241.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::6) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH8PR11MB7093:EE_
X-MS-Office365-Filtering-Correlation-Id: 457e8b4e-615b-4c98-4048-08db3c83cfa6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: xUnaVix0zIyC7ASL1qs73uT5+4GfbBS2GUhgf8MyXviiHDqlhD3JZ36N19ID74CJ9sR5XPOm1O/qEfaufrHfw4/ePwHui1fjVCZOe7h+C12mniYE53QcXAppMLU63JItyMqZRXRu8Zo45NHT4TC+CARtUB4CgApgdXWG0ZadGYPE8QL3pTvsBa+lQsgEA8Q2/3PLnguKPt6PHgHRxWp0WZjvvUub20PNkaPTPxHhWH7AMmn9tEs0PBhh+CbUlaR2iDZ88yDeDwarueUEe1lSMa0UQ1E9DzOLYYiy3gVqsFh6I9qK/nH2/kNdmJ3y29GrISiQwFR0Z4gP+iy/9qXNVE1/j3WlWiRM3XO6GdENdfGm4OyQPV/n9UCgq4BVZtfhpO7wZh8StPC4Z9ZpWHyrIeM72R+TFjq2o7YT/FgaFa2MBg48lGythsIKcGocngiQ8IWhXfea/AxAGYQfGxrwtnvOk8KxcCyyBqKTt/8pDtYxYzFUz9vsXTePGyM8VPUHf7CSLgc88lCJ0MWXIWqtU2emqIT9VqmxEwqbIFkcoDcy3f+J1w1UYlJ0/BTv5Wo1
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(346002)(366004)(39860400002)(376002)(396003)(136003)(451199021)(8676002)(83380400001)(6486002)(478600001)(6666004)(6506007)(26005)(6512007)(9686003)(33716001)(186003)(2906002)(38100700002)(5660300002)(316002)(6916009)(4326008)(66476007)(66556008)(41300700001)(66946007)(82960400001)(8936002)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?W4J7zyjKmUmq5I+BGWT9yf0lYyxL+cVkVRx0wUJTDHy7Tm5AbOuxAnp5ItGc?=
 =?us-ascii?Q?7xnX/v42NwhWuNvC5CQVRRbzmgbgSMO/3GdCa/urye6XynduB2Rh72kmv/Ej?=
 =?us-ascii?Q?oSHLEgvSWiALXhp7GowiGGkA5xb10L+J1MchnMWePJ3O1w53tITv/Pkj1iYT?=
 =?us-ascii?Q?U4TQPmqvjMGUk1arUL7Om0iEwhNiJu93M0f6n+PJybX3hXu+e+OJX6yNDuiN?=
 =?us-ascii?Q?GcDcbW5UruvqFsXchf6i+vRXw1s9QilDqoaxmcsfPMjVCua8Pn/FKeSd/Qnb?=
 =?us-ascii?Q?pCbXLhZnyknXok1eMAU7rhvfH0qAIq4yoFaamIZozs0NAAGSlSIluTYwYAeo?=
 =?us-ascii?Q?sGzFLMGBg2+BAB4cmlGCOLX4QWg8vSLO4cv+KCs6OP5ArkXJwLmaDKkqXA6f?=
 =?us-ascii?Q?4UdpMheXfemgDUpICUTta8cTp6x8ePJuazGEOTbNLg5jVDpLMhhIcHUlXxMw?=
 =?us-ascii?Q?xohWyKW9vbYKKMxuB0FXFzZWQs+0PJlyrDUC/ELoVi/xKEa8iUwhWtEjQ2HV?=
 =?us-ascii?Q?FNQ2eJr3QUtNx/Eka5KQRRHPtb2uNziPE2EoQDGNSLBoTCMZfs1fBmP+YiJL?=
 =?us-ascii?Q?qoJwA+D7zjnZGSzyiJ2bDiCZi4sDz6lCQ6aPYeV9TTdfwh0aI+QovBtMMkIM?=
 =?us-ascii?Q?GqP9cnTpMM6VFw/gCrS8ewTVhpuxA++29GcMUvKqvhlF/CBfI5e37zJESLV5?=
 =?us-ascii?Q?krqzS1aRZl8mHc4KO1iE/UbJupn3EWTrJG0Zt+wAAeJE1sotKTCFADnnsHMV?=
 =?us-ascii?Q?g8awUGaJQaiPunvnpY2P+RYYRQLsQvTabsmDHmTwb7Plbc/MTr5Cj9YSXvM9?=
 =?us-ascii?Q?whfH8D4haAqgdZzXK5cK6N2UPngsN7xb1dYz1KPHNgd+URoSXnLj0B7IxZVu?=
 =?us-ascii?Q?tzsbX4cfbV82233frYc0ofl1UZlkzgjc4E3uGx1BJ8ZGprghHwX07VwOiMnD?=
 =?us-ascii?Q?MBX5KkZ7yPPAMdWD/oIYo3GulKwBfCmrLSnaDnG7wvosvgQnP0/tYjcxRXpy?=
 =?us-ascii?Q?Bb7fkcWrboAVQOWLqcZuWekyU55XMTVFczvPcjifCRvCPwEdXk5/Z8EKTxZ9?=
 =?us-ascii?Q?6aYgg0r+gnuJYOAnfFimIBCo5BRS5ffqItkvuOrUhCSpjdfzA2R5anEcsZsz?=
 =?us-ascii?Q?5bA3AjggeBEzJz07z0WknDu4i//GjrzM2ttnA23kMzITtbJxf8+S77cFK1nB?=
 =?us-ascii?Q?qjJRf4XOOY2VHq2SqtdIlNNJVcjFTNKctYFz4E/hIebKH5Af3fpIsw0rz4fz?=
 =?us-ascii?Q?rU5k80fIEIPlobGGcM96CzvJhEoRXYcv45MTYcnDjmCj5Xo+FRHdSBNfDEYK?=
 =?us-ascii?Q?rfi//B2uUNRv+f+MpE4TBpnGYHourA2dReVyt9K3V98yAfE3Ct0mCNN1VQOL?=
 =?us-ascii?Q?c8CokCWReMQSawUl4Pju1dTGF3RhVg+VRKaqvWLZQ1/T1C06la56W44ZiNm2?=
 =?us-ascii?Q?kpznfQELjnchw2EqBkh/s7fI5srSaGRVn0wCNf5Dm/0qpKAk7F0+5uKpx62d?=
 =?us-ascii?Q?+tiRVcKxrghSyq3JejcT2OBSwZvayPMZPPTC+cGbxEEpjfwjOpNRLLQC9Ewc?=
 =?us-ascii?Q?BznxGiWx0Onq3aVVbu0/xdBqEG1T/GBOgckIjezP9XZKCAqycYPyX7b/ADyb?=
 =?us-ascii?Q?2w=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 457e8b4e-615b-4c98-4048-08db3c83cfa6
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Apr 2023 01:01:42.9038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KN868HwCVljx/r6YeydRVQI2Tthj0iPnwRU26TveZYENRswn2WxmVvYrBXfh7qE0jbYa7Fpj3ZnT0pAw4WQlGIBdO/mKMUanGkdxT/IskJU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR11MB7093
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 4/8] drm/xe: Fix xe_mmio_rmw32 operation
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

On Thu, Apr 13, 2023 at 12:49:11PM +0200, Maarten Lankhorst wrote:
>Hey,
>
>I thought this was on purpose, and xe_mmio_rmw32 specified which parts 
>to keep,
>
>as opposed to i915 which set a clear mask.

it's only the params that are named differently. Xe follows the more
traditional names for a rmw (pretty much any other place mentionining
read-modify-write in the kernel and on the web I could find - also see
include/linux/regmap.h:regmap_hw_reg_update_bits).
i915 chose some clearer names IMO since there is no confusion that the
bits are cleared.

I think renaming to clr + set would be ok.

Loking at the original history of the branch: 9a903ac967fc ("drm/xe: GuC
submission squashed into 1 patch"): it doesn't seem to be intended to
have a different semantics as the call there was also buggy (and still
is).  We were supposed to clear that bit when enabling GuC communication
but we are doing exactly nothing with the way it is write now.


Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>

but I'd prefer to rename the args to clr and set like mentioned above.
And we will need a fixup commit for the display part as mentioned by
Maarten.

Lucas De Marchi

>
>If this was not, can you also fix display/xe_de.h to no longer invert?
>
>Otherwise, you break the entirety of display.
>
>~Maarten
>
>On 2023-04-13 00:52, Matt Roper wrote:
>>xe_mmio_rmw32 was failing to invert the passed in mask, resulting in a
>>register updated that wasn't the expected RMW operation.  Fortunately
>>the impact of this mistake was limited, since xe_mmio_rmw32() is only
>>used in two places to unmask certain GuC-related interrupts.
>>
>>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>>---
>>  drivers/gpu/drm/xe/xe_mmio.h | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.h b/drivers/gpu/drm/xe/xe_mmio.h
>>index 388a633b438b..a3b7f9f5db67 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.h
>>+++ b/drivers/gpu/drm/xe/xe_mmio.h
>>@@ -40,7 +40,7 @@ static inline u32 xe_mmio_rmw32(struct xe_gt *gt, u32 reg, u32 mask,
>>  	u32 old, reg_val;
>>  	old = xe_mmio_read32(gt, reg);
>>-	reg_val = (old & mask) | val;
>>+	reg_val = (old & ~mask) | val;
>>  	xe_mmio_write32(gt, reg, reg_val);
>>  	return old;
