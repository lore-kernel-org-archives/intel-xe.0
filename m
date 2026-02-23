Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32D02EA4FBA
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 14:20:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCEE10E405;
	Mon, 23 Feb 2026 14:20:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="koIJBqrz";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 77EDC10E3E9
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 14:19:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771856400; x=1803392400;
 h=date:from:to:subject:message-id:references:in-reply-to:
 mime-version; bh=xYkpRmTUG71PQp48XQdHnQqPB2vKb8pEiPHCL1PXj6c=;
 b=koIJBqrzCQTyyLrBSoop+ephnxWOZktibvJKpyLcpTchU2nfrg4+vXHp
 oq+dDn1Ti7R4/nTil1Jw14OV1Q9L+zswPOq5v1jRYOQRyz46Y96bc0QhY
 Jm08+N3utiNwSLoaScGh8jQdbC9B8AOD1MMstz8MQj4m9aY2tea6lcdUx
 NsIZq7Bc+QRGCTp+TZGvx1pmBujYa25sUJMMU5GuIPIMvRa2RbP7bq57d
 oq54DNq28dWhu/NRngfD9peyG0N4liSia8x+uEtXXjSimaiscAwCQX/q5
 zk7WaLQjmuvvN8A/QrztGCbEqCq0XgmibaqUFFuDqRnOi4H4FISjR6M6h A==;
X-CSE-ConnectionGUID: jjmyobxXSVOVlkyGJ08XIA==
X-CSE-MsgGUID: bBdm8ITYQP2WPL5UKe8t7g==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="73027359"
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="73027359"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
 by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:19:59 -0800
X-CSE-ConnectionGUID: Ph1imTNeTcS78sRZHh7xmA==
X-CSE-MsgGUID: iQsHXAxmSsypGtqSH3B3Qw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,306,1763452800"; d="scan'208";a="238545999"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by fmviesa002.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 06:19:59 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:19:58 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 06:19:58 -0800
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.45) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 06:19:58 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ozYfAeGSHJnYtttDArvWXidhNbZdpX1k2D/l6f1NyD16+HMUJFI6Hu8+a3iJD9MnveNLTDdztTRSjaR+1xfwRt8O9CASCMm36SpzptD8hrVeWN++sFjVzQDTs2qW0G99Gve+P6yfQFAufhNi5lTifaOXUbqKhDF2DBCXWzaWnIiuVpd5ShbvjZ8tdhLqoaf3OACINfAj7WKnHjRc+QZy6kEIFVRdJEMCNmKVorwN8J6Q0tdId8yQqcwjsn3h7GLdGGlNCrqADC1Zl9dhj0EhuwvSWYdeFSIVMF817vBB/7jen6QkvyRn1oay8HpsWGbkTMRfaM6S6Ey+RK1k6WWG9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3EXF/1IH05Yn23D0TsYe9sKTned8Yn3DsQQskAaPwCo=;
 b=IUDxItlEB1wKqK4QgYADjNcUly+WJ1p61IIRgB5Nf6Vcbk4fHprYzQLvBv4OY4tcRHUZsrZhvYXXNUssbKKAVipRHyFlS9xQtc8KO4+RCKQH4qPlPygAIv9F01KuOpQFKsw9kA5XSTk8jQn2SjBVD3OJQq1lKGb9cHfrKA6ZOaTBZP2g6T+3qfeknMx6VwGktzz++vIS1C33bVxovgessRUNS6MQ08eo+Sx85k5sZLyLd40+Fq8pQELvjqg5+dg+VC8d9JiR61tR8Nl+bauKy9ctiWpB3BsA3Q98LSE83vneqL1w7jjdF0gsF5qSYr0SDFKqkGPBwS1vrDr0DwkrMg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB6974.namprd11.prod.outlook.com (2603:10b6:510:225::16)
 by BL3PR11MB6387.namprd11.prod.outlook.com (2603:10b6:208:3b7::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.21; Mon, 23 Feb
 2026 14:19:54 +0000
Received: from PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f]) by PH8PR11MB6974.namprd11.prod.outlook.com
 ([fe80::44a4:1ecf:f303:d08f%4]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 14:19:54 +0000
Date: Mon, 23 Feb 2026 19:49:47 +0530
From: "Vivekanandan, Balasubramani" <balasubramani.vivekanandan@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH v2 10/23] drm/xe: Consolidate workaround entries for
 Wa_14020338487
Message-ID: <aZxiA5vCF7NyHNEu@bvivekan-mob1>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-10-b12005a05af6@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-10-b12005a05af6@intel.com>
X-ClientProxiedBy: MA5PR01CA0152.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1ac::16) To PH8PR11MB6974.namprd11.prod.outlook.com
 (2603:10b6:510:225::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB6974:EE_|BL3PR11MB6387:EE_
X-MS-Office365-Filtering-Correlation-Id: cc924ff0-63e2-437e-ebed-08de72e69d84
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UEdPWkF4NTVxcm53YldYRHE4MjBsNkJua0xwVWVSdW95WmNFUTh3YVhQZ3lB?=
 =?utf-8?B?dTdnMFYwNXoyMG1ScUEvQTFnOHdiSUVaV1I0ejhZNHZwaUdpUGc0NEdiR3ZM?=
 =?utf-8?B?RUprc0ZEZVBLK2NtT0xETXJ0SWtJbFl5cS9jYWpUalg1d1A0QjJaaTlDdVFI?=
 =?utf-8?B?dXluTERLMmVTY2xyZU5BcFdqbTlodisxc2U0alpDdjlybGhQYWlQR1ZkQXNJ?=
 =?utf-8?B?UE9BQTZjd0lvZUtQeW9TZ0IwK0x6RDRHNjRhd3Fqb2t3ZUU0TkFyRm8vUlR5?=
 =?utf-8?B?V2llRWZFUU04N2t1MDBFcEVEekdpSWRuTFczZHZlcGdFcHNwZkc3aTNXcGVo?=
 =?utf-8?B?MlB0RFlud2VTQWFMY1lKTDI3d08zWVVhZ01ZUW00TGw4dlhqN0dmMVphSEw4?=
 =?utf-8?B?S210ai8yYjI5TTdJbFFyMksyUFBVN2U4SFlDbjYvT2orcWxoWDNtWGxiRjJ1?=
 =?utf-8?B?L0tqbXRVTkc3d2NsVXVpVjFKb24zVVBkcW03bS8rWFFqNFluNUFZS3lJYWwv?=
 =?utf-8?B?VGR0MmFOdGRzaUFVZkgvMVBRRTJ0MHpyWmxoS2NWTExKbThxZDdZRW0xMC9W?=
 =?utf-8?B?KzRlUkp4RFVJM2k0anhhUVAwa3l4d2pFSittTHA5NnZWNTB6ZHMzdm9YQ2Zi?=
 =?utf-8?B?MjRPU3J1dEhXc2J1clBBcjd3NkdwMG1HMFo1aUI3V1BtY1RqcFdpbHZOTDRv?=
 =?utf-8?B?K0M4cElDc2M0ZWdtcmdOOEJRWnZnQ2xNYndFTkRHMWNwZnRwamFFQW81eFl1?=
 =?utf-8?B?Vy9FZGhrYUpneStIT3c4bHRQb29zT09DN3JzSXNLaDY2TGNyenk2aFpUSk8y?=
 =?utf-8?B?akE5RVVJRnZDQzJmTVZ3M2NvNU0vYVlRYnNCb0hGWkgrUUoyeGt2d1FUSzdZ?=
 =?utf-8?B?UG9EcGp3T2IvdDMyNy9TZXUvRWtHWmNxTkdHMHZ3RGN5dk0yM3RWQU9ja0ho?=
 =?utf-8?B?VGlCV0cxSHZaTXVDUkE3dGVtUU1TR1JwTGhJRzM2eXVzZ3JiWVJlcmxjMXhO?=
 =?utf-8?B?b3JWNHVvanI3aVNzckQ3WDdYNURkOFZnaXRoOWs5VmF3aHg3TUZKQm5LSldE?=
 =?utf-8?B?VmQwcVVveGhkLzZoejdDU3FuK3hyVU1Xclg5UXp5RXlpSmJvZnFJZ3ZuM3l3?=
 =?utf-8?B?R2xoQU5rUmV0MHRUWmlRYkt2S1N2ZjBMaVZmZUgyRXpXVGVyRDFuQTFaM2hG?=
 =?utf-8?B?b1QycUVkZFA5WVZWSlVLc2IxVnY4dmpKOTN1ejlreCtRenJ4alNGdUtkNVNK?=
 =?utf-8?B?N2hDR056L093dXdBMUxDSVk3K1AwR2NycG1MWlNtUHo4YmxwblI4T3RaalEy?=
 =?utf-8?B?YUtsdWw0NXU4RDFYc2ttNkRBd1pkeS9JNFdyWG4vMTVIc0ptaWZSc3JuWW5q?=
 =?utf-8?B?NVhVNld2UVVEVTZaRzhBYlRqMUhxMHFLK0d0cFdOV2o4SFd3Z2ZyNHZwcld6?=
 =?utf-8?B?ZDdKVlozMnhxNkVZdGVETU9TakZJcTM1OUpBVS91UFI4V1J3dGlDR0QzNmYy?=
 =?utf-8?B?ZG5CNHV3Sks0U0pTUi9DTm9sUUpQMmMvbE9wSmFCb0I1dDcyaWg1VWNwS1Ry?=
 =?utf-8?B?SUdkeS9jRTRPdnFhN09QTHNZZjJIYm9CQkQ2c3NKTVV4S1E5R3pWV21mdWs2?=
 =?utf-8?B?RDU4UUlINDlDUzYrN0o2aFNtWUQxeUwrTjAxOGlLT0RMLzk5ZnJ6bHZvQzNr?=
 =?utf-8?B?TUpQbm40MFdidEViM2ViRXUvbGY4OVdWdytZYTFlU0lPUXgzaDlyY21sM2Nl?=
 =?utf-8?B?eWVpK0U5UlFKQUZzdmpxbmhISlQyN010dnFiZWtHUjdWZndZU2lVVy9MWUhB?=
 =?utf-8?B?MmFpVDFuS3o4UHFEd3IrTDFRUVJXcCtYV2lMNkNQZWkyU0tWUWo4eGRFeVVG?=
 =?utf-8?B?Q2RweE9iSmhIOFluT0E5d0g3Z1NxbnNUeEFyVmlqYUs5M1FqWlgxOHJ6VkZ5?=
 =?utf-8?B?YUhBWFgxb09yRW9CUzA3TlIyLzJtcWRnNEQvTWRRem9yL2trUW5haXpoTUVJ?=
 =?utf-8?B?Zm92eG96UHZOK1BwenhUNG55TXNRQnA1Zm5rTVJjTGtMRi80cWFzNGYzWWh0?=
 =?utf-8?B?RGxwYmhrVlN2VkZ0ZUZtVnpvcHJPWktoVFg5TXBmL1RhU3ROM3hUcjk1S2hK?=
 =?utf-8?Q?cC8A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB6974.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dVRQbzBtZG1ndkxEaHFZbk5mMVkyNGJZVExBWHRKMGt6RkJRNG1uM2NzT2xw?=
 =?utf-8?B?cVVuU0NRbDcyaTNTclp0RnFYbTFOQXFQV05IYlo5cVpWaXZKbVdPc2xtdVF0?=
 =?utf-8?B?THdsQ2RwemhLaE5zdnMwSWhLRGViZFdTZGJXeGg0cXNYRUZPOWFuY2V6UGkz?=
 =?utf-8?B?clVDa1VvMnRjTHN1cFMzWmlBanFIOWxLYm9JeDBKY0puaWdhMEZmSkE2dmlI?=
 =?utf-8?B?UGdVVDhZWXVDTVhwdzIwcHdtWlYzZm0reHpCSkFZemtzZDZXUFp3bFN6SnNG?=
 =?utf-8?B?OTg4OWNqZGN1Z0d1VFRuUndBbkYvVkxZbmYwZTY2Sk5UTDVDNjFCbFJwQW5i?=
 =?utf-8?B?VEN5MFZRTC9HYjlMRlRucno5b2w1UDVRbnJ4VWliUnRWeXBkRFBETmorOG9B?=
 =?utf-8?B?eVFnOVRxdWlCNWZCeEY5MzllSlNjd2lRSVlFSExUZFppOHU4bytqNGtEQjdR?=
 =?utf-8?B?M08wblgvbFRaYU9vTlA5MnM3UHhCN1FoQ0g5c09DQ3RrMXlTQWNxWWNoNkhY?=
 =?utf-8?B?REVqdFZqcGpRRzNkZFlWRG42MjQ2RTFSTXQxUTMvVnF0WTYxQmVzTXJwSi9T?=
 =?utf-8?B?eWZvb0M2TlJ6SllzRE82b3VYN0FnQnhUcXpOK2NaZms1SzhTNi9QWDJsZkt5?=
 =?utf-8?B?YmdyMHpBZElsT1NWd2FVVWdYUm5sS3lmV1BwTHpYYzJtaVAvb3pjL0Z5YWNw?=
 =?utf-8?B?YXdwWno2Sk9DRjdoWGVnNVByM3Rra0IxOWhsVk02Rk12Q2dDSzVEQXVTYXhv?=
 =?utf-8?B?UVBTUlZYbXU0emZxQkRHVTBxOVpwa0E2MVhtTHVjOWJ0aWhNcGx4VXp3cHlt?=
 =?utf-8?B?cDkvQlRSeUtZdXlMUmNqejhvOEhaUjVkQ0JKWW9ZaXR6WkQyTE83Q0R5NDlP?=
 =?utf-8?B?aVhHOXhIOUtiN05sTDRQT0I5RldOVGx1RjJVbUtrNFh3SWtXMzVEODVLcXk3?=
 =?utf-8?B?Smd1czVibXBQMnJReHVhREdnS2Y3eEI4VXg1bzM1dEhZcXlHdklZeHkvZHg0?=
 =?utf-8?B?bjE1dWJsK1NCem9ud3FGeHFFbTVuY05yVm9wNXQ1S1BOQitXNHRKRHdqd0VI?=
 =?utf-8?B?eWtUZjdMYzM5M3hGUVJyQkpuNHB0QXZzYkUwZ0p2ZWxGZCs4TGRHenpTVjcw?=
 =?utf-8?B?Y25YYWZJdTdPMFdlNHdiNDk5bnNQZ3hNS0FVN1dic25qUTlaTmFGYXVCd0xW?=
 =?utf-8?B?SUdTUjk3c2tCaUZlY213YUM4RzhZKzNIQ3lXOHF1M2s3aEZZMGRrVnVMWGo3?=
 =?utf-8?B?U21xT0syZ1cvSUQ0RVZobEZlTXhqYmVZMVVEQWF5ZGNwTHFoN1lkUVlXaGVh?=
 =?utf-8?B?UmkvQ1lsRHQvR0ZhMS9aT1pkVG8wOXJUb1d5MjBmZ3d2ZXd4NWl4TGF1WVNn?=
 =?utf-8?B?dHJqSGQwOEMzM2xVOUxTV1MwMDdQME9IbUI4T1VrbjM4NFh0T3B5eDZnTUd0?=
 =?utf-8?B?VEw5OGpEVDNtS00vakM5WllUZis1ZHRpcitlMHZJQmtoTVBscVNSdnRjWFlk?=
 =?utf-8?B?WnZFdDF5Ky9jMVc1NmkzM3JMSDU1ZkU4dzhOV0hVK0x4bDJDa0NJVnNYSmFJ?=
 =?utf-8?B?QkdGemxIeWltSWpqblBMQzRuK1FhdWtnYmxScmRNMzhGd09QWS9na3A4cER4?=
 =?utf-8?B?THJRbkREK21HelY3UzBlb25vZ056eWNVQk5YQ2djUlZSTkcvektDSldkdTlU?=
 =?utf-8?B?ZERlVDgrQmZyK2xOZjdINk95Q0c1VU9XeDQvKzRiaTM3L3hDdSttYUZQMmw0?=
 =?utf-8?B?QTQreXRFYXRqR0ltSDlqdURrUGhvNVZoMG9YTERPYlJpNXowUVY0V2NlSith?=
 =?utf-8?B?anpLRkxPaytYZ1liYWNUN3V3emVRS213RHpuY2dVNmZ6YXZ5cnRwOEtNOHlT?=
 =?utf-8?B?MHN6aWZLUE9waGg4Ym5Gckl2bGhwNHFySzQvOXJub1Brb2lnOTJ2bWc0bWJ0?=
 =?utf-8?B?bzlkUmlEWjhQSnVUK2lxb0VISWxoNk52VkQrZDJyZWw3UVo1Z09DYnRQdDBu?=
 =?utf-8?B?dDUrajVHV2NtY1dBanpHdnNDN3B3eC9pUSs0Q1pzeEs0RFZkZWdPOS9BL3BK?=
 =?utf-8?B?U3VVMjkxVGoveFBIOWwvT2JTa2w4b3dXbEVPdjhKTG12T2llT2xCdVZyRERu?=
 =?utf-8?B?S0N3cVV4b3QwR1paSlEvS1JrVitMeWNnRXBQZDhXR2YwRE0yc1hJNmtIZ3Nw?=
 =?utf-8?B?dDJLRjVHMm1DYWtSNThUaDJzVTdRUVIzN3d1T2pqTUxvM2dGMUIzcGxXcVIw?=
 =?utf-8?B?VmNmL1ZzOTVXQWdUdlhkOUlGWDdPZGQ5NE5pY3BBWlQwRlVJcElhTjBFNXpI?=
 =?utf-8?B?d1prWjNLUG8yWUNlSFpSclFoRFdTYVVzVnN6NHFhU0JPWGlmUlJUbVJBMlVv?=
 =?utf-8?Q?xZfxnbNAB0en02VwTdakgB5RLrx5noGk3ZwbP?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cc924ff0-63e2-437e-ebed-08de72e69d84
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB6974.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Feb 2026 14:19:54.6894 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VLDzQCP++eoH3JUAaquV/GSDjLhWnEssfDyoCGRq6sYNOCRwLhASYDmH1QbiTN5svw33lYiMBSGAdnUyusT2gPCltYaPqJ/uuQUnDfiwdgrLBN0fACxzEgjVh5MUg6By
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR11MB6387
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

On 20.02.2026 09:27, Matt Roper wrote:
> Wa_14020338487 applies to all graphics versions from 20.01 through 20.04
> (inclusive).  Consolidate the two RTP entries into a single range-based
> entry.
> 
> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
> ---
>  drivers/gpu/drm/xe/xe_wa.c | 14 +++++---------
>  1 file changed, 5 insertions(+), 9 deletions(-)

LGTM.

Reviewed-by: Balasubramani Vivekanandan <balasubramani.vivekanandan@intel.com>

Regards,
Bala 

> 
> diff --git a/drivers/gpu/drm/xe/xe_wa.c b/drivers/gpu/drm/xe/xe_wa.c
> index f99f1fbe3aee016d8a8aa19d62f6fd503e6e19f2..4809166ba8ec69fc913fe2ca0103fe54e345dd14 100644
> --- a/drivers/gpu/drm/xe/xe_wa.c
> +++ b/drivers/gpu/drm/xe/xe_wa.c
> @@ -353,6 +353,11 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(LSC_CHICKEN_BIT_0_UDW, XE2_ALLOC_DPA_STARVE_FIX_DIS))
>  	},
> +	{ XE_RTP_NAME("14020338487"),
> +	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
> +		       FUNC(xe_rtp_match_first_render_or_compute)),
> +	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> +	},
>  
>  	/* TGL */
>  
> @@ -490,10 +495,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  
>  	/* Xe2_LPG */
>  
> -	{ XE_RTP_NAME("14020338487"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION(2004), FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> -	},
>  	{ XE_RTP_NAME("18034896535, 16021540221"), /* 16021540221: GRAPHICS_STEP(A0, B0) */
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2004),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> @@ -544,11 +545,6 @@ static const struct xe_rtp_entry_sr engine_was[] = {
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
>  	  XE_RTP_ACTIONS(SET(ROW_CHICKEN, EARLY_EOT_DIS))
>  	},
> -	{ XE_RTP_NAME("14020338487"),
> -	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
> -		       FUNC(xe_rtp_match_first_render_or_compute)),
> -	  XE_RTP_ACTIONS(SET(ROW_CHICKEN3, XE2_EUPEND_CHK_FLUSH_DIS))
> -	},
>  	{ XE_RTP_NAME("14018471104"),
>  	  XE_RTP_RULES(GRAPHICS_VERSION_RANGE(2001, 2002),
>  		       FUNC(xe_rtp_match_first_render_or_compute)),
> 
> -- 
> 2.53.0
> 
