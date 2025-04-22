Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0366C369C2
	for <intel-xe@archiver.kernel.org>; Tue, 22 Apr 2025 15:39:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9467810E1A2;
	Tue, 22 Apr 2025 15:39:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bkgsfkAF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AA1A610E1A2
 for <intel-xe@lists.freedesktop.org>; Tue, 22 Apr 2025 15:39:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1745336374; x=1776872374;
 h=date:from:to:cc:subject:message-id:references:
 in-reply-to:mime-version;
 bh=NtYGsntn3DcU1ksbR2oScZEQtUtIslz88B7coELjEZc=;
 b=bkgsfkAFwA4nojDu46C5JMktkr5Y3+4CdoxyA1WCZ6ug4/0vcUSK+jXJ
 IVP7PN9DfIZ0SF2XI3U95SwYhECUgwPProWwmxfBqx4GGrmpGfcq20Q57
 Pjsg89t7oXW6sqRLAgqOiY2kawzZ5XJvVLW836L8MUZ1YRMG7ksQr4cqn
 8LBSqqXCjYr7y9Y+UlqFAOX86cilDL3xcuOd2qF2QLw69jC/i7rLUY4h8
 5pf3XtUSePi9XJBt05juTRU/2r8YJxB1sdhzsevGC3H7anyYF9+uszJTJ
 WRM7saISUsUrF8HBC8/ljH/0OCQTycTfrpWHlHjtcaCfJ8hevDFskoNEO Q==;
X-CSE-ConnectionGUID: b9zRvOJLTH6iwk3z9R/OzA==
X-CSE-MsgGUID: 35WiWer0TMWU8KTTTWzUww==
X-IronPort-AV: E=McAfee;i="6700,10204,11411"; a="50732595"
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="50732595"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:39:27 -0700
X-CSE-ConnectionGUID: stT4nY7mR4q+7HOVvP+Yyg==
X-CSE-MsgGUID: Yup6K3KDQESbqaqgOTY0sA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,231,1739865600"; d="scan'208";a="131994103"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Apr 2025 08:39:27 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 22 Apr 2025 08:39:26 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Tue, 22 Apr 2025 08:39:26 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.42) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Tue, 22 Apr 2025 08:39:26 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jp+87Z1PycowC/PJ5E3r4oYJcEvROUTAjkVATietwFujftqDw2/X+/u+ZdlB5r59i9M4yorKXyooyCQpMgvhtxrsVG3GZPD6sgAxolbLI0/W+xjbpGf0/UwLHAqWCv8Muz+658Jw3aVYf5xPAjROOR1sUG2sDJDs5gkBSU5odFBOEqazPAq4xx35+rzNXzm3owEsO22ozbLf6phFQAxYP1YLJTp2avYR5dBGwiWn8llwvOjNwmuKXgyP0S7fxNgJD/6iPQZSpVd29M1/igK7LlpRZkqKWWafCs0C9LujFmwZykUoALx7r009CYbR/kthgGb1TB2yVlw7+FOflkketg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YZrwctV1f6RBulF5aDl+hudz5gdr0nOIpjSNHpVGuXE=;
 b=HVaMX2GlFh8fje7z/90O511QzBGpjOuWXXy32sTK32CzKieZ9Br4Al70fiH/5uUc72XL+g5uocQPKA9NsZWhRa3BEr0oaOZ7UZIeqrzFLjGI7zKdXC2TEUY6vlwrsE8gUdSv74liIwhzf/1JdmGgMIpcBbPk9jY+MM6Mw2Mb5y6rqz4fXYdyEz1wkTrvEqN9XG1EZZp9CGh/ul0icOJHhxuDKtuT8Rjt7arXKnE/sZn2vab2WgQoR90Zo2tX1ELajfihnwQiWhA82hnQJnt/a80HZjeNUPR2ymWebddQFGb6LCQVRxmSPn3qS3X7uDpGxbDU9XQs4JCIJwsdOUte4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6929.namprd11.prod.outlook.com (2603:10b6:510:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8632.32; Tue, 22 Apr
 2025 15:39:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%4]) with mapi id 15.20.8655.033; Tue, 22 Apr 2025
 15:39:08 +0000
Date: Tue, 22 Apr 2025 08:40:28 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Souza, Jose" <jose.souza@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v2 17/32] drm/xe/uapi: Add madvise interface
Message-ID: <aAe4bIz2NEpidrNC@lstrano-desk.jf.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-18-himal.prasad.ghimiray@intel.com>
 <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <023b0ec5c3e00b1779e0bbfde5a279042a86efa9.camel@intel.com>
X-ClientProxiedBy: MW3PR05CA0009.namprd05.prod.outlook.com
 (2603:10b6:303:2b::14) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: fb331ae9-d3a0-4ef3-6fa4-08dd81b3d220
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?RPPAWXPEtVLNpFIMwrrrkaGg2+ss73vv3cZKSyqMZuMN+pj5rDWJaQYkOL5G?=
 =?us-ascii?Q?Hpk57Ds+hRRNVI0Wks9sqxXfBNEHSitxOus+EUr8odVbPxwWONb0gDL2hBUl?=
 =?us-ascii?Q?3cd/ntnpVL1znlo6RA30n4YSMf7zjY5fB69K6DL0rTdVUD38rfRfMQ/dAwMO?=
 =?us-ascii?Q?EiLeebNUgPrPzsH+T99cqhUWxHTXp2H7cGqdmOu/e3AZ+XmJff/H/i5DaJyf?=
 =?us-ascii?Q?dtR/POXVXkOwca6Tn83Y1GlGfA4P4qZjgGZJA0xnRc9pBkzLcIDY3hA3rQj2?=
 =?us-ascii?Q?H/vM00v4JbakaMVkS8l9Sa7kLdJok/N/biUAVXiCCztLCh5lW/GMFqyF+bd/?=
 =?us-ascii?Q?ZUYmWfRMuyn4SpK+iG45GhcbFpzIjV6l9nFIcp7+zpVzcZXLtpDHmTeVKFpA?=
 =?us-ascii?Q?p851zo85V0R/A7MyMGVcMjdXH1KNMl2j6AM436+XgFsU2bUXZym4Xz7Rdf4S?=
 =?us-ascii?Q?MxJIMWfEVomn6KeaLo7GMgZKNycrBn04APrHEj+SJ6oBgUkRNRIf8zX6SRpz?=
 =?us-ascii?Q?6oYGGqJaHq92OlohXhD9c93s4+vCdtq3lknebLZc5mMXGTcS1hsOkLyWi102?=
 =?us-ascii?Q?IeDF7O44GEn7I3AVdiCBu0SBMPbkAwotJmZSbhFvrlW/7fujAkZ9zNZiJf50?=
 =?us-ascii?Q?Q1oIl/otNmsiYvnf8nc8+FA6OqybDyksFGOq6peODH5ue9CLzkvDe9cOuNW5?=
 =?us-ascii?Q?xSZPKSeTB0F/BXie+lm/QnbHkbyQeVXqhVR3RZ3ja4imLGeUtHAEM/zXTE72?=
 =?us-ascii?Q?nVZEh8QqFDlmxDi8RcgrHuBBJPhnrTENhURRO4NjA0cctgf0EU546q9xZWus?=
 =?us-ascii?Q?5tBU+IJh/sz/kwTisVaB9CXW+RmgK29+ECH1tj5g11uqBjd2ff9Mwd6E/k0S?=
 =?us-ascii?Q?W1QpnrKWzUp9uLOV6pfqSZBq7VaDU+vqAXHOD7a048sDKRe5sEmWvGBR5ecK?=
 =?us-ascii?Q?laMxSRO6vZrvsaQGwURUFSTjvPoIfCz1D5L1PPJx4Lyb0H5kJt/8uVBHEJTv?=
 =?us-ascii?Q?LviW+RtTZ4flxf3rdLwnph/QJT6WnW3ljYU5YGr7gQ6CA0tgd1dwAgJZYMES?=
 =?us-ascii?Q?3d5KHpPoh9VKgb8KRZryW891Z/YCTCX+TslyBAq2i7pyyuMQ+xD6XTtnupoF?=
 =?us-ascii?Q?igXPft5rm9N1smWO0UQvXTx9jtqZ9pvPbKYrguOfrFUeMYrDs0wVQQx1ZMr7?=
 =?us-ascii?Q?v70OVNvGXjhf9pxoTH5ii3uczBnreHpmahFGjh+HcnuyYfToZq0xFU5OiO5D?=
 =?us-ascii?Q?LtCjzvSXkYu3gK9KSbvpHMrobS77udDSx8VWubCbPQ6lQRGbHbtuc3Kcmmw2?=
 =?us-ascii?Q?2r7ygQVQ6m9Saaj3cLmVeoFuNXOT5fw8z09hPHvx8RtFQ8PcrjK0rs15MtdW?=
 =?us-ascii?Q?13Q4BCicSgmLYK78pV+VnJzAs3zkhpslxgK/SNNofqdFY03nEWlZNOu59yy2?=
 =?us-ascii?Q?ncGfbi1eG3c=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uniaChNNGdhdfO/meiy+HfOHTjqDIkeZQf61p9Vr5zxIOdpPfCTCkKFEZ3cH?=
 =?us-ascii?Q?/3XZiU2rYcUTdH7dhWmH+B8K73XModwT0XFznZTI2hE83pkIgHoVzaVzpuSC?=
 =?us-ascii?Q?2UBqpgCEhZYBGISq8oCuye+H0PqxmCJ/fbOMjbTwpan1SVxUzRCXQlSYZz/f?=
 =?us-ascii?Q?f4KOCOGIUiRyGnzTu2y/3uK6X/wsYKtnV7hf8TLca5mYPWIDazWjN1yaR2tX?=
 =?us-ascii?Q?H8UELvAdCiSvVt5aIzImwvERUdlReMZ7tBd17TjzVZ2dwbsIJTWN5u0h8i8l?=
 =?us-ascii?Q?Jm4U6h3zlA0XRXaWYRg0Ox6L6eozpDyYPNrDADIIp9wclQGAks6Fig7m1UEd?=
 =?us-ascii?Q?C/PYc/VZ+t7TY92KGAFv71n4fZ7uhnQTFJzmb+dnuSaw7tB71hEtsLiOoOI5?=
 =?us-ascii?Q?MQZevXifTI8HHp+hzc+cB8YNSZTTTAKItD+89aDAg2e8+4r+cbzGr8hShKS+?=
 =?us-ascii?Q?OAfStoHvYrY1C+JpS9KVziW9+yhED5NfRu0Ac2+h+eXfABbeq4j0sCc2vrCK?=
 =?us-ascii?Q?CkqkvvwfmugbxhJOsg/nxTqr6izY/heSSRO8YRuDsvqpZ8qiyoih9Yfo2e3I?=
 =?us-ascii?Q?3ZlVSVTEpuU7JIPBuIos5w2cQR2/LccuWua0pl/zz13c1i5LGa/aTfik9PqP?=
 =?us-ascii?Q?L3YXz70dEidbz8bJ6ssvL8TxZjiQ7HW0hbrAIjMkQz+E/Yct1t/Nx4PjzhQq?=
 =?us-ascii?Q?LrHaJ1VJUqj8hQZ3lluTdItf0RwahMe4I7jKHoFwqXGImT3buKo5vA2C7lzV?=
 =?us-ascii?Q?IqZ/5kAURY9N4vKTbsqI28RyrGB8ff8S8pxFY+E+dybknY36hLDZ8H3KLrHs?=
 =?us-ascii?Q?rlDfvt1uDkeB0ojpQu3hT9yvQFfWU2Z3TYx3GVJqUcJqUh+MpSFkEJ3B/yq3?=
 =?us-ascii?Q?WzKVJr4wGx49c99NtVmcFlrzLFGnFwnW0NUQW/PcFFE4FjqeYEDH/q1Cg10J?=
 =?us-ascii?Q?WU7c1mvve+nae8RnpB02LDJGfOTKb+Cle84J112jpH2d16ckuvjKKWtozjEw?=
 =?us-ascii?Q?7dyZDovErJkpUwLp2gfylfurMxrlICvNvrA/0d8YnUBE/YHgYitbmpL2L1XK?=
 =?us-ascii?Q?h4pPhdb0Sor5urodxGI5RWQIH6oUYNITjrdBq8rylZc+aO8cUZPo1H+qPYBr?=
 =?us-ascii?Q?0b1OyD8E1oH0fDpbMEJzGNAacN/GaQPViHziAzryOdQ0E/d/VO7+LntNgKIy?=
 =?us-ascii?Q?br60XoTga45HUmbnbuGg8dAMzvP9T8LImzLLX6ErxhUhJXkJBUi6HCLDoIck?=
 =?us-ascii?Q?am6SBac3MXTanDp1Xs9ABeqRjLHYqDQ4EgrLtCiJHEPU2B5odTJGpxuP7hY6?=
 =?us-ascii?Q?Kdg5yJ/pDyxiz27jV/KCGOVy8jGmMrAh4C+ofwtP8NNpIj3CZCaR76bJ+/jt?=
 =?us-ascii?Q?gmUwuDQsROpjuqElasi5ISrk5N17Cfol3cye8AElboiMtbgzOqKnCjRUzg4j?=
 =?us-ascii?Q?hjD0xtoSfzWLgsR5EUbAohxI4k5aDq2ROvQ/t7mfdSsnH03iK6Yzawbryght?=
 =?us-ascii?Q?MwIRlVkwrH9hYjPQllrFk5M01SJ7oeHwkYF8J1Zernn4izDg0qhXbkF9nIZH?=
 =?us-ascii?Q?gZsCC0edoxCrdVfLBnDwZq4Cx1njuoa49sRfVSst/2GNiSjPvYe+RoFm8Yhq?=
 =?us-ascii?Q?VA=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: fb331ae9-d3a0-4ef3-6fa4-08dd81b3d220
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Apr 2025 15:39:08.2709 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8O/jxpyCVt5PhttwSIDQW8duUSmcHxEw5scHhYCLRyrpAZrCLaQliv6aS1o9oPkV4P+Bp5Z6vrsg8loHg23mPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6929
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

On Thu, Apr 17, 2025 at 12:19:54PM -0600, Souza, Jose wrote:
> On Mon, 2025-04-07 at 15:47 +0530, Himal Prasad Ghimiray wrote:
> > This commit introduces a new madvise interface to support
> > driver-specific ioctl operations. The madvise interface allows for more
> > efficient memory management by providing hints to the driver about the
> > expected memory usage and pte update policy for gpuvma.
> > 
> > Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
> > ---
> >  include/uapi/drm/xe_drm.h | 97 +++++++++++++++++++++++++++++++++++++++
> >  1 file changed, 97 insertions(+)
> > 
> > diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > index 9c08738c3b91..aaf515df3a83 100644
> > --- a/include/uapi/drm/xe_drm.h
> > +++ b/include/uapi/drm/xe_drm.h
> > @@ -81,6 +81,7 @@ extern "C" {
> >   *  - &DRM_IOCTL_XE_EXEC
> >   *  - &DRM_IOCTL_XE_WAIT_USER_FENCE
> >   *  - &DRM_IOCTL_XE_OBSERVATION
> > + *  - &DRM_IOCTL_XE_MADVISE
> >   */
> >  
> >  /*
> > @@ -102,6 +103,7 @@ extern "C" {
> >  #define DRM_XE_EXEC			0x09
> >  #define DRM_XE_WAIT_USER_FENCE		0x0a
> >  #define DRM_XE_OBSERVATION		0x0b
> > +#define DRM_XE_MADVISE			0x0c
> >  
> >  /* Must be kept compact -- no holes */
> >  
> > @@ -117,6 +119,7 @@ extern "C" {
> >  #define DRM_IOCTL_XE_EXEC			DRM_IOW(DRM_COMMAND_BASE + DRM_XE_EXEC, struct drm_xe_exec)
> >  #define DRM_IOCTL_XE_WAIT_USER_FENCE		DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_WAIT_USER_FENCE, struct drm_xe_wait_user_fence)
> >  #define DRM_IOCTL_XE_OBSERVATION		DRM_IOW(DRM_COMMAND_BASE + DRM_XE_OBSERVATION, struct drm_xe_observation_param)
> > +#define DRM_IOCTL_XE_MADVISE			DRM_IOWR(DRM_COMMAND_BASE + DRM_XE_MADVISE, struct drm_xe_madvise)
> >  
> >  /**
> >   * DOC: Xe IOCTL Extensions
> > @@ -1965,6 +1968,100 @@ struct drm_xe_query_eu_stall {
> >  	__u64 sampling_rates[];
> >  };
> >  
> > +struct drm_xe_madvise_ops {
> > +	/** @start: start of the virtual address range */
> > +	__u64 start;
> > +
> > +	/** @size: size of the virtual address range */
> > +	__u64 range;
> > +
> > +#define DRM_XE_VMA_ATTR_PREFERRED_LOC	0
> > +#define DRM_XE_VMA_ATTR_ATOMIC		1
> > +#define DRM_XE_VMA_ATTR_PAT		2
> 
> In my opinion we should drop DRM_XE_VMA_ATTR_PAT as we can already change the PAT index by unbinding and binding the VM with the wanted PAT index.
> Similar for DRM_XE_VMA_ATTR_ATOMIC and DRM_XE_VMA_ATTR_PREFERRED_LOC, we could have those properties in vm bind uAPI and if needed to change we could
> unbind and bind the VMA with the updated attributes.
> 

I had thought about making madvise patch of VM bind too. I think it
could work but I do think it further complicate an already highly
complicated VM bind KMD path. Also the idea with madvise, is it doesn't
actually update the GPU page tables rather just the KMD VM/VMA
bookkeeping. My prefence here would to be keep this seperate.

All of the above attribute are really only intended to be set by
faulting VM which Mesa doesn't use.

> > +#define DRM_XE_VMA_ATTR_PURGEABLE_STATE	3
> 
> Mesa can make use of DRM_XE_VMA_ATTR_PURGEABLE_STATE but not the other ones, so you will need other UMDs to land those.
> 

I could see Mesa using this one, but again this just flips a bit in KMD
internal state - it does touch GPU page tables so would be goofy to
implement this in a very complex VM bind IOCTL.

Matt

> > +	/** @type: type of attribute */
> > +	__u32 type;
> > +
> > +	/** @pad: MBZ */
> > +	__u32 pad;
> > +
> > +	union {
> > +		struct {
> > +#define DRM_XE_VMA_ATOMIC_UNDEFINED	0
> > +#define DRM_XE_VMA_ATOMIC_DEVICE	1
> > +#define DRM_XE_VMA_ATOMIC_GLOBAL	2
> > +#define DRM_XE_VMA_ATOMIC_CPU		3
> > +		/** @val: value of atomic operation*/
> > +			__u32 val;
> > +
> > +		/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} atomic;
> > +
> > +		struct {
> > +#define DRM_XE_VMA_PURGEABLE_STATE_WILLNEED	0
> > +#define DRM_XE_VMA_PURGEABLE_STATE_DONTNEED	1
> > +#define DRM_XE_VMA_PURGEABLE_STATE_PURGED	2
> > +		/** @val: value for DRM_XE_VMA_ATTR_PURGEABLE_STATE */
> > +			__u32 val;
> > +
> > +		/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} purge_state_val;
> > +
> > +		struct {
> > +			/** @pat_index */
> > +			__u32 val;
> > +
> > +			/** @reserved: Reserved */
> > +			__u32 reserved;
> > +		} pat_index;
> > +
> > +		/** @preferred_mem_loc: preferred memory location */
> > +		struct {
> > +			__u32 devmem_fd;
> > +
> > +#define MIGRATE_ALL_PAGES 0
> > +#define MIGRATE_ONLY_SYSTEM_PAGES 1
> > +			__u32 migration_policy;
> > +		} preferred_mem_loc;
> > +	};
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +};
> > +
> > +/**
> > + * struct drm_xe_madvise - Input of &DRM_IOCTL_XE_MADVISE
> > + *
> > + * Set memory attributes to a virtual address range
> > + */
> > +struct drm_xe_madvise {
> > +	/** @extensions: Pointer to the first extension struct, if any */
> > +	__u64 extensions;
> > +
> > +	/** @vm_id: vm_id of the virtual range */
> > +	__u32 vm_id;
> > +
> > +	/** @num_ops: number of madvises in ioctl */
> > +	__u32 num_ops;
> > +
> > +	union {
> > +		/** @ops: used if num_ops == 1 */
> > +		struct drm_xe_madvise_ops ops;
> > +
> > +		/**
> > +		 * @vector_of_ops: userptr to array of struct
> > +		 * drm_xe_vm_madvise_op if num_ops > 1
> > +		 */
> > +		__u64 vector_of_ops;
> > +	};
> > +
> > +	/** @reserved: Reserved */
> > +	__u64 reserved[2];
> > +
> > +};
> > +
> >  #if defined(__cplusplus)
> >  }
> >  #endif
