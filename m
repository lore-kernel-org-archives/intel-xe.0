Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCD1BC87FCB
	for <intel-xe@archiver.kernel.org>; Fri,  8 Aug 2025 17:15:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878C010E03A;
	Fri,  8 Aug 2025 17:15:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="gwspdAM/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E41110E03A
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Aug 2025 17:15:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754673301; x=1786209301;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=r/6mQjWxRB+JkU4VBJVnlKKq02Od1oiPYDTb9GAAGiU=;
 b=gwspdAM/LNdSlj15z7XFz9jjZxUm12q3hMP6LxWsc0QPiGLUVRLGUpoZ
 Hx8WWL0LXWCyCA2RoA90aOVbbLtwrHEOSQCOyCnryDM532QBmwL0mP9nf
 cP0EQ34JJnBLn7AQg/sj04zIYvNZlw41GMHT8tyDs2OicsoMPxyxG+rEW
 RhSgTRUuBb3+aBR+133Szz3pTIK4QzEgydCNm8/JJZ8H8Z+IkN3wDtpa2
 5xi/y5En/xFWQmtmn0S8LCrK2vzdEafenCW3y4iaoJUI1NUqcnEI9WJg4
 VpKSi2HA0vD3uTpcFOQwG9hkTaW3ugB+mgoGAaFR0S3BKB966oh1KPbTm w==;
X-CSE-ConnectionGUID: tPiV0/7jRai7geD1pGLNuw==
X-CSE-MsgGUID: hosK9hSHR7y48eXII1Gp9A==
X-IronPort-AV: E=McAfee;i="6800,10657,11515"; a="68108364"
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="68108364"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:15:00 -0700
X-CSE-ConnectionGUID: whgj5E7oSNqRJtqA4IBwPA==
X-CSE-MsgGUID: iY8wrZBmQj2jGlc74hny6w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,274,1747724400"; d="scan'208";a="202557018"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa001.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Aug 2025 10:15:00 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:14:59 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Fri, 8 Aug 2025 10:14:59 -0700
Received: from NAM04-DM6-obe.outbound.protection.outlook.com (40.107.102.86)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Fri, 8 Aug 2025 10:14:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ool1pW3NCUM7jNiIMQkC4saZmZ/bh/jI2MCZ9kUNq0W/xG7abanS1SfV/bxHngdlVSVPC0kfSq0/FFjHsX8HpR6Q1ZhAKTmquvfoRMzwY9a4R2VRXlpcomJ3vyNRTt7Bij7CSgVi60nknx9b0cM9NlGsWOexW2CHOEdgOC/yU+Evt9lZOhDPG/uiRTMRUina81S3OCjeTaLyXDji6CHDK8HRMnzIPxxnoPBgdoL6boMQE7ynQSZIZeIQFGguK86vwRA0nwwJAVJM6PPMXIpxpRvzmUeaM7kczqp3AM4tKfO91+fonMuU6Yj21c27wSase9UvAanEHrOPaGnttAEr1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=H7em0OjBe0kt4xxWx/8EG/UK3qXf94U2oT8ljbtsduw=;
 b=barO5D7EH0kmI5O1ItaekzTI0utZ+wOfybIgAEKLLRPRssTLDWApTa//tMuc4g9zv41AqrZw1b7u/Jt8yAT2WxmUj3TYzdVzlaiGCsqzSOxSjYEeBnnvXdHW6/zn9V78sIg7247fYFYl1SeOKOtQLc5wJAhuumGjzNFCSgoQ4rjb0Y3t7njvq01xuES2DGli2V5ulP7wDy4b8CMPmCwKR3qyOv7Nk5O5CfR18XhqTuKbB++vbQMM0J/YdowoHyJbp9l4slLwZGQj81O3LYBfJylcdF9dn/dJ5qjDxkBfMfY5tef0roQ4NqOV8TPhUqpNg54c6erAZksuizsBteISTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA2PR11MB5065.namprd11.prod.outlook.com (2603:10b6:806:115::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.18; Fri, 8 Aug
 2025 17:14:55 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::1a0f:84e3:d6cd:e51%4]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 17:14:55 +0000
Date: Fri, 8 Aug 2025 10:14:52 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <jeevaka.badrappan@intel.com>
Subject: Re: [PATCH] ANDROID: Add GPU work period support for Xe driver
Message-ID: <aJYwjCeJlwe9lCUw@lstrano-desk.jf.intel.com>
References: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250808090922.3716954-1-aakash.deep.sarkar@intel.com>
X-ClientProxiedBy: MW4P223CA0013.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:303:80::18) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA2PR11MB5065:EE_
X-MS-Office365-Filtering-Correlation-Id: f35dd6e0-cce5-4dca-8d64-08ddd69f1889
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?YXhZclZiMGxqVzRTOUc5aFIrK1VHTXVzT2lHb2ZYb0hBOFJ4c3FTcyt4ci96?=
 =?utf-8?B?eURCQVhGRFJXNTd1UjRkYmF6ekx3bTJrc3VKR1hORW44c1VVSmRsZk1QMlJh?=
 =?utf-8?B?M3owSXlrZkt5bi8wQXltMDFaVEViTGtHcHFYODB2MEt2OWZMa3oxVlhQdm9m?=
 =?utf-8?B?VFd2dDlSN3gxNTdJcEk1SUtRTC9tbStZY3d6L1g0bFgvd2I3TC9CNjMzNUdM?=
 =?utf-8?B?MTVUMXpKclZuNDkzU3gxSGpmK0tjcmRUUC9UcDliMHF3bjh1TTg1bk41Q0hE?=
 =?utf-8?B?Q29HMmFMd0phenU0Z1JNenhWT1RWd3FoN1R4TUVQUEw2cy9RUU9KWXZCakdu?=
 =?utf-8?B?VHRhSTkxRG44OEx3YWljaDlPWWlicHNNOTJTWFl0a2h2K0l4eHRqM2RvZWNP?=
 =?utf-8?B?NVNxTkVEY0NaL1JLeHEwRlZRc042QlNGcDAxTzFiZkZSc3ZqM1hKVUp5TkR0?=
 =?utf-8?B?ZXBVWWhQTDVPMi81UVB3NjAzbm1rSXZ5alpYSUgvemNxUGYvaWZobEdESHFn?=
 =?utf-8?B?Z1ordjJNOXZNcUpqeXNhS3NieWZZSlR3RmU1bnRmdXMyS204MXlMb0d0eG9p?=
 =?utf-8?B?OE04RXg4VEJQQVUya3dqN2VNTjE1U3hLaitVbHZJLzdjUTNmSE9zdDFHNnFN?=
 =?utf-8?B?UVUrbHFhTWdQbjlUOWRrOWtkeGJKeUdYTFVqWjN3LzhUWUluZDQ3aFVZOHdx?=
 =?utf-8?B?RnZIUWZSMERaTXVJd0gwSUJnTnpmLzNLaytpamNkM1kzTmNaNFhJRkhWYnIx?=
 =?utf-8?B?S21GeTNySHIvOTY2TkdjczdHQ2NNVThhZHB4WGNhN1JJRVZ5VDdJdVhsa0RI?=
 =?utf-8?B?cEplbFMyWkhVMkFkRVMwMHRudVYxQVhLWTZ0Tm16NkcwUUVCYkE0Vk9vUzlu?=
 =?utf-8?B?V1ByR0hPbUVpQ0s3RXlBUWpSRmZmUTU3dFpNcXdEOHp4bjhpOU5rSkwxZjYv?=
 =?utf-8?B?MHBvVEhpVnVKdSs1WWdqMVZQWjRyUkpCeTF2NTR4dmtKZWIxd0ZKNjNhL3FU?=
 =?utf-8?B?NHRVMkdoV0RCRStLRnAzVldUVEt2Mzk0NlJtQkRET2FTV1FTSTdRYU9OVUgx?=
 =?utf-8?B?UnVyV3M2d2w3a2xMTzdOTHoxTFFhblVUYUUwT1NIV0xzTmgwa0w2R256aUsv?=
 =?utf-8?B?QjdtdmtNWUI5NWNnMVl0eUp1RXdtS0FUR2U2TkswSzR1dTZDY2k4bXNXUHhz?=
 =?utf-8?B?NlVzVFR2Y0N0OHhJMDlaTWpKNWg0RVNCVFp5dmUyREQ2K3p1SU9pazMzcGh2?=
 =?utf-8?B?QmRIMlZMUlFiZ3BnM1J6MndQa1E0dk53K1RvbnFuMjBxSHRUZ2pPa0R0eTFU?=
 =?utf-8?B?YWlOdmprUmd6bmpqRFpNZ2t0RHZuTlpyODNmS1MvbGN0ZDNnbVN0MzhzMGVD?=
 =?utf-8?B?dU9hRkhldjVTZUZISUh2SzQ4eWg0ZzZlNUs1OENjYkwyQ0pBYmw3RDFWNUZq?=
 =?utf-8?B?WnJuVE9wSmt1eXl0UWV5cmhYMU8xRGN0RHFKZjc4a0h4OFhtZmNudGVOSzBs?=
 =?utf-8?B?YUwyN3FHS0JLdVJoZjhINmRwL1ZKYmREM0N6Vmo1TEVPYmV4RHhneXA3bkZ4?=
 =?utf-8?B?bjNLUy9UWUhIVVRDekdFclMwa2ZmRXR6bmxMTlFHbnQyWXlNS0NSOGE4YzMr?=
 =?utf-8?B?QlVDMjhxR2IrWUxwaDNLK3ZEQW1TQiszSFUwQ3p5S2lGWDNBZ2U0WmU1VXlY?=
 =?utf-8?B?SHE3eFNxOXVjZmt6UmtYNURuVFlqR1N2WUgvaGJ2ekJTa2M1L0wwTmQyT1Rt?=
 =?utf-8?B?a1JFYWpoVE1hS0RTdFdMZUNtU2tiWG1keFBWczJoeFhyK3k5ZG1LRUtzOWto?=
 =?utf-8?B?OTBpaEZCU1ZIbG9WQWNpNndTcUtZb08ySGdhbTlPcjYrclp0Yy9NbHRKK0l2?=
 =?utf-8?B?ZkpqNDk4TjBNaGNTTm5iSzBkajlqNHEwZUVGbkp1N2F1ZVQ0WURuckNBRi90?=
 =?utf-8?Q?znnGqYcctow=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MDI1cklXR2ZKTi9qbVdkZjR5MGF2dytDT3hYMWF0Y0UxeDFxM2lySDF0aEx2?=
 =?utf-8?B?SEhubGtPS1pZMUtBbnpVWG5uQkxoNUgwT3hHZWYwRVBLMnZmdjhCbXRFL2gx?=
 =?utf-8?B?UTdnUUxGV29aK1YwalJPelJEQjNGMVNxNmpCMVpDMTBRVmt2VDJYcUlDTkdR?=
 =?utf-8?B?ZE85ZkFncnJPK3F5Y3F2QytGV3k1M0Rua3BJTlh2VFByejNmVVUvVDZIZC8r?=
 =?utf-8?B?bWtHOVFsOFovYnVLZDlZTXJyMmkxb2ZWKzVLUldUOU42SkUzb25IekZkT3h1?=
 =?utf-8?B?RWpyODdpc2tsRjNySC84bVJMczVMdDZYZUZ0VHZnUmVHOXlGZzJIMVIwemlJ?=
 =?utf-8?B?L0l2cjlCRFlSOHFNRDlxaXVORDVKY296VVlmbVl5V01jUjY5b000VGVwcytR?=
 =?utf-8?B?UENqWXJnUFFPelh0aUE2NWZLT2p2ZHdnZkMydGFFYmtQMXZqOEdkb1VxTzNw?=
 =?utf-8?B?VjFnNDNQaGdBVkE0WDRkdVRVNk5RNXY0MS9lNmZQaHh5clVwakN5SVdpdjBW?=
 =?utf-8?B?Y1YwTEFDNEJBWVlYVVRSNFpmRTIxN3poK3hQdGZZbERhMXZCZ1hacXRNaHRu?=
 =?utf-8?B?dmpndU1FZVI1RytLb2w1SmhqVlRZejFHRW9FZW0zUW1ySGo2NWZ2b01RNTBp?=
 =?utf-8?B?THQxSldsQjFJL2NUWVVJNFRVbEVJYTBORkpLMHlqWm1Ra09Tc1ZRRXRKTk9K?=
 =?utf-8?B?QkU0eW9xajFEVmVCZlUrVjErMERGa09OWDVudkx5cFVVOXQ3TEtwcm83WXhH?=
 =?utf-8?B?OUZSN0pJMGY1SXZvMDRVQmdQcEsrRG1IeU1OWXFOSzJtY3oveUhqZlJjYWZu?=
 =?utf-8?B?OCtYZng4WllGSmViOXNqdWorMzFhREtQeUNPN3VNUTBSWlhBQWpDc1U5dDZs?=
 =?utf-8?B?Nll5dlJyK2thTi9PVlBMVEVKdndvalpHTnlsOFkzYlpaZ0JpM0FHazFKcFps?=
 =?utf-8?B?cGdrU1E2NU43dGROL3FYTjJVc0JyK3hCSDh6VkJnMVRZYnljRm9jcFJsMWpG?=
 =?utf-8?B?RzRZWmovUmZFc1RYL09rRWFaSXhNQnlUZE9meHdiaDBuTERtYU5CWWpKTDJz?=
 =?utf-8?B?WlVXNEgvbFV1ZGZOWHpqNUZwTWRTMmJlaWdrZ2pQa3JCQ01VOXlpWVR0ZGtV?=
 =?utf-8?B?bmlFY3p4T0k0Q25IR1NPOWFxeVdaYnl3RVpacVBabmVNZ3hRalhIcVpEMWlN?=
 =?utf-8?B?NE1UaFJKY29TY2hLZ0hCK0pWaWp3YmdZWFFONnFBRnFJZ1JYMTZRaHQ2U1Rp?=
 =?utf-8?B?T3c3dUJraHh0MllwdTZRWmcrc1lvbFdVSGFHTUpXVjZkTEx1WGh4S3hGeVZB?=
 =?utf-8?B?QVRMcS9lZzQzN2JSS3dFTnRXZ2dOQmZNMWxqTEZRVjlBQVF2dFJncXVKbmRq?=
 =?utf-8?B?cE5qRkN0TGlYdjdXVFlyV01xSWlJd3ZlaXY3d0EyQkRlaG9vSTNhZEo3Um5S?=
 =?utf-8?B?RWtHUkJtVWlHZUtvcnY0S2pCODBFVFhXQjhBMyt0NzRvNEF2WTBiWUF1eGdP?=
 =?utf-8?B?ZUhrcm9sMTh5V0xTRWNlOG9ubkxXb04wVk9va1ZLSXVteUZWVW5rdzJPM09E?=
 =?utf-8?B?UTJBbFprUGMveWFGTm9LbVdIdTZoMUZLSVAxMWc4SHEzZFVlbU1OY05RMEg2?=
 =?utf-8?B?b3poQ2FWU0VqUFhBUU96eDhtUFhCWWpudFZoMmF3c2htU1BNSGhTYVFxQk9J?=
 =?utf-8?B?ZDN3ZzQvbjRhdTAwN0dpTVM3cjlxQUpUeFhDUnh0ZXhxei9WTUdpb3JNZDlV?=
 =?utf-8?B?VnlSNHNaTzNhbGJRMElHWGhGZ3NyTWZ3SzhDazYrRmV4QlE1NU1kR1RPd3R5?=
 =?utf-8?B?QVBLK2dLbWpraUpIMHU0dGNISXJKZ0lrRi9qYXRsNy9tRlVnT1VNdm9UNTRY?=
 =?utf-8?B?Z1h1TVhOOG01dU9DUGhEamdqd0hpdEswZFRaT3V6WDR3bWlMbmJRb01rMjhL?=
 =?utf-8?B?RVBucDdnR2dkTnBhUXY0QUFIMHBLRWVqR2xhcmlRZXN2Yis0NFJYYmhJanVv?=
 =?utf-8?B?Q1BJbzZTN2xhNU9hQXdnQ251Tk5iWmZvUjFqRFNBZ0dlaFNrWmcrQVJQejAv?=
 =?utf-8?B?bmx2MUE3UGtXcXJKcGlWNjE3L2lGRTVySndFalVlNDhiSTIxMG9Ta2JRSzBD?=
 =?utf-8?B?dkoyUXIwS201RFVNVFVueW4yN0lHTmVjalhvNnJiUDJNZm5DOWpjdFNhbXZm?=
 =?utf-8?B?clE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f35dd6e0-cce5-4dca-8d64-08ddd69f1889
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 17:14:55.8111 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 81sWdIbrDBYZNJUgIjTv+9L+xrygERO8335uORJ+XwcOajeojeb6ZafE7hjaZw3N+9ZzTLAuoIsWOAbLKDSO2g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB5065
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

On Fri, Aug 08, 2025 at 09:09:19AM +0000, Aakash Deep Sarkar wrote:
> This patch implements the Android requirement GPU work
> period event for Intel Xe driver.
> 

Since this is an Android requirement, can this feature be disabled on
non-Android builds? Having a worker performing sampling has a non-zero
cost in terms of CPU cycles, plus runtime PM waking the device.

I’m not suggesting compiling out the implementation—just never starting
the sample timer on non-Android builds.

> |GpuWorkPeriodEvent| defines a non-overlapping, non-zero period
> of time from |start_time_ns| (inclusive) until |end_time_ns|
> (exclusive) for a given |uid|, and includes details of how much
> work the GPU was performing for |uid| during the period. When
> GPU work for a given |uid| runs on the GPU, the driver must track
> one or more periods that cover the time where the work was running,
> and emit events soon after.
> 
> Full requirement is defined in the following file:
> https://cs.android.com/android/platform/superproject/main/+\
> /main:frameworks/native/services/gpuservice/gpuwork/bpfprogs/gpuWork.c;l=35
> 
> The requirement is implemented using a timer to give periodic
> interrupts and a worker thread per user id instance to accumulate
> its run time on gpu and emit the event. Each user id instance is
> tracked using a xe_user structure and the runtime is updated at
> each timer interrupt. The timer period is hardcoded to 500 msecs.
> 
> The runtime on the gpu is collected for each xe file individually
> inside the function xe_exec_queue_update_run_ticks() and accumulated
> into the corresponding xe_user active_duration_ns field. The HW
> Context timestamp field in the GTT is used to derive the runtime
> in clock ticks and then converted into nanosecs before updating the
> active duration.
> 
> Signed-off-by: Aakash Deep Sarkar <aakash.deep.sarkar@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_device.c                |  98 +++++++++++++++-
>  drivers/gpu/drm/xe/xe_device_types.h          |  27 +++++
>  drivers/gpu/drm/xe/xe_drm_client.c            | 108 ++++++++++++++++++
>  drivers/gpu/drm/xe/xe_drm_client.h            |  75 +++++++++++-
>  drivers/gpu/drm/xe/xe_exec_queue.c            |   5 +
>  drivers/gpu/drm/xe/xe_gt_clock.c              |   5 +
>  drivers/gpu/drm/xe/xe_gt_clock.h              |   1 +
>  .../drm/xe/xe_power_gpu_work_period_trace.h   |  61 ++++++++++
>  8 files changed, 378 insertions(+), 2 deletions(-)
>  create mode 100644 drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> 
> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
> index 57edbc63da6f..116247007a4d 100644
> --- a/drivers/gpu/drm/xe/xe_device.c
> +++ b/drivers/gpu/drm/xe/xe_device.c
> @@ -8,6 +8,7 @@
>  #include <linux/aperture.h>
>  #include <linux/delay.h>
>  #include <linux/fault-inject.h>
> +#include <linux/jiffies.h>
>  #include <linux/units.h>
>  
>  #include <drm/drm_atomic_helper.h>
> @@ -76,9 +77,13 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  {
>  	struct xe_device *xe = to_xe_device(dev);
>  	struct xe_drm_client *client;
> +	struct xe_user *user;
>  	struct xe_file *xef;
>  	int ret = -ENOMEM;
> +	unsigned long flags;
> +	int uid = -EINVAL;
>  	struct task_struct *task = NULL;
> +	const struct cred *cred = NULL;
>  
>  	xef = kzalloc(sizeof(*xef), GFP_KERNEL);
>  	if (!xef)
> @@ -103,13 +108,66 @@ static int xe_file_open(struct drm_device *dev, struct drm_file *file)
>  	file->driver_priv = xef;
>  	kref_init(&xef->refcount);
>  
> +	INIT_LIST_HEAD(&xef->user_link);
> +
>  	task = get_pid_task(rcu_access_pointer(file->pid), PIDTYPE_PID);
>  	if (task) {
> +		cred = get_task_cred(task);
> +		if (cred) {
> +			uid = (int) cred->euid.val;
> +			put_cred(cred);
> +		}
>  		xef->process_name = kstrdup(task->comm, GFP_KERNEL);
>  		xef->pid = task->pid;
>  		put_task_struct(task);
>  	}
>  
> +	if (uid < 0)
> +		goto out;
> +
> +	/*
> +	 * Check if the calling process/uid has already been registered
> +	 * with the xe device during a previous open call. If so then
> +	 * take a reference to this xe file and add it to the list of xe
> +	 * files belonging to the this user
> +	 */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);

I don't think you need irqsave rather just spin_lock_irq as this code in
always in process context.

> +	list_for_each_entry(user, &xe->work_period.user_list, entry) {
> +		if (user->uid == uid) {
> +			xef->user = xe_user_get(user);
> +			spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +			goto filelist_add;
> +		}
> +	}
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +
> +	/*
> +	 * We couldn't find a xe user for this process. Allocate a new
> +	 * struct xe_user and register it with this xe device
> +	 */
> +	user = xe_user_alloc();
> +	if (!user)
> +		goto out;
> +
> +	user->uid = (unsigned int) uid;
> +	user->last_timestamp_ns = ktime_get_raw_ns();
> +	user->xe = xe;
> +
> +	/* Add this xe_user to xe_device->work_period.user_list */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);
> +	list_add(&user->entry, &xe->work_period.user_list);
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +	drm_dev_get(&xe->drm);
> +	xef->user = user;
> +
> +filelist_add:
> +	/* Add this xe_file to xe_user->filelist */
> +	mutex_lock(&user->filelist_lock);
> +	list_add(&xef->user_link, &user->filelist);
> +	mutex_unlock(&user->filelist_lock);
> +out:
>  	return 0;
>  }
>  
> @@ -124,6 +182,12 @@ static void xe_file_destroy(struct kref *ref)
>  
>  	xe_drm_client_put(xef->client);
>  	kfree(xef->process_name);
> +
> +	mutex_lock(&xef->user->filelist_lock);
> +	list_del(&xef->user_link);
> +	mutex_unlock(&xef->user->filelist_lock);
> +	xe_user_put(xef->user);
> +
>  	kfree(xef);
>  }
>  
> @@ -347,6 +411,23 @@ static int xe_mmap(struct file *filp, struct vm_area_struct *vma)
>  	return drm_gem_mmap(filp, vma);
>  }
>  
> +static void work_period_timer_fn(struct timer_list *timer)
> +{
> +	struct xe_device *xe = container_of(timer, typeof(*xe), work_period.timer);
> +	struct xe_user *user;
> +	unsigned long timeout = 0;
> +
> +	spin_lock(&xe->work_period.lock);
> +	list_for_each_entry(user, &xe->work_period.user_list, entry) {
> +		xe_user_get(user);


I’m pretty sure it’s possible to leak a ref here. If work_period.wq is
already queued, it won’t get queued again.

Beyond that, do you really need a timer here? Could every xe_user just
have a delayed worker that continually queues itself?

Also, the work_period.user_list is a little odd. If you get rid of the
timer and use a delayed worker, I think you could use an xarray, indexed
by uid, to store xe_user and have it remove itself from the xarray when
its refcount goes to zero.

> +		queue_work(xe->work_period.wq, &user->work);
> +	}
> +	spin_unlock(&xe->work_period.lock);
> +	timeout = jiffies + msecs_to_jiffies(500);
> +
> +	mod_timer(timer, timeout);
> +}
> +
>  static const struct file_operations xe_driver_fops = {
>  	.owner = THIS_MODULE,
>  	.open = drm_open,
> @@ -409,6 +490,11 @@ static void xe_device_destroy(struct drm_device *dev, void *dummy)
>  	if (xe->destroy_wq)
>  		destroy_workqueue(xe->destroy_wq);
>  
> +	if (xe->work_period.wq)
> +		destroy_workqueue(xe->work_period.wq);
> +
> +	timer_delete_sync(&xe->work_period.timer);
> +
>  	ttm_device_fini(&xe->ttm);
>  }
>  
> @@ -477,11 +563,21 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
>  
>  	xe->preempt_fence_wq = alloc_ordered_workqueue("xe-preempt-fence-wq",
>  						       WQ_MEM_RECLAIM);
> +
> +	spin_lock_init(&xe->work_period.lock);
> +	INIT_LIST_HEAD(&xe->work_period.user_list);
> +	timer_setup(&xe->work_period.timer, work_period_timer_fn, 0);
> +	xe->work_period.timer.expires = jiffies + msecs_to_jiffies(1000);
> +	add_timer(&xe->work_period.timer);
> +
> +	xe->work_period.wq = alloc_workqueue("xe-work-period-wq", 0, 0);

We are a little overzealous in allocating work queues in Xe. I would
like to reduce the number of WQs in Xe — some are certainly needed, but
others are not. I’d say this usage falls into the “not needed” category;
I believe one of the system_wqs here would work just fine.

> +
>  	xe->ordered_wq = alloc_ordered_workqueue("xe-ordered-wq", 0);
>  	xe->unordered_wq = alloc_workqueue("xe-unordered-wq", 0, 0);
>  	xe->destroy_wq = alloc_workqueue("xe-destroy-wq", 0, 0);
>  	if (!xe->ordered_wq || !xe->unordered_wq ||
> -	    !xe->preempt_fence_wq || !xe->destroy_wq) {
> +	    !xe->preempt_fence_wq || !xe->destroy_wq ||
> +		!xe->work_period.wq) {
>  		/*
>  		 * Cleanup done in xe_device_destroy via
>  		 * drmm_add_action_or_reset register above
> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
> index 01e8fa0d2f9f..32b63b5f1c2e 100644
> --- a/drivers/gpu/drm/xe/xe_device_types.h
> +++ b/drivers/gpu/drm/xe/xe_device_types.h
> @@ -418,6 +418,20 @@ struct xe_device {
>  		} late;
>  	} pinned;
>  
> +	/** @work_period: gpu work period event */
> +	struct {
> +		/** @lock: lock protecting this structure */
> +		spinlock_t lock;
> +		/** @timer: timer to give periodic interrupts to emit the
> +		 * gpu work period event
> +		 */
> +		struct timer_list timer;
> +		/** @user_list: list of xe users using this xe device */
> +		struct list_head user_list;
> +		/** @wq: workqueue for gpu work period event emitting work */
> +		struct workqueue_struct *wq;
> +	} work_period;
> +
>  	/** @ufence_wq: user fence wait queue */
>  	wait_queue_head_t ufence_wq;
>  
> @@ -656,6 +670,9 @@ struct xe_file {
>  	/** @run_ticks: hw engine class run time in ticks for this drm client */
>  	u64 run_ticks[XE_ENGINE_CLASS_MAX];
>  
> +	/** @active_duration_ns: total run time in ns for this xe file */
> +	u64 active_duration_ns;
> +
>  	/** @client: drm client */
>  	struct xe_drm_client *client;
>  
> @@ -671,6 +688,16 @@ struct xe_file {
>  	 */
>  	pid_t pid;
>  
> +	/**
> +	 * @user_link: entry into xe_user.filelist list
> +	 */
> +	struct list_head user_link;
> +
> +	/**
> +	 * @user: pointer to the xe user this xe file belongs to
> +	 */
> +	struct xe_user *user;
> +
>  	/** @refcount: ref count of this xe file */
>  	struct kref refcount;
>  };
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.c b/drivers/gpu/drm/xe/xe_drm_client.c
> index f931ff9b1ec0..7a21d8e83310 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.c
> +++ b/drivers/gpu/drm/xe/xe_drm_client.c
> @@ -5,10 +5,12 @@
>  #include "xe_drm_client.h"
>  
>  #include <drm/drm_print.h>
> +#include <drm/drm_drv.h>
>  #include <uapi/drm/xe_drm.h>
>  #include <linux/kernel.h>
>  #include <linux/slab.h>
>  #include <linux/types.h>
> +#include <linux/spinlock.h>
>  
>  #include "xe_assert.h"
>  #include "xe_bo.h"
> @@ -21,6 +23,9 @@
>  #include "xe_pm.h"
>  #include "xe_trace.h"
>  
> +#define CREATE_TRACE_POINTS
> +#include "xe_power_gpu_work_period_trace.h"
> +
>  /**
>   * DOC: DRM Client usage stats
>   *
> @@ -404,3 +409,106 @@ void xe_drm_client_fdinfo(struct drm_printer *p, struct drm_file *file)
>  	show_run_ticks(p, file);
>  }
>  #endif
> +
> +/**
> + * worker thread to emit gpu work period event for this xe user
> + * @work: work instance for this xe user
> + *
> + * Return: void
> + */
> +static inline void work_period_worker(struct work_struct *work)
> +{
> +	struct xe_user *user = container_of(work, struct xe_user, work);
> +	struct xe_device *xe = user->xe;
> +	struct xe_file *xef;
> +	struct xe_exec_queue *q;
> +	u64 last_active_duration, last_timestamp;
> +	u32 gpuid = 0, uid = user->uid;
> +	u64 start_time, end_time, active_duration;
> +	unsigned long i;
> +
> +	last_active_duration = user->active_duration_ns;
> +	last_timestamp = user->last_timestamp_ns;
> +
> +	xe_pm_runtime_get(xe);
> +
> +	mutex_lock(&user->filelist_lock);
> +	list_for_each_entry(xef, &user->filelist, user_link) {
> +
> +		wait_var_event(&xef->exec_queue.pending_removal,
> +		!atomic_read(&xef->exec_queue.pending_removal));
> +
> +		/* Accumulate all the exec queues from this user */
> +		mutex_lock(&xef->exec_queue.lock);
> +		xa_for_each(&xef->exec_queue.xa, i, q) {
> +			xe_exec_queue_get(q);
> +			mutex_unlock(&xef->exec_queue.lock);
> +
> +			xe_exec_queue_update_run_ticks(q);
> +
> +			mutex_lock(&xef->exec_queue.lock);
> +			xe_exec_queue_put(q);
> +		}
> +		mutex_unlock(&xef->exec_queue.lock);
> +		user->active_duration_ns += xef->active_duration_ns;
> +	}
> +	mutex_unlock(&user->filelist_lock);
> +
> +	xe_pm_runtime_put(xe);
> +
> +	start_time = last_timestamp + 1;
> +	end_time = ktime_get_raw_ns();
> +	active_duration = user->active_duration_ns - last_active_duration;
> +	trace_gpu_work_period(gpuid, uid, start_time, end_time, active_duration);
> +	user->last_timestamp_ns = end_time;
> +
> +	xe_user_put(user);
> +}
> +
> +/**
> + * xe_user_alloc() - Allocate xe user
> + * @void: No arg
> + *
> + * Allocate xe user struct to track activity on the gpu
> + * by the application. Call this API whenever a new app
> + * has opened xe device.
> + *
> + * Return: pointer to user struct or NULL if can't allocate
> + */
> +struct xe_user *xe_user_alloc(void)

If possible, I stick all xe_user implementation into it's own file +
define types in a dedicated header.

Matt

> +{
> +	struct xe_user *user;
> +
> +	user = kzalloc(sizeof(*user), GFP_KERNEL);
> +	if (!user)
> +		return NULL;
> +
> +	kref_init(&user->refcount);
> +	mutex_init(&user->filelist_lock);
> +	INIT_LIST_HEAD(&user->filelist);
> +	INIT_LIST_HEAD(&user->entry);
> +	INIT_WORK(&user->work, work_period_worker);
> +	return user;
> +}
> +
> +/**
> + * __xe_user_free() - Free user struct
> + * @kref: The reference
> + *
> + * Return: void
> + */
> +void __xe_user_free(struct kref *kref)
> +{
> +	struct xe_user *user =
> +		container_of(kref, struct xe_user, refcount);
> +	struct xe_device *xe = user->xe;
> +	unsigned long flags;
> +
> +	/* Remove the xe_user from xe_device.user_list */
> +	spin_lock_irqsave(&xe->work_period.lock, flags);
> +	list_del(&user->entry);
> +	spin_unlock_irqrestore(&xe->work_period.lock, flags);
> +
> +	drm_dev_put(&user->xe->drm);
> +	kfree(user);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_drm_client.h b/drivers/gpu/drm/xe/xe_drm_client.h
> index a9649aa36011..cf5f27e79251 100644
> --- a/drivers/gpu/drm/xe/xe_drm_client.h
> +++ b/drivers/gpu/drm/xe/xe_drm_client.h
> @@ -12,6 +12,7 @@
>  #include <linux/rcupdate.h>
>  #include <linux/sched.h>
>  #include <linux/spinlock.h>
> +#include <linux/workqueue.h>
>  
>  struct drm_file;
>  struct drm_printer;
> @@ -34,7 +35,63 @@ struct xe_drm_client {
>  #endif
>  };
>  
> -	static inline struct xe_drm_client *
> +/**
> + * This is a per process/user id structure for a xe device
> + * client. It is allocated when a new process/app opens the
> + * xe device and destroyed when the last xe file belonging
> + * to this user id is destroyed.
> + */
> +struct xe_user {
> +	/**
> +	 * @refcount: reference count
> +	 */
> +	struct kref refcount;
> +
> +	/**
> +	 * @xe: pointer to the xe_device
> +	 */
> +	struct xe_device *xe;
> +
> +	/**
> +	 * @filelist_lock: lock protecting the filelist
> +	 */
> +	struct mutex filelist_lock;
> +
> +	/**
> +	 * @filelist: list of xe files belonging to this xe user
> +	 */
> +	struct list_head filelist;
> +
> +	/**
> +	 * @entry: entry into the xe.work_period.user_list list
> +	 */
> +	struct list_head entry;
> +
> +	/**
> +	 * @work: work to emit the gpu work period event for this
> +	 * xe user
> +	 */
> +	struct work_struct work;
> +
> +	/**
> +	 * @uid: user id for this xe_user
> +	 */
> +	u32 uid;
> +
> +	/**
> +	 * @active_duration_ns: sum total of xe_file.active_duration_ns
> +	 * for all xe files belonging to this xe user
> +	 */
> +	u64 active_duration_ns;
> +
> +	/**
> +	 * @last_timestamp_ns: timestamp in ns when we last emitted event
> +	 * for this xe user
> +	 */
> +	u64 last_timestamp_ns;
> +};
> +
> +static inline struct xe_drm_client *
>  xe_drm_client_get(struct xe_drm_client *client)
>  {
>  	kref_get(&client->kref);
> @@ -67,4 +124,20 @@ static inline void xe_drm_client_remove_bo(struct xe_bo *bo)
>  {
>  }
>  #endif
> +
> +struct xe_user *xe_user_alloc(void);
> +
> +static inline struct xe_user *
> +xe_user_get(struct xe_user *user)
> +{
> +	kref_get(&user->refcount);
> +	return user;
> +}
> +
> +void __xe_user_free(struct kref *kref);
> +
> +static inline void xe_user_put(struct xe_user *user)
> +{
> +	kref_put(&user->refcount, __xe_user_free);
> +}
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_exec_queue.c b/drivers/gpu/drm/xe/xe_exec_queue.c
> index 6c176183ed58..59d69863f626 100644
> --- a/drivers/gpu/drm/xe/xe_exec_queue.c
> +++ b/drivers/gpu/drm/xe/xe_exec_queue.c
> @@ -15,6 +15,7 @@
>  #include "xe_dep_scheduler.h"
>  #include "xe_device.h"
>  #include "xe_gt.h"
> +#include "xe_gt_clock.h"
>  #include "xe_hw_engine_class_sysfs.h"
>  #include "xe_hw_engine_group.h"
>  #include "xe_hw_fence.h"
> @@ -865,6 +866,7 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	struct xe_device *xe = gt_to_xe(q->gt);
>  	struct xe_lrc *lrc;
>  	u64 old_ts, new_ts;
> +	struct xe_gt *gt = q->gt;
>  	int idx;
>  
>  	/*
> @@ -889,6 +891,9 @@ void xe_exec_queue_update_run_ticks(struct xe_exec_queue *q)
>  	new_ts = xe_lrc_update_timestamp(lrc, &old_ts);
>  	q->xef->run_ticks[q->class] += (new_ts - old_ts) * q->width;
>  
> +	q->xef->active_duration_ns +=
> +		xe_gt_clock_interval_to_ns(gt, (new_ts - old_ts));
> +
>  	drm_dev_exit(idx);
>  }
>  
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.c b/drivers/gpu/drm/xe/xe_gt_clock.c
> index 4f011d1573c6..6ba807837198 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.c
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.c
> @@ -110,3 +110,8 @@ u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count)
>  {
>  	return div_u64_roundup(count * MSEC_PER_SEC, gt->info.reference_clock);
>  }
> +
> +u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count)
> +{
> +	return div_u64_roundup(count * NSEC_PER_SEC, gt->info.reference_clock);
> +}
> diff --git a/drivers/gpu/drm/xe/xe_gt_clock.h b/drivers/gpu/drm/xe/xe_gt_clock.h
> index 3adeb7baaca4..bd87971bce97 100644
> --- a/drivers/gpu/drm/xe/xe_gt_clock.h
> +++ b/drivers/gpu/drm/xe/xe_gt_clock.h
> @@ -12,5 +12,6 @@ struct xe_gt;
>  
>  int xe_gt_clock_init(struct xe_gt *gt);
>  u64 xe_gt_clock_interval_to_ms(struct xe_gt *gt, u64 count);
> +u64 xe_gt_clock_interval_to_ns(struct xe_gt *gt, u64 count);
>  
>  #endif
> diff --git a/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> new file mode 100644
> index 000000000000..2de05f1b64f3
> --- /dev/null
> +++ b/drivers/gpu/drm/xe/xe_power_gpu_work_period_trace.h
> @@ -0,0 +1,61 @@
> +/* SPDX-License-Identifier: MIT */
> +/*
> + * Copyright © 2024 Intel Corporation
> + */
> +
> +#ifndef _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#define _TRACE_POWER_GPU_WORK_PERIOD_INTEL
> +#endif
> +
> +#undef TRACE_SYSTEM
> +#define TRACE_SYSTEM power
> +#undef TRACE_INCLUDE_FILE
> +#define TRACE_INCLUDE_FILE xe_power_gpu_work_period_trace
> +#undef TRACE_INCLUDE_PATH
> +#define TRACE_INCLUDE_PATH .
> +
> +#if !defined(_TRACE_POWER_GPU_WORK_PERIOD_H) || defined(TRACE_HEADER_MULTI_READ)
> +#define _TRACE_POWER_GPU_WORK_PERIOD_H
> +
> +#include <linux/tracepoint.h>
> +
> +TRACE_EVENT(gpu_work_period,
> +
> +	TP_PROTO(
> +		u32 gpu_id,
> +		u32 uid,
> +		u64 start_time_ns,
> +		u64 end_time_ns,
> +		u64 total_active_duration_ns
> +	),
> +
> +	TP_ARGS(gpu_id, uid, start_time_ns, end_time_ns, total_active_duration_ns),
> +
> +	TP_STRUCT__entry(
> +		__field(u32, gpu_id)
> +		__field(u32, uid)
> +		__field(u64, start_time_ns)
> +		__field(u64, end_time_ns)
> +		__field(u64, total_active_duration_ns)
> +	),
> +
> +	TP_fast_assign(
> +		__entry->gpu_id = gpu_id;
> +		__entry->uid = uid;
> +		__entry->start_time_ns = start_time_ns;
> +		__entry->end_time_ns = end_time_ns;
> +		__entry->total_active_duration_ns = total_active_duration_ns;
> +	),
> +
> +	TP_printk("gpu_id=%u uid=%u start_time_ns=%llu end_time_ns=%llu total_active_duration_ns=%llu",
> +		__entry->gpu_id,
> +		__entry->uid,
> +		__entry->start_time_ns,
> +		__entry->end_time_ns,
> +		__entry->total_active_duration_ns)
> +);
> +
> +#endif /* _TRACE_POWER_GPU_WORK_PERIOD_H */
> +
> +/* This part must be outside protection */
> +#include <trace/define_trace.h>
> -- 
> 2.49.0
> 
