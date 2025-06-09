Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F0AC7C5B552
	for <intel-xe@archiver.kernel.org>; Mon,  9 Jun 2025 22:14:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CF5210E207;
	Mon,  9 Jun 2025 22:14:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Db9+s5oi";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E9EEA10E207
 for <intel-xe@lists.freedesktop.org>; Mon,  9 Jun 2025 22:14:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1749507255; x=1781043255;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Dj8KPX7x0ra+dksLdGx9vNoiMVwNRrLjSuKVxsTy7n8=;
 b=Db9+s5oi5/jDypEvswFaJ5LyNYBmJHAmKAXOkiuCKds7da/qg/rRjfBN
 aaw+PBuilBzNBxfzFqemvqmPH8ROcjbCjfVnjHd5qj2EBxJUjBni792Db
 0op/cCzBSwhMN/wZSDPVHA1SflqeK62J4zYwgQcA4362wLqHNAFnwbtvo
 9TdtXfRkXlyCos9b159ghTQTy5fwdbDokOgG7b1H6agU8sPOayCnUAIzp
 I/im8hU/g4t21pjU1FsA/5NlKzWK/77ueAeI2yCvxo9/sINuTFT1YBtCt
 dh2zmie0tfvM+M4jjBhF6zEptWRgP3VqeID/xIKcFh/bdW1wFEq4dUbNk g==;
X-CSE-ConnectionGUID: m3J/djhSROmfkQSxt0bV/A==
X-CSE-MsgGUID: hdXHbQw8RU+eLMwgm3+JiQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11459"; a="50825323"
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="50825323"
Received: from fmviesa007.fm.intel.com ([10.60.135.147])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:14:14 -0700
X-CSE-ConnectionGUID: TatvVa0CQKmyDcoqz855aw==
X-CSE-MsgGUID: J7GhPAZxTQO9HwBM+XCu9g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,223,1744095600"; d="scan'208";a="146553510"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa007.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Jun 2025 15:14:14 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 9 Jun 2025 15:14:13 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 9 Jun 2025 15:14:13 -0700
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (40.107.92.71) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Mon, 9 Jun 2025 15:14:13 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wk7brxBJcyaz469BlksyONz2LNF9E8BUPZDzOaD+N29ny2b+CWtzxpESdiv2bJCOSoq4XjnYwVtfytiU8p3cbaccfY9LMzd0tl7NKnn9A1Ly1nPOxBh2k4fUxSQcSwCxj4QREPuhB48JydVPdq/m3d16PNIJ6yPZGEkwh0s24Ckph9+1F0SVNLMQyOfAP9AFpsG0W5XSjnSdtFCTEEoilypvU23fnYk31/zW7negbACnFVXqUU55vxlq/wwc2DHQyBGEDa0g9wi7p8NRcYShlthzb2PYaqqFrYOFWTl2YdhyqxtcYDKQhIKCGkIwuLMI8Pf4uW/zKpb8ToNZCHfyWQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hktVRud4xtD/SCeOnIX1JF29ZGVcxpCuqrATC72XnW0=;
 b=Zac/+OkOHtMhi8SKhZr9SaatzGo4F6TgnTX1S7X6pVgnY0vvDjqUPvh/l465gcwQmTgneOZf13c8QVuggsFrfzXqqEBLOg0sYQ8nHqkkQuNYsir/mRo65Dv5TfIH6BUedH3a6TjB68KYTriS1KJ8Ki20/hI5KKJ4V1eosk/ueP2iIr6CHuykYUkdnCuMgkhTj3WBZflzIQk3d86ck0hMyz7r7wczs7/whvdYljs48+C8rO4SFpt13+LiZNhRQJ5QKJQr3o0fto/4EDP50Cwdvc2gMFagfnl5skrlAahC1C/0zEE2jPZpTrq+zIX3rXA1tPyS5ltmdMoExPj8hWPncA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by SJ5PPFD56E32CC2.namprd11.prod.outlook.com
 (2603:10b6:a0f:fc02::859) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8813.26; Mon, 9 Jun
 2025 22:13:30 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8813.020; Mon, 9 Jun 2025
 22:13:30 +0000
Message-ID: <c9ff6291-82a6-4412-80e1-1d9cdaf8a55e@intel.com>
Date: Mon, 9 Jun 2025 15:13:28 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe: Make force_reset attributes write-only
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
References: <20250603192218.637-1-michal.wajdeczko@intel.com>
Content-Language: en-US
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <20250603192218.637-1-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR03CA0326.namprd03.prod.outlook.com
 (2603:10b6:303:dd::31) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|SJ5PPFD56E32CC2:EE_
X-MS-Office365-Filtering-Correlation-Id: d9f98a6a-3333-4aa3-9f87-08dda7a2dd67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?djhoYjBCQU1ZekJsV1ZGcWFka0pycHVwUVRHSHVlV1Zkdnk5K0tFNDI5K3lv?=
 =?utf-8?B?d0R1YWVxNzRCbVZka0NORFNIano5Z3U0Rm1icFpBREVJM1ExNXQyN3FkaVNa?=
 =?utf-8?B?RERSTWhNeEpNb2YrenU1OER5RG8zT2lma2xiSk9CODNaczVZOTdXWThvUnNY?=
 =?utf-8?B?T3dHSFNnbU1FRThXV0JSVlBNL0xERDZJMW11bTlvckZkR0ZPbTJYTWhqenhj?=
 =?utf-8?B?NXlTZG44dzkySWNmaHVDZmZacmgxUm85N042ZCtBOE5ZaGhoWHdWT1Z4SzNO?=
 =?utf-8?B?RjluNS9LK3p6SFVNeTlQYUt1OEIxQ0hxZ1dYeGJrbEJmOEQ1VnhLblFuWjFa?=
 =?utf-8?B?bVJPVkdtTUxCSm9LWVJ6cVY1K0JwTVZSYW4zZUVrZFA4cUxGcGtFa1ZNS01U?=
 =?utf-8?B?dWJ2cmVic0tIRXM5TjgwdVVScktNSWVCUnJUdHQzN1RNUmdTekc5c1Ntc1dH?=
 =?utf-8?B?RG9RYUZtbFJHOVZFc05ZQXZsQUxramp5SnN1K0ZqRXdJQUNVQytEazRMY2tT?=
 =?utf-8?B?OEpvanQzVVpNUk9RK2RHQk5BcEZPWTZmcytZdXYyMnFqcVVIWEE5T3R1QWh2?=
 =?utf-8?B?UmZhdUdvc09hMUdZYnNiQmhwVE14bTBrYTNLM01aTEZjWmNNMUNwNGRjUmN0?=
 =?utf-8?B?NUFQMll5VTJJVjMzM0NyMEpMWnlLZDFGc0NGcFRtUUdnZFJiSUFxUnlvSFRh?=
 =?utf-8?B?bGlHN1FMMGF0WWFrVFM5bXpuVlN1YjFQRkwrTjk1K1dJQXdEWlhDSFZpOHFJ?=
 =?utf-8?B?cjZqQmNCVm1oR0pNdGtEenBTU0Rtc2I4VXhpT1MydXdyWkJzK2tkUVNlSU4x?=
 =?utf-8?B?R21BWEp6WGRiam5CK3MvU3UvOFIrZzRNWHBSL2NGazZ2MDJBMmFXQWlLQmsv?=
 =?utf-8?B?djZKRTRqWnVHaDZBejJzMHZTR2pZcTRqd1hub2M2REZ6eEtLNlQrU2tOcmlq?=
 =?utf-8?B?bURnYS9CUlVqQ2pwSDZXYVVUZm44a0w3bHJiS0l1L095U3RYbGJ3OHphRWRj?=
 =?utf-8?B?cklDN0gyVmFTa0VnYUsrQVd2eW5SK1lidGRkemZBRFI2Q09zOHNwZy9GWXo4?=
 =?utf-8?B?N1JnYU9OeWFYcS9FaUZNTnhaMWh0RWFJZXl6cExEWERBRUE0eXFEVEFsMDdx?=
 =?utf-8?B?VWN2OG10UUZXVkE4NXQ3WnNlS0phZ0gzMVFVclBNdnFTallndXBjZXRBejJp?=
 =?utf-8?B?QmxTMW5OMlc4Q2FiTFdNNUNld0hzWVVZaEQ4bWQvdWpUdWhvTGd4eFRYR2ht?=
 =?utf-8?B?eEhsZHVjaERXY3g0SE1pQnJhMW13Z1k1bTh0MDNhWklEaU9hVDBpNk1tZEZ0?=
 =?utf-8?B?UmR1VCthT2IzUm0rUnJhcWw3bnlMNlVLN2Q1YnNuWkpPaUJycWQrYW82SzZ6?=
 =?utf-8?B?aHNjOXlFVEFtZkZYWC9tY3VvRUYwQ1J6WjhLamUyL1ppK1ZCR3VLODZycTdu?=
 =?utf-8?B?NDY0NkdSdnIycElDT0NpMENBSlZmUDlIY1dNclJhNmNkV3NYQ2xaN3FFbFdL?=
 =?utf-8?B?QnhuSSt6OWlFUjVzbXdtZi9iSkkrN0FsNFZTVjN1RGJZcEkvSG84eTMzMEcz?=
 =?utf-8?B?am1xQkJDMzdlVHRNWnNVcFRKM2NFTXArRGtZemlKR1o1WTBLckI5cEhZU0s5?=
 =?utf-8?B?OWkvd0tMRXFnZnNFSzZ4VGRPckFRbmJVMU1NNXZBODMvTTFtcHdlK0VBTkps?=
 =?utf-8?B?QzZLZXpnT2NQMkczQ0ZlSW95YXB5bE5Db2llMjQ2MmR4YXBXSUcwbU5aL1dj?=
 =?utf-8?B?bHNMa1dQcng3bnJKWFpHREhDaGZyQkh0SWE5bUdmUVluRWtFYncyRTQrTmJi?=
 =?utf-8?B?bFBITjErRWgvZ0lQNVY2OXp1ZCtpUlM2OTdtZCtXSlRUREtVa1hTd3psS014?=
 =?utf-8?B?WFFmdFVsM0lYVXRvV0hsdEtZVFVqWlNlanc2Sjk3eXNIVzN4RFNsaXhNa1ZM?=
 =?utf-8?Q?iO/RFGzdFws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N25yZmVSbURQUm1vMVRMVHhCZWNKZHJXZERzeWlQbWQ0U3VZcE1UdTYzNzJ0?=
 =?utf-8?B?L09XakdyVE04RGd3OWovMjN4VG5mbWx6cEtxNGhtNCsxTU9KVmNzQnBaS05l?=
 =?utf-8?B?d094bG85dmxrNEdsSWVQUklNQmg1UEN3RW1VZXRNUHBZT250V0dURytoT2N0?=
 =?utf-8?B?UnpEVmozZXdPUmZYNkRMS2FYQ3pSUWtnbnBJemsrNTVIQklDVjFvaUw0dXBM?=
 =?utf-8?B?WkZHY0F2S1pOL0ljaFdKbG9mS2hHcUNoK3N0RFk4K25EV0JzeW40Q0x2VE1o?=
 =?utf-8?B?U0ZodndyUlRXNjhzZ2NyR3kzTUJGdkZScHBjYjhSQ0VZdXFzbkR5UmlKWGZu?=
 =?utf-8?B?M3YzdXVqR1crRXlBZW04RWpJK25WdUNzZDZVdXRqSkJGdkNtWTd0c3BtbHhX?=
 =?utf-8?B?ZjBNd1NXbmR1V3Q2bmIwYldaWEtNN200dENEZUwyMmk4disrdEdvV000RzMx?=
 =?utf-8?B?MTBYV1E5WUZDTzRmN1pkOVhyNHYvV3VkNEV5UmszbWxUNnp5cVgyMWkxekR6?=
 =?utf-8?B?b2p2YTVPU1d1V05lcFlKOHpGQzdhcENZN0lsSzdNeGpwRmxuVkpTa3dBWkZv?=
 =?utf-8?B?eDA2OVpGcjdpdHRHSVYyUElWZE5BTnV5VDkxczV6c1RDRElYR0N6b1d6Y29R?=
 =?utf-8?B?NnFVOTFsMVczNGQ3aGw5d2dzVW1xTTVYUTNYc1M3cXZuUWE1RTJLRGMxNEVR?=
 =?utf-8?B?U3JBV3lRaG1PYmlNV2NnZlB1QXN5V3JCd3d6UUpldDlxaHhzTkFRRnN6RUNz?=
 =?utf-8?B?dGg4UHlLTDdMTSt4TWZwRERhS3ZoZ1lORS9zN2hCNzFLVld2cGxjWFRqRnhI?=
 =?utf-8?B?Z2dBajRQQW8rd2hFeVJoU09pRU1tNUp4STVJbEFKaHlVTUxjSlgxV2lPOEYx?=
 =?utf-8?B?cmJHbE1udFZOcUd1dkUvNTRaemF2MjJPSXdrY0w5dVNNVWxBNWpsQWtKYXZy?=
 =?utf-8?B?Q2NMcGdnM0NtQWdYSEJMMU1yZWtmK2VuZ0hzSVA1TWxMUEtrWi9SMGQyaURw?=
 =?utf-8?B?bmlZUEEwaDlxYW0xcTlxbVRVbHg3NXdCRkZXN0JpNklQQ3FJbUx5RzRnemxa?=
 =?utf-8?B?YmxYZXZaYzVGUENiNUZ6OUNRNU43NFBDYmlkZ0tFeHBmb2dZeEdQT2FkNmMy?=
 =?utf-8?B?OTBUTzdTRzF6aDFKQmU5emluc3lJYk5FUXkrUkJHR1dCVlgzcFlKcHYvVDRM?=
 =?utf-8?B?d0lyYmtvcm9GV1BFRkIzbHJubUtmbTdReHJ2dmxBR2NLemlyMjhPM3VncFZ6?=
 =?utf-8?B?cGE4Qll4UHpnWlhLZjhWZ1ZXS0pkRmlBVUhvU2N2UjRyQUdGMzBrNlI2SGVW?=
 =?utf-8?B?TjlrNkFaazIzRWVKY0lmODFZUnBzQm1pdElYRlNZOXl0c05pWHJhK1RPNUFh?=
 =?utf-8?B?WWZFOVgveWJoWWxmZ1lvTFlXM044T29ja0cwdHZiS21mU3VtSEo4TVVFRTh5?=
 =?utf-8?B?RGNmdURKN3pHNlVtZVBkYWdvQlhnbjFlTUh6OTQ0UDV0Y2owSjNPUTVNaEtn?=
 =?utf-8?B?SlYzQ1I3OTdTRk1FWmJHam13dVNSNXZwMmE5Y0FudWdJYTM2RmtDdWc3bmZW?=
 =?utf-8?B?a2tjL3k3dElqM0d1Y2NjY0RqVzU4SzNhNTRuYjBaTlZBSnZuS2t0QWZkVzBS?=
 =?utf-8?B?RjBOc2tvOWc0SWRxUHl5djU4SGk5V0J4ajEwUFVROTdqT3d2ZHRaUGFWUUJD?=
 =?utf-8?B?UDNoYzRhOE5xdlVOeFZmelBBK1VOVjdnY2gvWnE4MlRuUUNoYlFFZG8yMWov?=
 =?utf-8?B?Ukc4aDd2RUoyQmVHZ011ajlqSlY1dWt5S2djMTlUMk0yUVBUaFYvWncxMDBv?=
 =?utf-8?B?bktJdEEzTWwvM1h1Tnc4TU9FVndWbmhNVTUrZ04rRVVVVHE2WHhYemN1WVBB?=
 =?utf-8?B?N282QjZxbG5YNjYxVkxSWTdSenhDdlBGNDNHYmJWd1pTUlZ2YmdDY2Y2am9q?=
 =?utf-8?B?alNuM0tNeEMxLzFSbVhKdmFBVXNERHEwa0FrN1ZLWnhSNHdOdzlDeGYvRzd0?=
 =?utf-8?B?VkhlY28xdVFTOEtsQlF5L08xV0NuK2t5RzR3QTNsL1p0cVV4ejdtQnVRa0JL?=
 =?utf-8?B?TUR6SzYrV3RYRTgxTElNNm54MGZ1b3pMSE5pL205dmZ3UW5wWVhucG80T1d2?=
 =?utf-8?B?NFp6MUp5WHY4bFlVTHd4YVN3M3dJVWZrMEtHcHBLMXZyRCtoNUxwZFo5TFZr?=
 =?utf-8?B?dVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d9f98a6a-3333-4aa3-9f87-08dda7a2dd67
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jun 2025 22:13:29.9502 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NMUe4/Y+En93Sl7e+9+CYdu4vgbwPqCRYz4DumQhM552c6Gm3Yy1bhFews35NJEv5v9zzYWSXjPLMjL9Jp21p2RjsTRpvoJULrB3PnVSxks=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFD56E32CC2
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

On 6/3/2025 12:22 PM, Michal Wajdeczko wrote:
> Stop supporting triggering GT resets from readoperations, as main
> user of this feature (IGT) already switched to use write operation.
>
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: John Harrison <John.C.Harrison@Intel.com>
> ---
>   drivers/gpu/drm/xe/xe_gt_debugfs.c | 10 ++--------
>   1 file changed, 2 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_gt_debugfs.c b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> index 848618acdca8..3afd0d58fa6b 100644
> --- a/drivers/gpu/drm/xe/xe_gt_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_gt_debugfs.c
> @@ -349,9 +349,6 @@ static ssize_t force_reset_write(struct file *file,
>   
>   static int force_reset_show(struct seq_file *s, void *unused)
>   {
> -	struct xe_gt *gt = s->private;
> -
> -	force_reset(gt); /* to be deprecated! */
>   	return 0;
>   }
>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset);
> @@ -377,9 +374,6 @@ static ssize_t force_reset_sync_write(struct file *file,
>   
>   static int force_reset_sync_show(struct seq_file *s, void *unused)
>   {
> -	struct xe_gt *gt = s->private;
> -
> -	force_reset_sync(gt); /* to be deprecated! */
>   	return 0;
>   }
>   DEFINE_SHOW_STORE_ATTRIBUTE(force_reset_sync);
Is the show function still needed for either of these if they are now 
read only?

John.

> @@ -408,8 +402,8 @@ void xe_gt_debugfs_register(struct xe_gt *gt)
>   	root->d_inode->i_private = gt;
>   
>   	/* VF safe */
> -	debugfs_create_file("force_reset", 0600, root, gt, &force_reset_fops);
> -	debugfs_create_file("force_reset_sync", 0600, root, gt, &force_reset_sync_fops);
> +	debugfs_create_file("force_reset", 0200, root, gt, &force_reset_fops);
> +	debugfs_create_file("force_reset_sync", 0200, root, gt, &force_reset_sync_fops);
>   
>   	drm_debugfs_create_files(vf_safe_debugfs_list,
>   				 ARRAY_SIZE(vf_safe_debugfs_list),

