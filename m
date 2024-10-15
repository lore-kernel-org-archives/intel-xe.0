Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8075ECFC266
	for <intel-xe@archiver.kernel.org>; Tue, 15 Oct 2024 04:59:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39CBA10E4FA;
	Tue, 15 Oct 2024 04:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="npkQkVj+";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3C9C10E4FA
 for <intel-xe@lists.freedesktop.org>; Tue, 15 Oct 2024 04:59:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1728968359; x=1760504359;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=FCHaWK11k5acOQFNDo8RKwC9PoEXFxf9ciVpe8KMOgo=;
 b=npkQkVj+RfUfn03skNXYcfNqlDPHOef7AjYNmZ/fX3Z9umPQnuo+mgWe
 yvQJzRMqIQFRHRrMXmMI1DCZ9LlEL4bmIpv3kvtBcidlzHr8gY4dnWWVc
 0FMKl8TtLhzftpUunwMKnzwZnNAM1r/bf7fTE5Mz0LBZPag12w0IsphgJ
 M83N1Q7vUMkaW9VWq8DTvyXkrq7GIAb+h/Y+5VKhSGKNDN2ke5ZS3QnHl
 q5bYY01vcEVOq2+seWYGyeU99ZYthlucFvxsA05ykTHHp0GLpBdGd/TRz
 a88Kzy8S78q1glBB1u7hCjv7B6fuRfj/KCrko36VwV3DvjlKLADMhsuzT w==;
X-CSE-ConnectionGUID: b6XfDhaxS7OcdTJgiXIIMA==
X-CSE-MsgGUID: cFHl+cw8SV+auGkhnnYAhA==
X-IronPort-AV: E=McAfee;i="6700,10204,11222"; a="50873271"
X-IronPort-AV: E=Sophos;i="6.11,199,1725346800"; d="scan'208";a="50873271"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 14 Oct 2024 21:59:18 -0700
X-CSE-ConnectionGUID: XtPvgGiMRKyGG0UCX91TLA==
X-CSE-MsgGUID: bfv6cgVzRfuKFOuh6gdBKg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,204,1725346800"; d="scan'208";a="81745592"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa003.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 14 Oct 2024 21:59:17 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 21:59:16 -0700
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Mon, 14 Oct 2024 21:59:16 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Mon, 14 Oct 2024 21:59:16 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Mon, 14 Oct 2024 21:59:16 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FavbAIsPvi4ttZHSqDDl9vOh7FVqwMfiVbSbfCqttccOmLJJ2MKffW13lF2Scf7KipfODoBKpZT8G7DvOyC3SxOR5jCOVojPSXcgAtu1NZcsnw81rG1MnveQ9o6xhy+0wZpC7wNaaPeMGK3t77CV+7YkDS2ol3wt8JwfHUhxkKFF3GzTTHaIfLWOclNBsNh9OzMjI9lQJaYtQnSwZ9UpRm8Q1Jvzu/TlW7ApBijwHX8oz3Wd2WY7H8T9gpXFz2W4z3PikwY5u+tAgtwOmcnLxrGgMCS2kd9vzoQtmxoI+oaAD5mwNpRQAcRL+88VArFeEMSUHHoBT1joT7FiXe0eMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7d1oC3MCc6fTGNuSRnx4sZvnDTQsTyI0v6xBJuyO9Ew=;
 b=sY0+Mi9hcN2Wg9Vno0TOJWCJdNSuyum8AMp5avaPfksjFwI93HyfKPQrcASrKMjuwrhiibVFb4elzzySBuGaY+LC9mQIEus9mhcUd4SSdEpJcT1K/ZW6BTiOrsYUWiDP2FbhAkj1ed71jfbhsYtBMcPw2pYwmqYIrMbOphhp3GAFW1jrlqWo/SCQlqXkwQ9wUHFDqWo+S/UxDNd2K09RczoPew9ThmU2oD6o4lFA5xbfHI5NHFuRxVue7xX29MOwWMQGJl1Dtk+V63tgM5OM9sXFWXOQAREgOzIZbEMMCmrYZ6gMhMJrIGqilEPdB/+ItaUdUmbRzPu3jNsPtiGyHw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by PH7PR11MB6449.namprd11.prod.outlook.com (2603:10b6:510:1f7::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8048.26; Tue, 15 Oct
 2024 04:59:13 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%6]) with mapi id 15.20.8048.020; Tue, 15 Oct 2024
 04:59:13 +0000
Date: Tue, 15 Oct 2024 04:58:37 +0000
From: Matthew Brost <matthew.brost@intel.com>
To: "Hajda, Andrzej" <andrzej.hajda@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Mika Kuoppala
 <mika.kuoppala@linux.intel.com>, Jonathan Cavitt <jonathan.cavitt@intel.com>
Subject: Re: [PATCH v3] drm/xe: add system memory page iterator support to
 xe_res_cursor
Message-ID: <Zw32fauoUmB6Iojk@DUT025-TGLU.fm.intel.com>
References: <20241011-xe_res_cursor_add_page_iterator-v3-1-0f8b8d3ab021@intel.com>
 <Zwndjh6knRv2Bs0P@DUT025-TGLU.fm.intel.com>
 <8bdfbeb3-5a02-404d-bd58-74e471f29905@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <8bdfbeb3-5a02-404d-bd58-74e471f29905@intel.com>
X-ClientProxiedBy: SJ0PR13CA0212.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|PH7PR11MB6449:EE_
X-MS-Office365-Filtering-Correlation-Id: b11bcc63-8c40-465d-3c63-08dcecd61d1c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?XC2QCTF79s/PU1CxTG8QDDhGXZ22Y3/+817lgnXRCnUZ3c0haFUg3BtDfH?=
 =?iso-8859-1?Q?XGyYhrnW6ud/Gdl+0XbKF61XjXgyztLgw1hwrujttcq2M95MeJj+3KF6qK?=
 =?iso-8859-1?Q?QLOBZujtAGMWYBs196MnCKGzUvnRodfhuCFydtaOT9Ld8rNfqNfLwNHDm+?=
 =?iso-8859-1?Q?HV4pNhnYOXvVhC2qOZzdrL6YGVtoCcjGAso1n/Vd9ntYPr3wjkPCxoke4j?=
 =?iso-8859-1?Q?PLx2T79ZSta3I6XO8b/OvprzKOEePkj5KI8tPcZlCnJ/8wkqa3nHBzy0+q?=
 =?iso-8859-1?Q?qBqHBcinHMS3G0bwhXz1oDvPusk3pZbNnxAwMQhRZwxKOcEwoGe0nii1tJ?=
 =?iso-8859-1?Q?HfrF1A0o00ttPptt1OIfh62VzTVJWK9t9pY/k4q/BNbZ3+kwm4nSMePXbJ?=
 =?iso-8859-1?Q?IWb3qMUdYdk16sbK/yvhAzLTYQEvuouaQ5WM2msNf4MMaNeMt+GTiOu7sR?=
 =?iso-8859-1?Q?73nvD+yRNGRXrZr7YYGJVBNqG6enUvS9xbw290iz7OOFPrvh3i4QCF1hpu?=
 =?iso-8859-1?Q?BLu3wPGypybhftqCr8a3YKyPX/pizmL7g3kA0Fgy9X+dYzxwkuPJoBiT0l?=
 =?iso-8859-1?Q?iQtjr9o8SZQJAxftuK3997ttj6Nueup//HBXRU9D8mR3h5H0PqRnK7jsis?=
 =?iso-8859-1?Q?RRXMlx3VUrbpYbGkODm/Jk1UsXZ/AEroIS0ny6h/FF4GQ4gTcESU5n6ce4?=
 =?iso-8859-1?Q?yhjqAABuaDgy+Cg0N0odMpNE9CRO7YJCJY0bTvvEJR+1F1nwzMZXO/z55C?=
 =?iso-8859-1?Q?GZPAic/xWI4nZe2m2xNOhC6e0tyCMOuHfdBOSJC2LvLVWmHlLQNod7QWfh?=
 =?iso-8859-1?Q?5oOCYCwLpRwaypFmO3deuuuOd4tmO5MqrBoFTKYKHDBdqDJr6pO0tbFy18?=
 =?iso-8859-1?Q?juEnjvXuAfTVGI3PZqGhncEIJPFPdICCDjym+dIzfoYCAzoGiCcBSXsclf?=
 =?iso-8859-1?Q?LBq//YWibvKSB7R58AWdsKhRba2rLiNrDMM6xDHNRifMyxQFX4IhJuMXgz?=
 =?iso-8859-1?Q?+n4YUUnHZtzwG9HJ4aeSuyymBPXkhQw57f7Pp++hM5rupCET+EPM70no2S?=
 =?iso-8859-1?Q?5VEs4QftzNwbPaNfNzOaJ+eSSyXBhBA/HP7PNQcXGtW3gMifjm+TzxRwHG?=
 =?iso-8859-1?Q?sd00dcYVvrqaXQM86E8vUs48Yb2+LCB93GNZYYtS7FmtBd+Dj6hqSURo1Q?=
 =?iso-8859-1?Q?lMnS92oa44bnw388A7aOENtxcUlnGHe1XhsBGG/eNXCOExb0dDFXVFye3J?=
 =?iso-8859-1?Q?djE8aW12YI4+/P976pQ9uPThzHn0L0v4mOu7eyeUA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?cvu4JH7cN/5pFqUq1HBc3Rn6WGciYWkSOfPuonTlZJXDnGcq6juFcmyZlj?=
 =?iso-8859-1?Q?uyMVe0yy7hkUMa41+vWK/aqNaCv3epGuphQAHffI8JazYf1Dy44R6ebVuw?=
 =?iso-8859-1?Q?7mVzDUK/5zry7x2NxxgVE5/twddk1MHhi9ZZDmS0uO0v6BDflWGZn0DET3?=
 =?iso-8859-1?Q?VexFhEoH/F9smsc/ipGaSIbiogLWw0t24YcKxKSLQ1IdwB2av9y/n+U6Su?=
 =?iso-8859-1?Q?51e6mXdvCTTIXOMNDrp/Zk/49q8wtGlQ0h3rMDFsbwpZsFEJd9YUC7uk2I?=
 =?iso-8859-1?Q?mD8iEPMcUc0bqV8jV3QGmyQvGOGvMQCNxOdlVC10W5lY1Tpo8k6tDJcW3F?=
 =?iso-8859-1?Q?jak37x48AYntxx7Jm99IURtRR0WfRWgX26BbLrjc1vNF58Zm0IpK+xJNW+?=
 =?iso-8859-1?Q?PR8i1LBvVD1K7xU+YGrxkELjb86XnE8JpT6qtVv8NzbqEJChMngK880Ix4?=
 =?iso-8859-1?Q?g5XOCgSPmMy2+0pJTlFjXiPihiqWuGvWhFYtik2D7lh34/HXEhLU64wuS7?=
 =?iso-8859-1?Q?r61Bz2cE3V7o69sw5b7QvIxbTIaPq25fRL8Z6WBz5TXkOVljdlkgocNem8?=
 =?iso-8859-1?Q?jkNeyzgQUGfPHjJ/LkjKmTSKvcWWeKCnkCqFA9hdKdOFisRj6wOw6wB5AH?=
 =?iso-8859-1?Q?pFQHS00B8iagzvIlVjKodf+IplLg/AF/lrhbZUzFCbqoR1dFtSnQt15hhr?=
 =?iso-8859-1?Q?4M5uC1MUggpk3RDCV5diDuay4oPAPuoicTQqfbppaJlTVIjeakOnjutHlZ?=
 =?iso-8859-1?Q?gW0poHEEHOD4P23iCMTocMWd77V3TkWCHjRfjmCy84Xu5HLVjPy6RS2Z4y?=
 =?iso-8859-1?Q?Zdv/2PUN/sEAfiM8V9iUW8bCc7o0nOojLEvSyO+TT8B9ETWL2qksEvzdZ4?=
 =?iso-8859-1?Q?GZqX4RWOIfEVD6t61xTepRsD0y0JLhqINjG3kAEz4/Q5U1JjkMyPf39mt8?=
 =?iso-8859-1?Q?pyXd3BXKm2KAtr8h45FoiWUAJHpPQ8LhZAWKUv3AvPXDIh0AdwJWkaYMv5?=
 =?iso-8859-1?Q?8ZDobhbHZolQ8Ju4dO93O6tfU6uqdNtT9vNxcvvTzmNNPG5dlck+PsMm+Z?=
 =?iso-8859-1?Q?+2Khx7hfSgiDug9L9hn7iTOP79VA6j+hJ45eNvbhwEK3NybIaOUgblNtnJ?=
 =?iso-8859-1?Q?DQ5KRwDriEplWJOuxyXE37O3A2tbTl8fvKPF0XJU7RFAuv0wViQYl2/Mq9?=
 =?iso-8859-1?Q?HHfYC25bjikIvmHWFsy55z/8QSbAAPxIXIi/U82AaaaVh3jyWtLe2AmlVU?=
 =?iso-8859-1?Q?kG0BWCSuMmDuNhF+wYlvnYAQ6MDrSnRA3WxrN5f5Q2lHTJHfjUGwDTwThP?=
 =?iso-8859-1?Q?1OCX4ad8mhjZa39/rO8HEERoKETp87tSVhbbSJ1kbd3LydMiU6yO1EyMns?=
 =?iso-8859-1?Q?gvmkaSPcLtHYpkqqU6QoGRiIvldSX99yDpRPXvfzdTD8Ef7hndlIdyrF/2?=
 =?iso-8859-1?Q?2JZQAWJELM+rsh9d783y9/2PbltcCgiSiXTMi8AZn1xjkace5nU56qLdJ0?=
 =?iso-8859-1?Q?QD0HsH1LvMvK83W7D3Ryg0m8pHEBCBKaKTaV/3RN+LhTMvsh7gGsqhDyOY?=
 =?iso-8859-1?Q?re3FKw7qCzOalCq2ObM9UTrSFUTRZwnyRr8FnbB+qT+gKEXjWu/uhgFoTj?=
 =?iso-8859-1?Q?HC79X36vQ2k2UxPB2v8EgWqYSFvVnDct86qzTJuMLrGTfmdA8vCZ7WQQ?=
 =?iso-8859-1?Q?=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b11bcc63-8c40-465d-3c63-08dcecd61d1c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Oct 2024 04:59:13.6466 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +z1NiIvVizUL/wI8lWtcr+Gu12SIKucgG4EUsOcom5evjjj0/V31AEHXkQIZNDxQyJjc/P0WKNTX2+phi+97rQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB6449
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

On Mon, Oct 14, 2024 at 10:18:13AM +0200, Hajda, Andrzej wrote:
> Hi Matt,
> 
> W dniu 12.10.2024 o 04:23, Matthew Brost pisze:
> > On Fri, Oct 11, 2024 at 09:26:30AM +0200, Andrzej Hajda wrote:
> > > Currently xe_res_cursor allows iteration only over DMA side of sg tables.
> > > Adding possibility to iterate over pages allows the use of cursor in more
> > > contexts.
> > > 
> > > v2: fixed wording in commit message (Jonathan)
> > > v3: indentation and author fixes (checkpatch)
> > > 
> > > Signed-off-by: Andrzej Hajda <andrzej.hajda@intel.com>
> > > Reviewed-by: Jonathan Cavitt <jonathan.cavitt@intel.com>
> > > ---
> > > - Link to v1: https://lore.kernel.org/r/20241009-xe_res_cursor_add_page_iterator-v1-1-c883446e5770@intel.com
> > > - Link to v2: https://lore.kernel.org/r/20241011-xe_res_cursor_add_page_iterator-v2-1-367b74c1cc29@intel.com
> > > ---
> > > Hi all,
> > > 
> > > This patch is required to proper implementation of userptr_vma access
> > > in configurations with iommu turned on[1]. Required by upcoming eudebug
> > > feature.
> > > 
> > > [1]: https://lore.kernel.org/intel-xe/20241001144306.1991001-13-mika.kuoppala@linux.intel.com/
> > > 
> > I'm failing to see why this patch is required for [1].
> > 
> > I don't see this patch included in [2].
> > 
> > Both justifications here are pretty vague - 'use of cursor in more
> > contexts' or 'Required by upcoming eudebug feature'. Not understanding
> > the why. Can you please elborate?
> 
> IIUC sg tables after mapping operation contains mappings between list of
> pages (represented by pair of struct scatterlist fields: page_link and
> length) and list of dma addresses (represented by: dma_address and
> dma_length), both lists are 'hidden' in sg tables.
> 
> Currently xe_res_cursor can iterate only over dma addresses, ie after every
> call to xe_res_next xe_res_cursor.sgl points to scatterlist corresponding to
> dma_address at requested position.
> 
> But for eudebug we need xe_res_cursor.sgl pointing to scatterlist with
> page_link corresponding to requested position, ie we need to iterate 'left
> side' side of the mapping. The only change to achieve this is to track
> .length field instead of .dma_length.
> 
> I hope my understanding of this is correct, at least tests are positive :)
> 
> Userptr implementation in v2 does not work with iommu, and does not use this
> patch, and needs to be fixed. My intention was to get early feedback on this
> approach and merge it separately, or alternatively post reviewed together
> with eudebug v3 patchset and with userptr_vma patch [1] updated to use
> introduced xe_res_first_sg_system:

I'm getting a little lost reading this but I think I'd have to see the
complete picture to know if this correct - it doesn't seem to be, so
maybe hold off on merging for now.

Also if you see my comments here [2], in general I think the userptr
implementation needs to be tweaked to operate on pages rather than a sg
list.

Matt

[2] https://patchwork.freedesktop.org/patch/617481/?series=136572&rev=2 

> 
> @@ -3662,7 +3662,7 @@ int xe_uvma_access(struct xe_userptr_vma *uvma, u64
> offset,
>                 goto out_unlock_notifier;
>         }
> 
> -       for (xe_res_first_sg(up->sg, offset, len, &cur); cur.remaining;
> +       for (xe_res_first_sg_system(up->sg, offset, len, &cur);
> cur.remaining;
>              xe_res_next(&cur, cur_len)) {
>                 void *ptr = kmap_local_page(sg_page(cur.sgl)) + cur.start;
> 
> OK, also s/xe_uvma_access/xe_vm_userptr_access/, but this is different
> story.
> 
> 
> Regards
> 
> Andrzej
> 
> 
> > 
> > [2] https://patchwork.freedesktop.org/series/136572/
> > 
> > > Regards
> > > Andrzej
> > > ---
> > >   drivers/gpu/drm/xe/xe_res_cursor.h | 51 +++++++++++++++++++++++++++++---------
> > >   1 file changed, 39 insertions(+), 12 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_res_cursor.h b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > index dca374b6521c..610407f23dbd 100644
> > > --- a/drivers/gpu/drm/xe/xe_res_cursor.h
> > > +++ b/drivers/gpu/drm/xe/xe_res_cursor.h
> > > @@ -129,18 +129,35 @@ static inline void __xe_res_sg_next(struct xe_res_cursor *cur)
> > >   {
> > >   	struct scatterlist *sgl = cur->sgl;
> > >   	u64 start = cur->start;
> > > +	unsigned int len;
> > > -	while (start >= sg_dma_len(sgl)) {
> > > -		start -= sg_dma_len(sgl);
> > > +	while (true) {
> > > +		len = (cur->mem_type == XE_PL_SYSTEM) ? sgl->length : sg_dma_len(sgl);
> > This doesn't look right. sg_dma_len should always be sufficient unless
> > I'm missing something. Can you explain why if 'cur->mem_type ==
> > XE_PL_SYSTEM' you need to directly look at sgl->length rather than using
> > sg_dma_len(sgl) helper?
> > 
> > > +		if (start < len)
> > > +			break;
> > > +		start -= len;
> > >   		sgl = sg_next(sgl);
> > >   		XE_WARN_ON(!sgl);
> > >   	}
> > > -
> > >   	cur->start = start;
> > > -	cur->size = sg_dma_len(sgl) - start;
> > > +	cur->size = len - start;
> > >   	cur->sgl = sgl;
> > >   }
> > > +static inline void __xe_res_first_sg(const struct sg_table *sg,
> > > +				     u64 start, u64 size,
> > > +				     struct xe_res_cursor *cur, u32 mem_type)
> > > +{
> > > +	XE_WARN_ON(!sg);
> > > +	cur->node = NULL;
> > > +	cur->start = start;
> > > +	cur->remaining = size;
> > > +	cur->size = 0;
> > > +	cur->sgl = sg->sgl;
> > > +	cur->mem_type = mem_type;
> > > +	__xe_res_sg_next(cur);
> > > +}
> > > +
> > >   /**
> > >    * xe_res_first_sg - initialize a xe_res_cursor with a scatter gather table
> > >    *
> > > @@ -155,14 +172,24 @@ static inline void xe_res_first_sg(const struct sg_table *sg,
> > >   				   u64 start, u64 size,
> > >   				   struct xe_res_cursor *cur)
> > >   {
> > > -	XE_WARN_ON(!sg);
> > > -	cur->node = NULL;
> > > -	cur->start = start;
> > > -	cur->remaining = size;
> > > -	cur->size = 0;
> > > -	cur->sgl = sg->sgl;
> > > -	cur->mem_type = XE_PL_TT;
> > > -	__xe_res_sg_next(cur);
> > > +	__xe_res_first_sg(sg, start, size, cur, XE_PL_TT);
> > > +}
> > > +
> > > +/**
> > > + * xe_res_first_sg_system - initialize a xe_res_cursor for iterate system memory pages
> > > + *
> > > + * @sg: scatter gather table to walk
> > > + * @start: Start of the range
> > > + * @size: Size of the range
> > > + * @cur: cursor object to initialize
> > > + *
> > > + * Start walking over the range of allocations between @start and @size
> > > + */
> > > +static inline void xe_res_first_sg_system(const struct sg_table *sg,
> > > +					  u64 start, u64 size,
> > > +					  struct xe_res_cursor *cur)
> > > +{
> > > +	__xe_res_first_sg(sg, start, size, cur, XE_PL_SYSTEM);
> > Not seeing where this function is used in [2].
> > 
> > Matt
> > 
> > >   }
> > >   /**
> > > 
> > > ---
> > > base-commit: f1561e6c62b5b5c3fe0276f2fbe7325e0d7c262d
> > > change-id: 20241009-xe_res_cursor_add_page_iterator-d29d73c3eb99
> > > 
> > > Best regards,
> > > -- 
> > > Andrzej Hajda <andrzej.hajda@intel.com>
> > > 
