Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF326C83F03
	for <intel-xe@archiver.kernel.org>; Thu,  3 Jul 2025 17:55:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A06610E069;
	Thu,  3 Jul 2025 17:55:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="SB5mh4wi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D46E10E069
 for <intel-xe@lists.freedesktop.org>; Thu,  3 Jul 2025 17:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751565312; x=1783101312;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=IzYcrxmHpz1fQbLxwr3bLO7I2bwIwlJ8B6baIn6BKj8=;
 b=SB5mh4wiew0+PlMcn1cQ0xDzBqO2jWw5+AC80G3xndC6ZzaA2lnPhuU9
 O4NSlljG4MgY6XyOIXsDg/YNsSF6mszzAm72c0vrepaTx+76sjUSA9RMj
 r9AZNY8oYQoz8Qqcu0GJ/tc0Pwl94RiiXU8pwhcpQwckmc10EtUdJH1ao
 n4/ZGrVIfvwdzVen4ftOsHpe68lSI/ODt4xM0seHr/INVKWHU7r8GUg2X
 dGmYw+PZSSWvGpBPBZZbtjPua+Uw0a4g1dSanwU8spGl7nuNLJsfLh0XO
 PXqkCNm/9+judQCW/pD2Ttv8SRVOfHI0HZEbm8rNpR61pUchNsExnWNhR w==;
X-CSE-ConnectionGUID: UVgA5WqWTs2jLHuWG5enMQ==
X-CSE-MsgGUID: 3nUlIA5QSkeFKfURsyVUMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11483"; a="53874112"
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="53874112"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:55:11 -0700
X-CSE-ConnectionGUID: A/wtSynxTF28dqdK82KeOA==
X-CSE-MsgGUID: UwiNhJFDRaexXzjGJrj0fg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,285,1744095600"; d="scan'208";a="185452608"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa002.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Jul 2025 10:55:11 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:55:11 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Thu, 3 Jul 2025 10:55:11 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.86) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Thu, 3 Jul 2025 10:55:10 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T9TNIiZ+X8PDvJoik1FIEzzrm41VnV1zYqHTcLrMhmwH4AGde5x0jAGO5fxV5zQllOTXVYsZnyxcIH5B3GlblEsh0jtfxISuEAx8HUTcAhQy8tOkYBlaqsEMgGLy3y9ime5S1xdv/2FFvYSXQCPqOQKmcLIBBK8xT+pZ8kGJnor9DZ4yu/WIlB6tU6fqE1sEsOsdElFeq05wwKMoGa/b3BmEhvlMASAXvV7R/vXm9qSDvLrAHKvpFxmoReBlHqpDXPtnIKKXsMov8svVJOXjWCb/tv6pr3rxvsVwPIiAdPZ48jVl19NFrbhem4UP4WqwVa9XDppqCm6/Ba8yerEcpw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XEZZNOXGKSLVT4SHdI+yKx/6XVBVF4K6VLeQZOej3z4=;
 b=sybF+PIqi03DcMAzpN4uDcozYl6gBGkMKbKA+Wuih2Ci3imxCVvL+MPJCjpzO/482FD72Rm8E4Bgt9fRdGdgPSv5UVRygSALxfokTT7lq7aJjzRS4V4BczFrvbJb333SjyQ1dD5/Ji/ok1ZRkMbAqDPsUrGJfwhMvMIm8yTTNvGRqyb7Drk+OYKFoCmt/4LT3mm8bJs6eHN3reG9aC3L9BmCSwKIB6Z4agyako78ydWNVfIzzbGjs+rHAXqJ22xdnFmW53ZVB1nxt1XPSkl5HopnBKWMYeFEfwM2CQT+zJm//Z2pB7rW23Bbgdt8LfzdOTQbm4lazWeg2Dx1X3uw4g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPFEF62BB3A3.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::85e) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Thu, 3 Jul
 2025 17:55:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%5]) with mapi id 15.20.8901.018; Thu, 3 Jul 2025
 17:55:08 +0000
Date: Thu, 3 Jul 2025 10:56:50 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, =?utf-8?Q?Micha=C5=82?= Winiarski
 <michal.winiarski@intel.com>, Piotr =?iso-8859-1?Q?Pi=F3rkowski?=
 <piotr.piorkowski@intel.com>
Subject: Re: [PATCH 2/3] drm/xe/pf: Invalidate LMTT during LMEM unprovisioning
Message-ID: <aGbEYoaQTascRaLJ@lstrano-desk.jf.intel.com>
References: <20250702223041.1700-1-michal.wajdeczko@intel.com>
 <20250702223041.1700-3-michal.wajdeczko@intel.com>
 <aGa+YbxiJSW7EjbI@lstrano-desk.jf.intel.com>
 <ff5eb344-f619-402f-ad37-4287a10f4288@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ff5eb344-f619-402f-ad37-4287a10f4288@intel.com>
X-ClientProxiedBy: MW4PR03CA0350.namprd03.prod.outlook.com
 (2603:10b6:303:dc::25) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPFEF62BB3A3:EE_
X-MS-Office365-Filtering-Correlation-Id: db75c1c7-4934-4df3-73cc-08ddba5abfca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b3FWOWFZZlpoRmwrS053djUxWkU0ODBiVGRzZTl3RXpFamxPVW54ejY2bkJo?=
 =?utf-8?B?Vno3VitraG5QTkVkazVLRXluVHp3ZFViZXl1bGltZ29kNnQrZnljQ1BTNVlO?=
 =?utf-8?B?dzdEOXBqWmJVYWpKdjJRbndjMkxYTXo2SDR4Uk5qcjE3MzFoOGZJQ3lUc0Ja?=
 =?utf-8?B?TXZYdEhkdVd2R0N5T0oxUlpEaVhVTXorVU5iYWROUFkxa05DOHppd01lRFZD?=
 =?utf-8?B?czVnQWFrOHdhd205V0pNcWJCZVhzQjIvNGpXYWNNMVdFQk1JOTZLRU1raklI?=
 =?utf-8?B?U0prU04zZ25LdWFQUTBsUStpa1VBN0c3SHpRYi8xU2xJYmo4ZzBuUXpDcUY0?=
 =?utf-8?B?Q1dmbC9xN0MyRUtRWHNtY2dzYk5XTk5aNkVXZzg1b08zYXlJemd3bG5ZRmZW?=
 =?utf-8?B?ZllRZnRRZC83UXVOb0FGU2s3QkxpMkhxd056amh6UllVSFA1SGNSZTVOL3ZS?=
 =?utf-8?B?R2hVV0xZY3VoSXhRbTMwUTlLNnVMWmY3eCtpS1hxQVU5MVJvV0UrUC9jalRE?=
 =?utf-8?B?NnlQSFE2Z2tKN09FblVOM1IwaTM1aHZ5VFRRd1dteGhibUdQQmxYRHYzbk5S?=
 =?utf-8?B?Q0Q4M0w2WTJwWnVNU3JtSFg2LzVOKzhUOW1SR3hDRHRTenUzcjNVbW4wUCsv?=
 =?utf-8?B?ai9qLzk4aTNrbVJ2YkJPc3Fub29RdmE0VHgzWTVSS0VPdnRmd0VqZ001UDMw?=
 =?utf-8?B?azZsdjd4WGVuMUNkTkJyL2FEMm9yMDI5WTdibXBmaUVoc0wyU3VQcGpFNVpa?=
 =?utf-8?B?eEszR1Z2VTJSZG9WR2dVVDhKWHU0c3RsbzE0Mk5LNE1uTEdEZnpBMkVhd3FL?=
 =?utf-8?B?QmIvYnE5OHlDL0lEUFhxQmw2WnJYaTBRZndwcytraHBCQW9NWGw2RE50YUw1?=
 =?utf-8?B?VDZCSnNjRTNiSThMTGROMFRKTm1lNk5vRHdWUTdOaEVNOXNkYzc0TlM0RUFr?=
 =?utf-8?B?bXVpeldDSTR0REszKzJSQWVSLzFOa2tPd2pFQWtIWW40SC9lbzA5REtlSGdH?=
 =?utf-8?B?RmpUYnBydXQ0aDgxYmd6dmZ6V1F4ZVdRMDFLOWppWDVyL0J5clYzTExnYU52?=
 =?utf-8?B?U3Q1TCtFbjNDNDRIQU5wNmhhRERyNUZtRERBNDR0Vm12Ti8yRkpwL2U5Ym1k?=
 =?utf-8?B?TGlZVldzSFJRa3RhSGtKbW0xOSticmVubzhqZzU0bVBNTUp4Z1M3QnpTVElx?=
 =?utf-8?B?a0VjY01FNHJWZlUrTlJQd3hReVdGaDBPZVFsTy9GMGFBUjY4d0xJKzFRSUp5?=
 =?utf-8?B?bk1CV3BTYXJ0Vm1hVmVidVQwZjZGNlZKNGxOMW5IVE9IMTE1VHB2b0wyNlo3?=
 =?utf-8?B?TUxzQnJ2Uldlc0Q3TjBBTXVPYS9HWnFjZDhkMGZsaGZSejh4akRSRWR3eUZx?=
 =?utf-8?B?ZEtDSXlIQ2FMNkZwenRFYmZpak1NUXZhd2NnZG5sQ09Kbk9SeXZxbjMxNk5u?=
 =?utf-8?B?VE1OWi9ZN2trS0xSWkN0MXhZeU8ySHdFbjdkdWRqVzJSYjVPTkx2d3RaUm9S?=
 =?utf-8?B?bDNrbmc5SVorbG9ocTgweEhCNUZQRUVmamUrRDY0TmJZcWZDaGNGdGJjdnZi?=
 =?utf-8?B?SWoydUhYajBidFFTQm1hRXpuUkJTa29aYS9ib2tQQ3Z2azVUTjYyb2hNZldt?=
 =?utf-8?B?ZVhjSVhpeGN2V1ZCVi9HcFY2OWsycElHQmhpbHdpL2N5TDgzUWlxZFZKVGg1?=
 =?utf-8?B?eGtpU201cmNpTisxdXNIRGMrQmdrSlVWTThMVWg5TkNvd0dtOGs0azJCYmhN?=
 =?utf-8?B?VVNDOTYzZkErQk5HaGtDcC9wSGlqK3Z4Y0xuc2hFMDBmeWp3ODUxaGVCUGNp?=
 =?utf-8?B?YWxqZWl4Uy9aOGx6ZkJjUnBSLy94TCtkVDcxUVAzbzFRUHJrSkpsZzRSSElF?=
 =?utf-8?B?ZDViQ2ZRV3BJcy91WHA4dUpwYkU2Zk9Gd1hBQXYrbjMzWThJeTlIOFBFaGcz?=
 =?utf-8?Q?SgtVkgqXsnE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eTRjU09Tcit2STA2ZkVaOGZnaVcrVllNUStpelFicW53QXFvY3JpTVZuWmpq?=
 =?utf-8?B?dHA3cFNTUHpENkFORUppaW9GWTc4QjZ0UmtoK0FrUkdwaE9TSGEyRVZyUEpK?=
 =?utf-8?B?S1NHNUMyZFdtcUphSmc0aHhJRFF1VzNHUk5ZNlRlZHU0dTFsSTJLbXltUHA3?=
 =?utf-8?B?K0FQNVJ2OHVRWEgvdExHdmJTQXIyRE5HRkp5ckFWeTltVHlsaWZXN3Z1djg3?=
 =?utf-8?B?bk5Ua3d1RG5UYXkwNWJTUnBHd0pqUkVLTmVXZkRnNnIwdGc1QnByQk9YZE5J?=
 =?utf-8?B?R3pCWExUeW1mNVN0OXVIN1hQcWZoRGt1MEtob0Zna2h0SFVxblF4ejFPZ0RQ?=
 =?utf-8?B?N0hSMVk1U3V0alZYVDd1VGQxbnZveHZoQlpab3hRRGFTSStWSEx2NjlHSGUy?=
 =?utf-8?B?Zi9HeUUwV01CVkRndWRQVi90dE5pS2JUR0ZMZ3JCbDlqUGxFaFh1aHVNRnVJ?=
 =?utf-8?B?WE51WjV3aWdqQWFrT1hSR3dTdDJHNi9DQlhkMWdlUEk0dWptc0IrTGt2TmVQ?=
 =?utf-8?B?NU1TOU1IaG9HVzByM0tBWUp1R0R5bERXWnF1WVVmRnNWdDlzWGtuTVI1NnZC?=
 =?utf-8?B?aTZjcFRaRC93ODlkK1NmV0lKTCt5dFl2alRQazlodHVBR3YrY0R6ZncwbnF6?=
 =?utf-8?B?VnJPeGErUVduakg5ZzNPS1RFZVIyNE42Yy82aUdyeS9tM3ZHOEZGWUtSK0pE?=
 =?utf-8?B?dGRmRjRLWVFLaDVJMWIrYmF3UEdzbXRyRmFFTjEwQ3RDcVFvQXdFTUtVU0RZ?=
 =?utf-8?B?TmhqcjZndHNTbVVZNGxEM1pOc0ZVNllmTHoyUWRJVis3NzQxYVpVRFNoTGpI?=
 =?utf-8?B?SGhJNGE4cjBiSkNlczJ4V1ZuQjFHQkxGSkwrTFFFTTE4OXd0TVppSzYrZlY0?=
 =?utf-8?B?YzB1ME1QaVY4SXdidlpIN0NXMS82TTNlMDhIdlh2QjZsbjgvNTZCd09tejZX?=
 =?utf-8?B?aUhrSkRXNWhoaStiVlBjOCtrdVFMVDNQUG10cjlndWM0VUVUeXlvbG5TYlhn?=
 =?utf-8?B?SjNqTHFXMXQzQitzSGJjY3JkdzJqN1BpZjhYSUxYcTNVb3plalZjYlQrZlh4?=
 =?utf-8?B?OTRlTEZGTWpQMVdIalhFMnNRTWVnNTVvL0VlWnMzK1N4dGdiZmg5Um1PcjQ4?=
 =?utf-8?B?RVN1MlRJbHk5TDRpUzcrc3hWMUoxUlN2OTRielUreFdXd28vcTVVbTlOdUZY?=
 =?utf-8?B?ZmRmd0hRQXhDMUxMS1RFLzRmOVJWRy9HTTVPcGNmVzBjMDhDRkRjTWdwcEhF?=
 =?utf-8?B?ME0zVXpaa2hMMnJiR2hlS1p3TjkwbGRiYnFnK1JrSy9KMVJoSWx3cDhxVDBL?=
 =?utf-8?B?UDQ3UGNpZm02UzM4N0pHTnBkbmh1cUhPNVZlZ1FPTENTbHN0SEc1VFhTYUR1?=
 =?utf-8?B?b0hOSzJ2V1ZPdkZlOFRTNGhSK1Fzd3RkZWV0cTFpY2ZCMWVzbzQySmIwdGxn?=
 =?utf-8?B?cGU2RWFiSzZLNEVoSENLcWpqdUNwanFqeU5mOTlBYUt6QkZqZ0dSeEhnc0RJ?=
 =?utf-8?B?L3dydTlSQXVHKzFJY2w4TDBhdXlkbVJnaFBsNWZ3aFdyS0NqdGdwandBRUY0?=
 =?utf-8?B?RzZJWXJhZWcxMzVMSVBhZG1KbG5TNnpzYjVhYWNxWWtmSDJHb1NyOC9jVTBO?=
 =?utf-8?B?Yk5qOTVlYmhMVGxzbFFBbWdYZDVHZXhNTlk5RjZBR28xRi9tSFhTNUR4Qldr?=
 =?utf-8?B?U2hJT3VvRUt5TW13TXNmQU4xV2tGWXltRnE2MXB1dE1kbkYrd05IMVB6SENO?=
 =?utf-8?B?VXBKaDlzN3pqUUVXejNlWGsrNTdyWnhPT1g2Vm9rSHdETUhZYy95ellvOWFP?=
 =?utf-8?B?QnZGK3dQWVk1UUVmeTUzTFV3U2xQVWtLM0pFc0VuRW1waFlpaHYrQ3VwMVZQ?=
 =?utf-8?B?RkVONS9raUdwWUZMZnZuMkRDSCtiQU13bjB6UjVZRHNrbGFGOXBzd3ExenpY?=
 =?utf-8?B?cXNnQ2xMTHJnUzVNRmZRSWxiZUZ6ZkVCbTNuVU1qMndwR25tVHJOMlJFdnVJ?=
 =?utf-8?B?YjlMSVdsbjB0bmZjajVXZzBZaW53cktQZzd1aHlnZkFJVTE5T01PZ1BNVm9H?=
 =?utf-8?B?ekpudjhwRGZHRU9sMVYwd1VqQ2FValpzM2loRDgwWWFsMzhhOE9WeEZtTit2?=
 =?utf-8?B?NmMvRXRSbk9ZaWtraEhZd0VFUEF1TGlSeGk0SDZXSjI3b1JQTkk3YjI2NFdn?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: db75c1c7-4934-4df3-73cc-08ddba5abfca
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jul 2025 17:55:08.5443 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7UDN4XncvNwkxljGX5EDzoupU8eZaJNH0ZDCHL6/XpnM8yjckw6P49rnW2lyrrEfIGORSq3fTnlUGqxYLlTCjQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEF62BB3A3
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

On Thu, Jul 03, 2025 at 07:42:25PM +0200, Michal Wajdeczko wrote:
> 
> 
> On 03.07.2025 19:31, Matthew Brost wrote:
> > On Thu, Jul 03, 2025 at 12:30:40AM +0200, Michal Wajdeczko wrote:
> >> Invalidate LMTT immediately after removing VF's LMTT page tables
> >> and clearing root PTE in the LMTT PD to avoid any invalid access
> >> by the hardware (and VF) due to stale data.
> >>
> >> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> >> Cc: Michał Winiarski <michal.winiarski@intel.com>
> >> Cc: Piotr Piórkowski <piotr.piorkowski@intel.com>
> >> ---
> >>  drivers/gpu/drm/xe/xe_device.h              |  4 ++
> >>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c | 35 +++++++++++++
> >>  drivers/gpu/drm/xe/xe_gt_tlb_invalidation.h |  2 +
> >>  drivers/gpu/drm/xe/xe_lmtt.c                | 56 +++++++++++++++++++++
> >>  drivers/gpu/drm/xe/xe_lmtt.h                |  1 +
> >>  5 files changed, 98 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/xe/xe_device.h b/drivers/gpu/drm/xe/xe_device.h
> >> index e4da797a984b..a7acd899aa76 100644
> >> --- a/drivers/gpu/drm/xe/xe_device.h
> >> +++ b/drivers/gpu/drm/xe/xe_device.h
> >> @@ -130,6 +130,10 @@ static inline bool xe_device_uc_enabled(struct xe_device *xe)
> >>  	for ((id__) = 1; (id__) < (xe__)->info.tile_count; (id__)++) \
> >>  		for_each_if((tile__) = &(xe__)->tiles[(id__)])
> >>  
> >> +#define for_each_gt_on_tile(gt__, tile__, id__) \
> >> +	for ((id__) = 0; (id__) < XE_MAX_GT_PER_TILE; (id__)++) \
> >> +		for_each_if((gt__) = xe_tile_get_gt((tile__), (id__)))
> >> +
> >>  /*
> >>   * FIXME: This only works for now since multi-tile and standalone media
> >>   * happen to be mutually exclusive.  Future platforms may change this...
> >> diff --git a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> index 6088df8e159c..4fdd5b300265 100644
> >> --- a/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> +++ b/drivers/gpu/drm/xe/xe_gt_tlb_invalidation.c
> >> @@ -330,6 +330,41 @@ int xe_gt_tlb_invalidation_ggtt(struct xe_gt *gt)
> >>  	return 0;
> >>  }
> >>  
> >> +static int send_tlb_invalidation_all(struct xe_gt *gt,
> >> +				     struct xe_gt_tlb_invalidation_fence *fence)
> >> +{
> >> +	u32 action[] = {
> >> +		XE_GUC_ACTION_TLB_INVALIDATION_ALL,
> >> +		0,  /* seqno, replaced in send_tlb_invalidation */
> >> +		MAKE_INVAL_OP(XE_GUC_TLB_INVAL_FULL),
> >> +	};
> >> +
> >> +	return send_tlb_invalidation(&gt->uc.guc, fence, action, ARRAY_SIZE(action));
> >> +}
> >> +
> >> +/**
> >> + * xe_gt_tlb_invalidation_all_async - Invalidate all TLBs across PF and all VFs.
> >> + * @gt: the &xe_gt structure
> >> + * @fence: the &xe_gt_tlb_invalidation_fence to be signaled on completion
> >> + *
> >> + * Send a request to invalidate all TLBs across PF and all VFs.
> >> + *
> >> + * Return: 0 on success, negative error code on error
> >> + */
> >> +int xe_gt_tlb_invalidation_all_async(struct xe_gt *gt,
> >> +				     struct xe_gt_tlb_invalidation_fence *fence)
> > 
> > I'd drop _async part of the naming as I think it is implied with the
> > fence argument that is this async, like xe_gt_tlb_invalidation_range.
> 
> this suffix is here because initially I was also having this variant:
> 
> 	int xe_gt_tlb_invalidation_all(struct xe_gt *gt);
> 
> which actually was waiting for the TLB fence inside - like it is done in
> the xe_gt_tlb_invalidation_ggtt() - but finally dropped it from this
> patch as not used in current code
> 

Ok, makes sense. If you need xe_gt_tlb_invalidation_all to be sync, I'd
suggest passing in a NULL fence, then have xe_gt_tlb_invalidation_all
initialize a fence on the stack + wait on it.

> > 
> > All the changes around GT TLB invalidations look correct (for now, this
> > whole layer needs rework).
> 
> yes, please ;)

I took pass at it while back, I thought other were going to pick this
up though. Will check on this.

Matt 

> 
> > 
> > Matt 
> > 
