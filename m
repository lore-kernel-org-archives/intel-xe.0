Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2B57CD98C7
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 23:51:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F45810E25E;
	Wed, 10 Jun 2026 23:51:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="F0OT3CLn";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A24FA10E25E
 for <intel-xe@lists.freedesktop.org>; Wed, 10 Jun 2026 23:51:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1781135471; x=1812671471;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=CFed8Rg5Nd0bxFO1LNrMKYq702DXntReBhn8Pn1c2fo=;
 b=F0OT3CLnFnIQvKyO/1MX/DKFMmgHcQshumkZS0QXGu51OU0GGPanv+zH
 MvX/K6h2diCqJoMv3k9j5F7Fn9mBtkugLgcrGmMhcAOAIZ3H3NDEU/Icv
 fvQdbDu14cXS7djrQdETXOvu59MVDld1K71ATf4KDJjWsM9sjrwrttV+Q
 0ZGF3+ruxQ28Qfej5UZTEbfkLPkLIhLbw+lfs6cfsGPhn/mQWW7Gh/zEe
 K8v8Z8p+MiMygeLTnQI/VFITGz0dCiXG+aALmhHyMF8Oksg59PAAwd8LT
 95Qq3OmywAQWHuHlDK93baT4rsm2UwIIL3rLUo227Y8W1MEvNRnPYPdqn w==;
X-CSE-ConnectionGUID: e0IjJVVRQ2Og4HG5Fn05cQ==
X-CSE-MsgGUID: PGXdj9B2TNu3V6P+Xany4g==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="81686012"
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="81686012"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 16:51:11 -0700
X-CSE-ConnectionGUID: hOlOsCKmSauENOjJwtG8vA==
X-CSE-MsgGUID: PCDSEC8rSJO8n5lv99VOsw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,197,1774335600"; d="scan'208";a="246390734"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Jun 2026 16:51:10 -0700
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 16:51:09 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37 via Frontend Transport; Wed, 10 Jun 2026 16:51:09 -0700
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.53) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.37; Wed, 10 Jun 2026 16:51:09 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hBcRu95FbIgL60ZgTSi9NtxvFJZYAetF+cDielt3pLToSvppw8FBBrT/f04dAx10FKNDsu3lQ/21h67obZdID/BJrYwRYZsKcJWUtF9wfDZGcm5T0Zk5jsQmjnzArSUrLPSLpnP39Efzl2e+LXgEg2IHrcmvvti9OK9fhTME3RBpghsmia2KpCZPT7EzJXVqbH/vTZY0XGDyRIbcHds0Sl9rAxLASyXTNnqaYM9ICHLxG+luuryPNxaPPJBYFJE1oY1Y11DgoE7J6nwTdMoBmXnwJygCBEpku1iR4ARQb7L09n4ztOGxYfESg/rO/w2ixwjwXUmGb6hAiDIjuhoffA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=98SLpA89t9fXjLIL+OitR0J1e078BSIqjwUHxXC0eQc=;
 b=BS9Vtrp1RZ9HSn5ksmRxbwH7k2P1UafUyx9ZbCNdDxslkPJAyc324Xh4SwiTgSBUofZdPieO+0hFkED6u/4Ys3+uNDrQC6YFyefCwK/8JzNAVH4A+A/LXtgWztWvgNUlbPrGKFsgiHgauJX2hPsTN8V1paksbn8XZOpOJTR85UMnPYv7X75Vox/W9uE2Sr0ACwZZaFBd1cyuoroRwoIGwJ0+uqqrfJhDkIuhRrvGIjTddwrWhgwSsgs9mRCSvI4Rc1nHqJ0o6AXv1IAyp66m3mXyksZI00S7B/XInV+bC4mG9w44UV4kDCAF/gRRZ5R107fPxJZwFghbnAf6WKJzUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by SJ5PPF44E8B88DF.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::825) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.11; Wed, 10 Jun
 2026 23:51:07 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::e0c5:6cd8:6e67:dc0c%4]) with mapi id 15.21.0092.011; Wed, 10 Jun 2026
 23:51:07 +0000
Date: Wed, 10 Jun 2026 16:51:04 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Stuart Summers <stuart.summers@intel.com>
CC: <michal.wajdeczko@intel.com>, <ilia.levi@intel.com>, <x.wang@intel.com>,
 <rodrigo.vivi@intel.com>, <intel-xe@lists.freedesktop.org>,
 <alan.previn.teres.alexis@intel.com>
Subject: Re: [PATCH 00/11] Enable per exec queue MSI-X vector assignment
Message-ID: <ain4aHd9KLMh+2Fd@gsse-cloud1.jf.intel.com>
References: <20260610212833.153366-13-stuart.summers@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260610212833.153366-13-stuart.summers@intel.com>
X-ClientProxiedBy: MW4PR04CA0270.namprd04.prod.outlook.com
 (2603:10b6:303:88::35) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|SJ5PPF44E8B88DF:EE_
X-MS-Office365-Filtering-Correlation-Id: 87882cb1-b80c-4bae-aad2-08dec74b23ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|23010399003|6133799003|18002099003|22082099003|11063799006|56012099006;
X-Microsoft-Antispam-Message-Info: B0Oei892+r9gqMWyB0zuFln/tTGDqhIxa3ogaddYPjfhucGkUhnwRRXNs+atVVTp28nwUI0Ms9M4HFJ+xmsRU3hAkRYoeamyltD84TQhjc1sBbe2Yt5BRaam+W3zrF4CIB7JHPIuCN+XnYX9VMoWUEwagl1uqaUcBxw+SUQXHSSyljzF6M7DrIgwBY48PlhaGfNT+q6Q1/jbmgtWk2Lf4SuS2+wmGh59cJOPV6WMsxwYm5Ov4Wj4tZainkO/ko+rEEADn5gnPGQg+O5tCOeJM2il4Oe0d56Mh8hhXofsuNHZ5rsRjiVkhdX9BbaUCwQoNZeX4U90SamIy/TkLfZUcMXiD+CEK30z6V49ic8lX1gVXcl+bTaIxA9tbiwBcYlGEDd4CmLshLTWSwLTNko3sJRyB76bypXbhxI1ginsaMBApmYfNq0CUfeVmV5kb3KKUncJlm1eXREwestAZX2AlbNR6i+Wh3oZ8IeDBs5QiWVlp1fnyrxH95vZnj2iCnTi5AOc7FtKD7Eb4uk+gefQ3SgmEXRAii+6T1yMiXmTkan2GD5cvXZ24/a2Z0B2K5BAyHH1OnQKWI/vFL8Wq9oU32R8vX/tFWYGd5APhiBXRs8qEiseaABrRwb6aYmzU9vRoQJk8+5t6vH/Cz9eV5+dT2EBA56M1kmoNxD/fFRIVwb9FsAFtIluO6UTH5tsP+T9
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(23010399003)(6133799003)(18002099003)(22082099003)(11063799006)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eXV5RCtId0Qxc2JyQ0xpWjA4MjI5STdhTHBEZTJZNlh6dFlqYllOb3lscTBr?=
 =?utf-8?B?cmJRRUtZNy9lanlvSmRMUkJ5WEVjTUh3U1pxRk1ManRZd1dGVnhPbEp3WmxO?=
 =?utf-8?B?UDNvTjBUNlNGUHJxU3BXVGoyVFRZUzhaVlkrTkpUM1V2S3A4RUxDWnFlSXhS?=
 =?utf-8?B?cUIybVg5WkVUUTlhL3hTT1M4ak5FUnZ6Z3d6VHNPNk1BbHltc2tFNGcxUDZx?=
 =?utf-8?B?WWcrVi81NllVYWVMTUVkb1o0aE45ampBNDZPbkVjTVV4aHdER1Q4NGJNYXJ2?=
 =?utf-8?B?b01BWjBNdEN3WHpWZVB1OVBjaGZZeDJwVFVmaTd0SkNjVDFKQlFCbmkyYXJr?=
 =?utf-8?B?TG95Vk9nQ0RUcGlKZEhnbElFVGY1MEZJWEV1MGtRRVRQZGhxQWh6ZEV0YjNt?=
 =?utf-8?B?UCt6ZUpMT1lhL0d4V2Q3dXc5YWlHQjI0NGtMN0tGRTJIMUdxMDZlVGNNMmJI?=
 =?utf-8?B?eHNnT0FVZmt1T056d3EzSFFCSE9BV2d6Y0t6TTdlNEV3L3NieUx2UFU0RWlj?=
 =?utf-8?B?N3pnK0s3cUlBeXVWNHZKUnJzbnJaTDRXd3paTUl0VkhSUGkwMTFOWThyVEE4?=
 =?utf-8?B?T1BrUkVEa2tsYlB6ajdMMFNqZi9oK0tHNnM2N2I4bExoOWk1bUxzc2dtMTVG?=
 =?utf-8?B?c0RVSXAwakErcUJod2djQnZHZFdEek91aVlPbnJ5aWdCUWQySDlla281a2pZ?=
 =?utf-8?B?OHJRZnhsVVUzT3BZZ0tSR0lyZnRrZlV2RjZ4c05ydm82elcyUnU4UFg1enFh?=
 =?utf-8?B?SVZBcTFUd2RtTFJsb1kyY0wwY2lYNjhRVnlyd3lFdmdCb01WSVg2UXZNRHpQ?=
 =?utf-8?B?Q1lDd0o3Z0o4ZEYwUVh1RkRFMlVBc0x2YkJ0WDhBbFN3aExBKzc0WjNSS3lZ?=
 =?utf-8?B?Zlhhb2Z0TDRCcERaNllZWU9UZHZEcmVWbUxEejFCa0FGOGl0OXJMUkp4WFRt?=
 =?utf-8?B?NWVMZExZRFRvZFQ2Ny9TWWdRVm1Yb1RwM1Yva1poMjB4REUzbnorSlpnY1U4?=
 =?utf-8?B?Mlo1WVExVm4rVHdYSWpxSkwyakJaeVFxQ2x5QVh4Z2JaK3ZwcGhpTThxdjZQ?=
 =?utf-8?B?bVQycVZ5ZVNvT01WMWVKRW9SQlJXMUdBMXhIeUVLWGQwa2Q3NFVvamoxc0hE?=
 =?utf-8?B?SGNqbTJ4QkJOaFJxT2xEQ01zczA5aUV1TjFXNzBMMisvdnJyUkVsTTlLOGxH?=
 =?utf-8?B?NkcyMFd6SXZqcEg5NjcycHR0TndNT0pJZmRpUTFnakhHREFielNJOThKa1F1?=
 =?utf-8?B?NWlpNjJvczN1YjAvd1RjTTNrelhRcEg1QTZQQVBOQzlXcTZXTDcrNlFpdUh6?=
 =?utf-8?B?U1BYRnQ5eDFzaW1JcU1NcGMydHUvU3JSTjBIQXFkTEplTXVoWjVrcXpmSUN2?=
 =?utf-8?B?TXJTZlR0aVdDaGpSZUhzVUdqMENpMHZrUXE1VDJIM0J1SzNpNHFLQnJhNStj?=
 =?utf-8?B?TmhhekhaaUhLdEUxM29wazQyRXR2MHI2UDJNZUthN2t4L1QzYUZScmh2OHVw?=
 =?utf-8?B?bTh0RVl6NGYzS29aVHRxRUFpbCtRdURBRkNhK1BIYnhHV2lXSmlyd1FxZ2w5?=
 =?utf-8?B?RE9rL1ZYVndQemFxZDZrT3RuNmE0ZmhXSFp1cCtOc2pRVmlDSXZWcXY5ZkVK?=
 =?utf-8?B?cmxpaklKS2Q1ckErMmFBaGgxM292ek8zcGZqSjBaVzVzWEtDN1pWTDNQQ2Qx?=
 =?utf-8?B?eG9ya25NK3MxYmxHcjh6TXd1YU1CRCtlM2grTjZhMnEvNFg5UkNqREtNSmRW?=
 =?utf-8?B?NThGQUxDbGxpNzJNWHRGbjJUeE5SMS9HMlpWS25scVdjOGs4QWtxMUY0OGlq?=
 =?utf-8?B?K2d4ZUtnM1pBTWNvd3pjSGVuUzlGZW5ZeDhSVldWWFZlcXYxYU4zVmd1SmN1?=
 =?utf-8?B?cm5qU0FEMVRzTHQreTVyZ2kvY2xmU094ZE1sNWdSVmlSbTh3K1M0ZUZWam9K?=
 =?utf-8?B?VU1ST1gyc2sxeG11aExKZFVuQ3FxemNSUEZmaXNCZFpvdkVTQW84VGk5Skoy?=
 =?utf-8?B?blpXVWtoSXlKUnZxQU9WL2doSkNyckVCRWxCVzZNdjBJWmZQWVNTMFloSVlp?=
 =?utf-8?B?RlNKMDdlM0RDVmgzSHlWQ0xQVGs0Y0ZmSDRmSS9iWFI1MGg2czRhL1FKOTBx?=
 =?utf-8?B?S3NKT3BEMmhGZ1paaWFNTzFHMDVGc2ppMUFPWEZnU2VRMFF1dGJqQXBUN001?=
 =?utf-8?B?am5FVDg5QlVTUVcvcXlVa2xQU3RCNnpUS2JpUkhPQU5HZ1h3c282RjRpanA1?=
 =?utf-8?B?cXhRTUk2MUlhNDlYSFR6UGFYS21EUytiMnJGeXJXaVNhbXZkSkhrZU95MmUx?=
 =?utf-8?B?WmxoQWw4cXUwaWZqRUJpdDlWeTNUWm1NL0p1S1FsQXRnVkZPSUt6SGlUV2l3?=
 =?utf-8?Q?TnJPEF7ar5ETEM+A=3D?=
X-Exchange-RoutingPolicyChecked: siAB1/5y3b07+Aeah69xn9YgE/b1VEun7w+96ToARURpWGvsr2yLL+6yZuvTHDWeo165QLnHlrrPaJbH0tT/Jyu+tkKQnDHfyYGkvyJtrykhmcswAzgMQocaZ/wEUSaDL2hcTWdhy/aLxNDiJ0gUen4c1Rg6NXITJGCp+Z/W/BtLwq/rfXSKX1uVU0VIllle4oWUwcjYVk2oIBydC6ANxMztrdiJrXPj1hdI8JBVyb0u/ff6hYqWMxwwJhZDhUl9OFE4hd6mrkJmQcXStRZSGPq5ZGRRW3kOliTCYAlRGvkKSGoW94K20AOyt+TyvawrJ0/REL1fIz7vp1EAzZYRbA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 87882cb1-b80c-4bae-aad2-08dec74b23ab
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jun 2026 23:51:06.9627 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UbfkftWwyGKqakxTV7IsJSXRYlYk/qLpRq8fVtbo7biMelwg1vkembJggMouGoiKH2dBYDocoOPXg9GmpU0DdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF44E8B88DF
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

On Wed, Jun 10, 2026 at 09:28:32PM +0000, Stuart Summers wrote:
> This series adds support for per exec queue MSI-X vector
> assignment as well as a per exec queue wait queue in the

There’s another improvement we should consider once we have MSIX per
queue: assigning a unique xe_hw_fence_irq to each queue with a valid
MSIX vector. In the MSIX IRQ handler, we could map from the vector to q
and only trigger that queue’s xe_hw_fence_irq.

This should reduce IRQ overhead, as we would walk the individual queue’s
list of pending jobs/fences rather than all pending jobs/fences within
an engine class. We could also introduce a variant of
hw_fence_irq_run_cb for MSIX that immediately bails when it encounters
an unsignaled fence, since the list in xe_hw_fence_irq would now signal
in order.

This can be done as a follow-up, but it should provide a significant win
in certain cases.

Matt

> wait user fence ioctl. MSI-X vectors are dynamically assigned
> during exec queue creation up to a set maximum. Once the max
> is reached, everything else falls back to the default vector.

> 
> These dynamic vectors allow us to wake up a targeted wait
> queue and user thread instead of broadcasting out to all
> potential user threads like we're doing today. This is interesting
> when we have many user threads outstanding as we don't want
> to wake them up in a storm for each interrupt coming in.
> 
> Additionally, there have been changes in the memirq code lately
> to isolate some of the interrupts handled here. Starting with
> xe3p, however, we have new interrupts available for compute walker
> post sync interrupts. Currently these are enabled for legacy MSI
> use cases, but the bits are also available for MSI-X. Enable
> those bits here.
> 
> v2: Drop the drm_dbg change patch
>     Directly call xe_hw_engine_handle_irq() from xe_memirq_hwe_handler()
>     Only add to ufence_list for user queues
> 
> Stuart Summers (11):
>   drm/xe: Add kerneldoc to xe_wait_user_fence_ioctl()
>   drm/xe: Handle NULL in xe_exec_queue_get_unless_zero()
>   drm/xe: Cap MSI-X vector count to XE_MSIX_MAX_VECS
>   drm/xe: Assign dedicated MSI-X vectors to exec queues
>   drm/xe: Add configfs max_msix_vecs attribute
>   drm/xe: Remove memirq status and source checks for engine interrupts
>   drm/xe: Add per-exec-queue user fence wait queue
>   drm/xe: Track all exec queues in a device-level ufence list
>   drm/xe: Hook up per queue thread wake to the unique MSI-X vector
>     allocation
>   drm/xe: Enable per-queue ufence wake in ioctl and wake function
>   drm/xe/memirq: Enable compute walker post-sync interrupt
> 
>  drivers/gpu/drm/xe/regs/xe_lrc_layout.h  |  3 +
>  drivers/gpu/drm/xe/xe_configfs.c         | 71 ++++++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_configfs.h         |  6 ++
>  drivers/gpu/drm/xe/xe_device.c           |  2 +
>  drivers/gpu/drm/xe/xe_device_types.h     | 11 ++++
>  drivers/gpu/drm/xe/xe_exec_queue.c       | 51 ++++++++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.h       |  2 +-
>  drivers/gpu/drm/xe/xe_exec_queue_types.h |  6 ++
>  drivers/gpu/drm/xe/xe_guc_submit.c       |  6 +-
>  drivers/gpu/drm/xe/xe_hw_engine.c        |  6 +-
>  drivers/gpu/drm/xe/xe_hw_engine.h        |  3 +-
>  drivers/gpu/drm/xe/xe_irq.c              | 36 ++++++++++--
>  drivers/gpu/drm/xe/xe_irq.h              |  9 +++
>  drivers/gpu/drm/xe/xe_lrc.c              | 15 ++++-
>  drivers/gpu/drm/xe/xe_memirq.c           | 59 +++++++++-----------
>  drivers/gpu/drm/xe/xe_memirq.h           |  4 +-
>  drivers/gpu/drm/xe/xe_sync.c             |  3 +-
>  drivers/gpu/drm/xe/xe_wait_user_fence.c  | 64 ++++++++++++++++++++-
>  drivers/gpu/drm/xe/xe_wait_user_fence.h  |  4 ++
>  19 files changed, 310 insertions(+), 51 deletions(-)
> 
> -- 
> 2.43.0
> 
