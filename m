Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA308CF45CB
	for <intel-xe@archiver.kernel.org>; Tue, 13 Jan 2026 01:36:20 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB79B10E2E0;
	Tue, 13 Jan 2026 01:36:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="KHYL0Lxb";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFC5210E2E0
 for <intel-xe@lists.freedesktop.org>; Tue, 13 Jan 2026 01:36:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1768268179; x=1799804179;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BdDzWvNC1sLSu4fI2rb3iZfOuf0CZfz4N44oIldSHE8=;
 b=KHYL0Lxb1lEXJ0ZJMd78jDlw36Iu2pGz8icjw4H9TkaNhvY+MX6C7D4H
 DH0XhvXyPfqRoaZ7dl9ReXsDeFsAdl7GLD6wTjsfOF4KaWPN1apQ3aSHG
 pEWoAs2pjbpTAXKXVf7XPmahycNVitI+A0jh9h1Sm1rIPK7df58NzT08Q
 oKZb0PqAn4AxE41/JKE5Fk8QKQk8iJ3s2QABwSZB332tJEBE4ip0ibf12
 dy8BbRbTTiEvUezuqlLaH/85FkSOC9ptnXdo79OFbWdyakgvXWQLUgsX/
 pb1YaUYgL4IdUhHRtWtNHi08yTUEPar8z6gcYzVTVjSdgl4Q13BdFd5gy A==;
X-CSE-ConnectionGUID: QPEWsMofRiehkrrqqqPwFQ==
X-CSE-MsgGUID: e5I/Ev3qSnSEZdNRXzqtsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11669"; a="73401815"
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="73401815"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by fmvoesa106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:36:18 -0800
X-CSE-ConnectionGUID: 17O46gXDR5S6RvNJTRDopQ==
X-CSE-MsgGUID: PaLB7N+QQvesF64aM0f0YQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,222,1763452800"; d="scan'208";a="203407732"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 12 Jan 2026 17:36:18 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:36:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29 via Frontend Transport; Mon, 12 Jan 2026 17:36:17 -0800
Received: from BL2PR02CU003.outbound.protection.outlook.com (52.101.52.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 12 Jan 2026 17:36:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BiGwdVZhRNZyGEhXy1Njm2ax7E6HPRs8qJnx8uBi6mXugY63iKvc6JjVnHTdI7GHWsCO31Cad3EfNbZvUon4G17SbCfFAdgMWCvrX3eKH6UmH374wbflDFGSC1j1M/XWty6iKhNFfwXp1fXp2iaa8vzbYW5FPJUJ/+wKRoS5jmijb84wO0S/douuhDDFKfG93mWlA5ZeXQyN8KYD5dCESxKHTUReKfGxQMOUHz+KlJLIe37Kb1tP17/gxWFU5ZnPFcK0Q1a1qDJQEZZoKd+BFqHA//uRiaAueQQ9yi8qD6ppTAX0MKE2cbT39dsZr6KraJd+qE6b2kvIFwjwXdTC2Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ojH0vHl84bjotpv2JuiiQJkMXMJ0AJy7022HdD5qBWQ=;
 b=LUTauT8OjmfUz6VNMT2tg7tMYje4guX9P2KK+9KNdYyD45L9T3yBKa/eq9TXM+sQvKmZH9/zXf5ZSZrfRF/mXgOXr4ovL02Vl0OcL5LT0C5JQwXQZJQnQmJeYQnDvwI3KMrVQo2YZ2bZbGzDKwm0nhNwwcixgzv6NMovRhoxRuFDEpMQHR2rU887sp1L0fNuppgGZaQhH1AvaGM7U/xxz1obqB6qiLeuWmo46t1TmlNL09Z/DJuoQYRyOXxePSoXlelVEsPuDArnbv7/rbdbC/5MP7iMiJ3pRUFPNVhSlX4qNDHXO0g4QfPmrwpYNL6RrG9JiN1wB1FPBVqqpUib4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH7PR11MB6522.namprd11.prod.outlook.com (2603:10b6:510:212::12)
 by BN9PR11MB5244.namprd11.prod.outlook.com (2603:10b6:408:135::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 01:36:08 +0000
Received: from PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332]) by PH7PR11MB6522.namprd11.prod.outlook.com
 ([fe80::9e94:e21f:e11a:332%7]) with mapi id 15.20.9456.015; Tue, 13 Jan 2026
 01:36:08 +0000
Date: Mon, 12 Jan 2026 17:36:06 -0800
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v3 03/11] drm/xe: Add xe_device_asid_to_vm helper
Message-ID: <aWWhhv2+2st9rNZv@lstrano-desk.jf.intel.com>
References: <20260112232730.3347414-1-matthew.brost@intel.com>
 <20260112232730.3347414-4-matthew.brost@intel.com>
 <5385a9ad207c537ad15e47af735bd714fdae78cd.camel@intel.com>
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <5385a9ad207c537ad15e47af735bd714fdae78cd.camel@intel.com>
X-ClientProxiedBy: BY1P220CA0009.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:59d::7) To PH7PR11MB6522.namprd11.prod.outlook.com
 (2603:10b6:510:212::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH7PR11MB6522:EE_|BN9PR11MB5244:EE_
X-MS-Office365-Filtering-Correlation-Id: bed9f527-aaf2-46ee-fdb0-08de5244200c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?iso-8859-1?Q?y3hOih4j4mdQAvonVmqAx+53/9xZu5bYpq1/iqV9D9njy6u1TbK44EzAeG?=
 =?iso-8859-1?Q?xdf7CM4ZYanHLdbXCthDmdPz1EGFKdpfDQ4Fzpvj9R8U95FcWYeDuOTk+H?=
 =?iso-8859-1?Q?Coz/aPLFX/sgs7V0hAYK92k0obe6LbhTCkdz/dM9/LrSMbup418+25a2Qh?=
 =?iso-8859-1?Q?CauuG8oDlFK3enlDfjUVqcKcqqyDTH0FMGI83HON0BXXeQtH/ne+TaL56r?=
 =?iso-8859-1?Q?5eSYAIl/aSQBHxFPQkajlnliMWnZ/vDo+msEBAPKUqtPSw6G0wI4vS1IFd?=
 =?iso-8859-1?Q?wD7WvfigIx9EmwWykQcWHRk3yIou8PU9i1NFjOX7TpNxAzEaa4D5rcneyc?=
 =?iso-8859-1?Q?lGc5vJl9P6DZ2RvJTUzffP+S2BrDUnuBQTz19J1BHfTEz4h4xXZceeTD7H?=
 =?iso-8859-1?Q?70eIOw2I124XQ1/Y5AG4IvXODVQv6XHE2E0QnuhG7m58egEcWWWoU3VNeG?=
 =?iso-8859-1?Q?/rMD2p9FeVHkWWssA4tsRxHSS6XvM0qYlyc9A25ORiuLSK44d7pXHEtevn?=
 =?iso-8859-1?Q?W4hPLzMU31MObcBG6MVzqkRSejftARdRlAt0DLaeFgX8xV3bRgC+j2QX+q?=
 =?iso-8859-1?Q?a4fFAPj/fG5+t8DKyPIBK0U45TNomYUH0WC4WEuaH5KiX1MlVQOQ0LFlTT?=
 =?iso-8859-1?Q?8FAg1XHy0IGn/3X0mDtvhF7Kkoy7Hz2WxrkRff7TY2bvmhGoeBJR2+gI+v?=
 =?iso-8859-1?Q?U75aU29RjRVeNjOysajKDrmeTU0Jn/oZ4mKrHPP4yDsNLYNlH32FJN5QBb?=
 =?iso-8859-1?Q?iauHICjJpto34KAClu283zK4ZqGH2RKreVC+j3vH/FAp3fDPSyDZ17KE1l?=
 =?iso-8859-1?Q?KWPS4oru6YyHUP1M0cFgaLLJIz/P/n/T3wZ+C5j5T2FusdjIgljwWVzcZr?=
 =?iso-8859-1?Q?eD+uWl9HKcAaPbmI0HoBsItJY9WINa/zb6RMW9kL0p7Xks23ACYDGsAzXg?=
 =?iso-8859-1?Q?iWZliFq7PIXJVfz8so7YGhV6L/M/WAVyyZs2rR2yz/pIp2IHJQ7/CbCMVV?=
 =?iso-8859-1?Q?/gngeMpKTV584tYikyDNV6AlXvCqRAofKcss/f2Ae07nMo63HJf9smVyFi?=
 =?iso-8859-1?Q?gHKsHOH+w+1zUv+rhum7wjxSwtnBenY3/AcocPYuC0wbNGcv4Q8j/wz0wk?=
 =?iso-8859-1?Q?MqWl5++i3rB9/G8cxo1xZZkKTuvXgnoiTtgl8L5IT8hLLTXtgTanbAhOvD?=
 =?iso-8859-1?Q?RcNIoWj0oK3XrlJ7W80AAdVU9wNGWTKamvVOAFSn6crehArZ3Q7VzkEGKH?=
 =?iso-8859-1?Q?zMb2VkwdxPiab78/CyyPdMmvWRivPW5Q6XPF265NlGXjx6BsIR649ZY6ID?=
 =?iso-8859-1?Q?DLjuhdYYqKSSWEBm8P4VUJDsKNJpZlMt4vzq0KUIaHRARiJH4oWjhyzOLj?=
 =?iso-8859-1?Q?2HNnonf0WekE6gjv3/Y484shMzSDGa9Snbzk1ZgLjUcO7BxBab6p8gTe0U?=
 =?iso-8859-1?Q?RWwUZo8lScJ6SS7Id3KqEdrw04DCnYXSk+RYfme/6vEu29t+QDmb+eQLOr?=
 =?iso-8859-1?Q?VHuTNsQjrslA904lfowk/Z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR11MB6522.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?iso-8859-1?Q?xoplCHBpn0tqWDg4/n7Z7BJHMa11PW6lEA6U6QDrLtVIEaJVU1UQ3sw4if?=
 =?iso-8859-1?Q?oTLL+FKMkjMHYti95+kll1SmT7vNl4+gRf7iVNIudKmRNCJ/3OKNogqbpy?=
 =?iso-8859-1?Q?URJOkeuNqzJVcJGgqe4x7aLEvHzffcRmc8Zv8yWrjGYKktN1w4nBqmRNv5?=
 =?iso-8859-1?Q?cO6E6jladstd9EGE01itiMMhMW/2DIpdnZ6YPtEMuDpoG7EKoNtPLymBkB?=
 =?iso-8859-1?Q?6I85yqw9kCJsuKezJKHtMwzdkA0Sf9XVVFwO67bVQ61yVB8XqjuL17qmH7?=
 =?iso-8859-1?Q?OVdczurl4sNy2nhTxSwBEfCNWEmU/ZY36f2eOaITA/F4je7wo5q9cOeC1Z?=
 =?iso-8859-1?Q?SXHyLsDx31HcAXa4i5qLyOr3a7m3lawI3Jks8hxPqLiEUTEEQN2avQ7Hjm?=
 =?iso-8859-1?Q?YYCYr2A7FG5muIDAn1DDHXrO22XMmqoWi/14XMr9IAJVam8WQARZ8QRF08?=
 =?iso-8859-1?Q?rFNYB5j9JPQxrdEjCUjRqEytE8KAkiAACRUDXoLaXLaebuvQMeDi6DRO6R?=
 =?iso-8859-1?Q?qn8H5BzsGI64GBuLOniT+9X8Hfh2Dp2wETC04lR3wBdpfoHMEvbDzr6r/d?=
 =?iso-8859-1?Q?KgIDFfMpQXZlVFqJh2TcA2w2HtRqOBLHBfzz9Y7iEayN0RwHCFStXYAEHa?=
 =?iso-8859-1?Q?CX2V7Ihdhnwf6KF6RW0Zpk9ubYrKeMjhdiZDZOWQwH/2Pwv6iBY1KHykVP?=
 =?iso-8859-1?Q?QR2u4qlKFMv7Q1ixMJfQGS5j4Vdogs5Y18dTXvuwOy6AvyJ7NGZlpC83gb?=
 =?iso-8859-1?Q?e/ISQ0KPsaOIlH1NwBvIH+X31bdf3UA/Kbx2BkxMKPQJLa9Ogc9DF+jW7d?=
 =?iso-8859-1?Q?DXQEbUZUwqWdqTmzvf2cqvUdKMTQibw+gw1SzeUIvCp9u+hrJs5DfTTYvJ?=
 =?iso-8859-1?Q?ac9bByDjPaWcMXftTtVpVKE5HU6uT9V5hY+xtZskJfyeLqlwSB7a9nB1HJ?=
 =?iso-8859-1?Q?vgObSEQ/zNfpYjDEOOoMRgh8pOwNP2hBT7tuvqi37ya1sWzsTlpPu25NDv?=
 =?iso-8859-1?Q?lVYo9xLEzFIxL1eBZUD5euHtJD+RAT68migfKx6Bp7dCprFUlvdsQtNEKM?=
 =?iso-8859-1?Q?aiZmeE8mjufsGnc+q3f9Z4Y2Z2gMuJsmglYa6482LGvwQXJLKDRt9P5jBZ?=
 =?iso-8859-1?Q?jr0pvLU4AikgC36okKXGi0jFWpZN+HCMkhWwyV6Fydg6oBSbnHtrShXFIG?=
 =?iso-8859-1?Q?JbEt3qVmxOmO8o/NtGhkjneABGV5yIYLV5ixdewgjTZaw4ab6xtsSzcB77?=
 =?iso-8859-1?Q?aJ7RfUpxnu+RSpY/PC4X3icWnIYfLEhsRj1azrPMSffm9VaE15ahPDuKIN?=
 =?iso-8859-1?Q?ykJRogBxaMtvlRl0LqdfSZegLdNCdCRMrYrQHpiIgtp+u9/op7sKz2zp0Z?=
 =?iso-8859-1?Q?qTq21zXw1X7gXG1i91wFyXkrl5WFeA8nUSZhLr0PIWRF6ksp3/tCPCr9SP?=
 =?iso-8859-1?Q?rLmaa/A4Bc8ztbTqR+fMMLVSHFPFehSkMpPlZu5n5yUbkIxoLj1Ul8wSZE?=
 =?iso-8859-1?Q?j/CpSYf7aeqpt+kOArqv8aq27ZpbIV1+fByIrCBZCSu/osSJihxaHGNNr3?=
 =?iso-8859-1?Q?eKGiBq+R/GJVt2dRpI40NV636RVPicRT6U+qAaVUdiHuD8gscNSorw+PbS?=
 =?iso-8859-1?Q?w73qAfv4qyQXPFAVuwuvUZ4kAdzgMgCMJd/yG9volIwa7XkvsdYFLfO0El?=
 =?iso-8859-1?Q?LgEXaFdaJ+Ic5hpsklDgFEniv0vvC1rPXI1CmsNqPDTs4DndHKWJuE2FwX?=
 =?iso-8859-1?Q?/Ljp/2XeKVtqnuc/BkKU3btfpg+0RrC1rlP5rmaXXQVTAW3a/6kMAOmU3w?=
 =?iso-8859-1?Q?/077ZuHjt8b8LsginlExI6a6/oCUm/o=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: bed9f527-aaf2-46ee-fdb0-08de5244200c
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB6522.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 01:36:08.3049 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: A2fSX4UaiaVKOeppDwEqk2/FjG5QJOqahfPP/WsOvrgHn/qdnarizW9vdZjA2dymcTzZvV6A/rZXo8axNWtNeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN9PR11MB5244
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

On Mon, Jan 12, 2026 at 06:01:27PM -0700, Summers, Stuart wrote:
> On Mon, 2026-01-12 at 15:27 -0800, Matthew Brost wrote:
> > Introduce the xe_device_asid_to_vm helper, which can be used
> > throughout
> > the driver to resolve the VM from a given ASID.
> > 
> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
> > Reviewed-by: Matt Atwood <matthew.s.atwood@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 25 +++++++++++++++++++++++++
> >  drivers/gpu/drm/xe/xe_device.h |  4 ++++
> >  2 files changed, 29 insertions(+)
> > 
> > diff --git a/drivers/gpu/drm/xe/xe_device.c
> > b/drivers/gpu/drm/xe/xe_device.c
> > index e400ad5c9f9e..445cf6da9dc7 100644
> > --- a/drivers/gpu/drm/xe/xe_device.c
> > +++ b/drivers/gpu/drm/xe/xe_device.c
> > @@ -1417,3 +1417,28 @@ const char *xe_wedged_mode_to_string(enum
> > xe_wedged_mode mode)
> >                 return "<invalid>";
> >         }
> >  }
> > +
> > +/**
> > + * xe_device_asid_to_vm() - Find VM from ASID
> > + * @xe: the &xe_device
> > + * @asid: Address space ID
> > + *
> > + * Find a VM from ASID and take a reference to VM which caller must
> > drop.
> > + * Reclaim safe.
> > + *
> > + * Return: VM on success, ERR_PTR on failure
> > + */
> > +struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid)
> > +{
> > +       struct xe_vm *vm;
> > +
> > +       down_read(&xe->usm.lock);
> > +       vm = xa_load(&xe->usm.asid_to_vm, asid);
> > +       if (vm)
> > +               xe_vm_get(vm);
> > +       else
> > +               vm = ERR_PTR(-EINVAL);
> > +       up_read(&xe->usm.lock);
> > +
> > +       return vm;
> > +}
> > diff --git a/drivers/gpu/drm/xe/xe_device.h
> > b/drivers/gpu/drm/xe/xe_device.h
> > index 3740143790db..10d04c324257 100644
> > --- a/drivers/gpu/drm/xe/xe_device.h
> > +++ b/drivers/gpu/drm/xe/xe_device.h
> > @@ -6,6 +6,8 @@
> >  #ifndef _XE_DEVICE_H_
> >  #define _XE_DEVICE_H_
> >  
> > +struct xe_vm;
> 
> Can you move this down below the include statements below?
> 

Yes, will do.

Matt

> Otherwise:
> Reviewed-by: Stuart Summers <stuart.summers@intel.com>
> 
> Thanks,
> Stuart
> 
> > +
> >  #include <drm/drm_util.h>
> >  
> >  #include "xe_device_types.h"
> > @@ -204,6 +206,8 @@ int xe_is_injection_active(void);
> >  
> >  bool xe_is_xe_file(const struct file *file);
> >  
> > +struct xe_vm *xe_device_asid_to_vm(struct xe_device *xe, u32 asid);
> > +
> >  /*
> >   * Occasionally it is seen that the G2H worker starts running after
> > a delay of more than
> >   * a second even after being queued and activated by the Linux
> > workqueue subsystem. This
> 
