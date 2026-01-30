Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31CD5E6BF1E
	for <intel-xe@archiver.kernel.org>; Fri, 30 Jan 2026 15:23:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3DA10EA0C;
	Fri, 30 Jan 2026 15:23:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LQSAUdCJ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C15E410EA1C
 for <intel-xe@lists.freedesktop.org>; Fri, 30 Jan 2026 15:23:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1769786632; x=1801322632;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=6snrjGa+uNqMViGHgUJgLCRZqDoKN+Jq0A4mA3Emi3o=;
 b=LQSAUdCJOqEoEfyor2egnTExVsJ+KQMwCKKou3wefpcKBxZ/FZNrMFxO
 pSiEZKRqCzYh8fGYI7ZeSUvSoJa/hsrFI6nbiNut3I/+TNw7hs/vR/2uN
 TKNJgcg+eFQugTa+fYEMWHxNyKy2gJvkQGhwyqE9ErmWcTx+LMqs5eAGi
 VN2lzvZP1uOTxjnsq4gen4cnN2AhBHo3EoC5euBU+wRiAUbWnPArQiO1X
 JFSILkoEaHU73sV+f7LtELlnENvaUbmxSwpnKzEdPuJbUbrLRzS88BAAQ
 RknEh4h6QRnqIHbo2OcoxaG0eY652TfAZ4lg63viXCueg7NUkptutIxmU g==;
X-CSE-ConnectionGUID: COXPoh4oS2OTKF8kEKU7RA==
X-CSE-MsgGUID: BMcoCabhR2uuV6PE8trnRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11686"; a="71123312"
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="71123312"
Received: from orviesa005.jf.intel.com ([10.64.159.145])
 by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:23:52 -0800
X-CSE-ConnectionGUID: g4QM2x8yTv6cdYScjCkNqw==
X-CSE-MsgGUID: 1q/UGosJTyeiUscVi1hzfA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,263,1763452800"; d="scan'208";a="213817339"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa005.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 30 Jan 2026 07:23:52 -0800
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:23:47 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Fri, 30 Jan 2026 07:23:47 -0800
Received: from DM5PR21CU001.outbound.protection.outlook.com (52.101.62.7) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Fri, 30 Jan 2026 07:23:46 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=F3LPYyczy9gtA2iWppIiLyTpzLpgZM4AXpDczmieIRyMhMg7vViEL8IYsm/F7/QmEkphttlBARIqIwJM8KTZPL20OdI2BIt7dH+Fgth8aaYBYFdE1TWAQ7BfKWzw+WIJDkDSkUzSKRbvriGszuboK4xmDGoT/ZHWNqlGPqsMLmnJDRBSi2m2NYOcSOuphRn6qU7Z1SEclJpyzWtv3Tf8aK6ixToGmVCHYsoENsWnMxcWCoXfhLpNcBKHVRhxdwXm3CMTJeekXPJE4rntkFcNUu43wNfAUB59cAqbN3t7SVk1PrLobEBPsXQKC7nt771d1U7jEsqE7uUei24CpeLeQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rOk4tKpKmCNpC2nrEm2+D3znuPkHkzr3py+BgtKxjCg=;
 b=lPaBBePQKVwLs3mBLSNwMr/JafU/fQwMsTipjKiYmvrL8xdlKC6ZDkK/Ac7Z6edsXSVz/fX5TG+EbmqXYUa3iTKyQ8M6jYeFq5cLuH4kHVQNavpQmRv71DUpqZyr42yDiWebtT+YEee4T16enjmHAOZTYNEscffOLCMsKEWMRQT90rNX/Czz/AsyyokavLXWlXE15X2cTBgBfYYU4bITfj+TGttv6HEf+9wky0JQM8BdeL4Sd2EMmJgf/eXB7nS+tJ4BGwALBQx6xJEutINnxEXk+xY5L8nYsE/JzPIwYU4JVbBedm7gK5goh312LrDCaiq49qifnprVJLDtLwyWrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5530.namprd11.prod.outlook.com (2603:10b6:408:103::8)
 by SA2PR11MB4778.namprd11.prod.outlook.com (2603:10b6:806:119::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9564.11; Fri, 30 Jan
 2026 15:23:44 +0000
Received: from BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb]) by BN9PR11MB5530.namprd11.prod.outlook.com
 ([fe80::1451:ad37:6612:37fb%4]) with mapi id 15.20.9564.010; Fri, 30 Jan 2026
 15:23:43 +0000
Message-ID: <9c9e4054-cf75-42a2-9dda-3d4073f5160c@intel.com>
Date: Fri, 30 Jan 2026 20:53:35 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe: Add GSC to powergate_info
To: Vinay Belgaumkar <vinay.belgaumkar@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20260115224040.2668209-1-vinay.belgaumkar@intel.com>
 <20260115224040.2668209-2-vinay.belgaumkar@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20260115224040.2668209-2-vinay.belgaumkar@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0144.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::14) To BN9PR11MB5530.namprd11.prod.outlook.com
 (2603:10b6:408:103::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5530:EE_|SA2PR11MB4778:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ea2d747-fdc7-46e4-250e-08de60138dae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3MrRkJzTVZuRVRTNDl1a0FvQVZaRjZaSmJweHNhOWU2Z1UrWEg3L3ZsSXBZ?=
 =?utf-8?B?cEgyUzNkSWtJY0FUSXB4MGJqYkV5U0xIempCcXhlY0oxbmorSVhWWVhXeFpM?=
 =?utf-8?B?V1RqUWl2Sk9TMzc4SGtYVDNlTzcrNDR3ZU9qbWt2SWttcEZ1NGtaTlpKM3d6?=
 =?utf-8?B?VVdUNXIzSVdEZVVWWDdMNzFRRkRKRFA1eTBTQ2MwcWZyVUcxZ2hHNWJZTUM4?=
 =?utf-8?B?aTA2cHVheVhJdm9sclFaSHZoaWN3TlgyNkt2eXpYUGJHWXorM05BUU00cjZx?=
 =?utf-8?B?Z3U0TWp4RVlnV0tMY2FINFYzUXJDbHZydG5WZUxQRU80WmJTV1ZUMjdyK1ly?=
 =?utf-8?B?Z0xFMVR3aVF3S0dCNUVPM0ZDRjRGaHZKSGR4akFSanJ0aXJXbTM3MEJpSERO?=
 =?utf-8?B?N1padmQ0N05maUVOV29uUWtSaklJTEFsN2xyUFNOQXVzOUJ1SlJFb1l1OWFk?=
 =?utf-8?B?ZFFDNHZ2SElJNGxZa2o3U3JCRlpMZTBuNWlWRjNodEhiRzg1aER3YUluTmdM?=
 =?utf-8?B?Y0N0RllYa0FaV2xhMmthTkg1ZWpnWEFyU0duVHIvOVI2Nkw5YjRrYlJMRDRu?=
 =?utf-8?B?WXowdC9PejVHSUg1RGtoTEQ2d3g5dCtIQTZFa1lnWjB2NEhTSncwQndHM0JE?=
 =?utf-8?B?czF5Tyt1bnpmUFNtOHV4YTRkT3dpcVYyeUtDSFVwRTc0dndtTFBwcWlwWVZt?=
 =?utf-8?B?VFhYbzZuWmF0R1dsa0cyNDg5RDBDSThxK3EyYmphaExVQ1BMRCtlWUM4M0ZU?=
 =?utf-8?B?QzZFZ2l4WWplS1ZyNFZLdkx5Zm00VE55bk42M2R2VTFqTk5OVGJtb0dnYkFp?=
 =?utf-8?B?L3oyUmRFa3hUV1pHd1lVVExEaVZzMXUzTFdISTFOa0lFeE9hMGNhaEdheEZx?=
 =?utf-8?B?Mk5VbGxDSE9PajgrZFZQU1hvdjZudVQ3TlFXeHRqQW5BS3lmRzk5TFVjSUl2?=
 =?utf-8?B?a2ZTZ3ZSbGQrYzIwVTlsZTdhbEtudGovdEdZcDNvd2tiRFJpV2htaXlaMDRC?=
 =?utf-8?B?NjdTZ01ucEtuNTFjOXRKWkRyR1pibUYwNktsa1crR1hrY1o1M3VXN0JMaHNH?=
 =?utf-8?B?SGwzOGlRZjBLelUwL204QjhMZ0lmOXBPbStMSGVKMEdSandWSTNpRjRUdEQ1?=
 =?utf-8?B?QzIzUGhOYUFjNlBMdHllVWpjZkw3SGhiWkF3TnZ2Z1htMmNxUVFjSEZGR3lG?=
 =?utf-8?B?c0swbFdITzJuK0pZMCthclVtbXdOOVBhTzVQdTd2OUxKalh0QUpuR3JFbkpE?=
 =?utf-8?B?THVwbWpVK2hGUEpsTk45RVg2MnJRNEoxb3BsdU12cWdwNEdud1pBUHFiL2Z3?=
 =?utf-8?B?bWh0QjRKQnROZ3hSd0VzNFVRclhzUHcxL0wyQlB4aW1udGJ2T1FoT1c0WUlC?=
 =?utf-8?B?NUdjWHZBRUp4eHcxSTNYWHo3eXdGWHlubXhxVE8ydGdYcitRYU9HemYxZjNH?=
 =?utf-8?B?UGt2MHJMaWlmeGhWSmk5Q2RKdlFKejZDbE53TXRSOGJuZkRHbm1LSmxXdVdZ?=
 =?utf-8?B?T0NlSUkxbk1XSU9SMnJKcXNnUWNrY3RaTXZ4MmNZdG9aN0ZSbDh4ekIyaVYr?=
 =?utf-8?B?MGhQMmhITXNyQ1Y0SHVtcGx5VGNKQXU0WVJIazhaR3hTdTdBcFhUa05XTDk2?=
 =?utf-8?B?T0tRUkd0T1pnZ1BWdGpxWmppMzhobW1OVmlsbXdieUU2U0s1RjVObXVaZU5E?=
 =?utf-8?B?SHdKbGdiRUpzek5qem9tdUh6MEU2ektxRW5HQk1zVVFMcXFkVWlnRys5Z2pF?=
 =?utf-8?B?WmFwUHlTTWxUNGRKRW8wc2xoZ2RQU3Z1TUxtd0VTOGN3TlRyc1A4QTlSSGls?=
 =?utf-8?B?OURSVjJRYmJsWG4rclVFM2l2SEtmNnNSWFc2Ykh1bTBtU0YrVkk2NndiUGtx?=
 =?utf-8?B?Uzk4anFSMS8raWQ2SmtMUzlhVXpzdjBHRkhITTRmZkVCSExUR3A5aG1GcVkr?=
 =?utf-8?B?ZldESml6R1M2MDBkUUZmMEdCVVlDUTQ3cFg1UkVaaXdtaXd2RHZoa1JTSXdy?=
 =?utf-8?B?K0daT1VpR1lwZWxvQzhyM0VUWDdOUDVVZnE0NkN6SndLeHZmTHRoV0dqUkEr?=
 =?utf-8?B?UUlNQlIxeUoxUGpDZEJoUEd4UHg0V20zNDlzcFZjVkw1RFdDMHpqMnBaZE1o?=
 =?utf-8?Q?L7qs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VVNMQnF4WmovRE93cjdCZHJKZXcxMDJ5MENibyt0WC9YTEVmWVNQUVVZMFgx?=
 =?utf-8?B?M3NKV3B5UVBETGg0UFhHQ3RmNHhPTHBGQ1QwRE01eGdNaGl5SCthK25Dc2gz?=
 =?utf-8?B?WVpqZUEzV2VPdFVxRGY2dFBRNEw4TDFWQm1sRTJuYXREK3lBdHp4MUFURXNx?=
 =?utf-8?B?aWd1WHc5WHZNWVFmdHFZd2F6QU5mcGVpL05sR1ljL1VXQ3ZWMkhDQmFKd1E4?=
 =?utf-8?B?dWE3amNEMTJjeHdMRTRlbEM3clBldVYwRnNTdVp0ci83c3hGTkNVdW8vZGhk?=
 =?utf-8?B?akdXTDFkSCtxV01Qdk1ZVnlZTlNuSmhleHZNTmtiR1kvMEgvYWVER0pIc1Bq?=
 =?utf-8?B?ZUxTTUkyWDB4VVYyMC9XV0xoQXAvRTlJalJVZXRtRnoxY290dXk3eFdpNkFN?=
 =?utf-8?B?dTN4S29aT3RaTGFQcjZrNnhFWVZwdTQ2MHZxZ2ZIZE8yN1Y4VVNkakRjb3FS?=
 =?utf-8?B?THliL3Z1cGpjSFpPWUgzZHVDT212eUpZTjVzamtYTmxDRXh1S1lLalZmSG5G?=
 =?utf-8?B?Rm8wSEc4dTBCckRwQy9DUFAwNEltcEtXMWhrZnQxcXZKQy95S3VqL1h1MmV4?=
 =?utf-8?B?Rzc5empLK1FvVzkzSzVobnNZUVlLeG5IdjR2WUpEWWhkRzFwNW9vOFJ6bWVF?=
 =?utf-8?B?WWx0NnFrVC8wcThQS2p0eng1ZWpBY1N6RVFqUG9aaExLdjJjajdRaG5WOFM0?=
 =?utf-8?B?VkhMNmI3UEZrSDhNdDNpOXZvWGc2WFlEQnc2RU8yNnFCSE1JMEhoODhmWENm?=
 =?utf-8?B?L3M2c0p1anhPL2dvOGYzdDJicjE3RWdvR3ZnU013cnNVTGtocExLelNpVHJP?=
 =?utf-8?B?dGw0V2tsVUxCQzExS3JSS094VEFUNG5MYWcwRGF6NVdtQ0o5L3lmcW5KRDdD?=
 =?utf-8?B?Ymlsbkl4eVRQSHdqSDZTU09uL250VkExTk1mYVNueGxkZ2RhdVNGN3BlMWtL?=
 =?utf-8?B?OVd2dGpjQnREOHZUMFpLc2JnWndCVUZ4bkg2QWJCVTQxS3VOR3JxYVpoRmxL?=
 =?utf-8?B?TXVQOFBTM24zMUtqWkVjUGhvWWRwcVJnUjZ2TkxIMXB1VnJvQmtsa0Q5L21I?=
 =?utf-8?B?N0lrS3U1N3h6ZHVuSmNJRkJQQXNWMlB6RzJscWNCdUhRSkhPZEFweFRvSjN0?=
 =?utf-8?B?NENURS92QlhySWxPZ2pOQzFreWpZQ0l6WWV2bVZycHI1SlNWc2FzZW9palRr?=
 =?utf-8?B?ZHM5UXRmV3ZIZm5yamNYSGgrZ3lnTE9WUWZlLzhwRWVsY0krRGR0Z1M4NEw4?=
 =?utf-8?B?L2FQZ28waE5RU1ZnYVN5VEZ6ZmVJczUxQ0dFV3dCNjA2L2VaUjcxL2Z0OSs4?=
 =?utf-8?B?K2FNRGhzY0k1UEtEOWltQUxacm5SSlpYTFZmcHlDWmlydDB0MUFoZ3BUVE5V?=
 =?utf-8?B?ckkyekt2b2pjMnZ4WXhZc3kvSktrYmhKTnBsQ0tkaWw4NXZQaHkrNTYvRFQx?=
 =?utf-8?B?bTRFZ3F6RXh6SEFPcXNqREVycXI3N1dUVlF2a0J1YmJxNmg3NlFqQi8xSjV0?=
 =?utf-8?B?M05KS05SWWhweWlMa1hzQ3pGY2hNVTlPem5CNTF6Yll2MURNRndGblFMNCtQ?=
 =?utf-8?B?d1JvWjUvMzRINkYvN3lWKy9XbloxR1piRGtIbVMzMU12WmIwOHZscnAyQmhE?=
 =?utf-8?B?TVlSOGp2RWI0cE44NUJnNWhpSlNoQU5LWHZEcWRySEJMeWZmUEM4Q0UzV1Bh?=
 =?utf-8?B?eUVmLytnMzZLZnhKQzNyZTYrQmZuU2Y3NFB1ZkJMdTNGeXdRaGMrUnRQUnBi?=
 =?utf-8?B?OWZCZ292YUtNK0x5amEwM2ZPY0N6bS9SK2RiMHRXQ0YrY0JvdTVkdllOVUJu?=
 =?utf-8?B?TXhsTGZPNGRtUkJFZ1liYXJtcU1zQXVDcFpXeHNtZU9pNkpZVWcyWWpCanNZ?=
 =?utf-8?B?bnlIN3RvbEx0N3dxYm5lajg0US90MCtCa2pRK3JsR3V2RkZlU09wSS9mN3Rl?=
 =?utf-8?B?WWkxRXZXNEFCNlg3RVBaWXlUOWxZYlZZeEZaMGc1KzhpZFhpclRGS3JkUUF0?=
 =?utf-8?B?TXlWVnFpRE5pNFFCMzhNV3Q3SUZoL21xcnhONHV3SHFBS2Q5UWZMRzdQWFVy?=
 =?utf-8?B?Wk9vdHBvOHhnZXUvdzlZQ2hzQkRTYXZ6TGlaRkwyUU9vZG15b2ttWElhd3o4?=
 =?utf-8?B?N0VIVVExaGV5bVZ6ZDZTVjQ5eTdFelBWR2NwTlhNUTJOZWphM2ovTVpNN2hh?=
 =?utf-8?B?UFp6SlZZUFNRTE9OV3BVUmVJa01JSFoxenVxYTJXakpPUmhTcW1NRG9zSGVR?=
 =?utf-8?B?bXpoZVBjVFhCMncrU2ZQcGEwZ3V0NmMwNTVDbFprMUd3SjFPRk1wc1VVYlVu?=
 =?utf-8?B?dzB2cG8vZUVSaXNtdlQrYkQyNVZ6VkJPbDZkUDZZTG1aM1BVcjgyQT09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ea2d747-fdc7-46e4-250e-08de60138dae
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5530.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Jan 2026 15:23:43.4697 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sMg6Aa2t5CUHDGAvP1OyFNmuAMk86RcVoSdDZrnZJpJqzX1ma+RsA/sNdyh2yWVpgV6FRi67npYCIrVVqmJGww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR11MB4778
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


On 16-01-2026 04:10, Vinay Belgaumkar wrote:
> Add GSC powergate status to the existing debugfs.
>
> Signed-off-by: Vinay Belgaumkar <vinay.belgaumkar@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_gt_regs.h | 1 +
>   drivers/gpu/drm/xe/xe_gt_idle.c      | 5 +++++
>   2 files changed, 6 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_gt_regs.h b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> index 24fc64fc832e..7d3ec1fe4f7f 100644
> --- a/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> +++ b/drivers/gpu/drm/xe/regs/xe_gt_regs.h
> @@ -367,6 +367,7 @@
>   #define FORCEWAKE_RENDER			XE_REG(0xa278)
>   
>   #define POWERGATE_DOMAIN_STATUS			XE_REG(0xa2a0)
> +#define   GSC_AWAKE_STATUS			REG_BIT(8)
>   #define   MEDIA_SLICE3_AWAKE_STATUS		REG_BIT(4)
>   #define   MEDIA_SLICE2_AWAKE_STATUS		REG_BIT(3)
>   #define   MEDIA_SLICE1_AWAKE_STATUS		REG_BIT(2)
> diff --git a/drivers/gpu/drm/xe/xe_gt_idle.c b/drivers/gpu/drm/xe/xe_gt_idle.c
> index c1c9bec3c487..52436dcb6381 100644
> --- a/drivers/gpu/drm/xe/xe_gt_idle.c
> +++ b/drivers/gpu/drm/xe/xe_gt_idle.c
> @@ -255,6 +255,11 @@ int xe_gt_idle_pg_print(struct xe_gt *gt, struct drm_printer *p)
>   		drm_printf(p, "Media Samplers Power Gating Enabled: %s\n",
>   			   str_yes_no(pg_enabled & MEDIA_SAMPLERS_POWERGATE_ENABLE));
>   
> +	if (gt->info.engine_mask & BIT(XE_HW_ENGINE_GSCCS0)) {
> +		drm_printf(p, "GSC Power Gate Status: %s\n",
> +			   str_up_down(pg_status & GSC_AWAKE_STATUS));
> +	}
> +

Looks good to me.
Reviewed-by: Badal Nilawar <badal.nilawar@intel.com>

Thanks,
Badal

>   	return 0;
>   }
>   
