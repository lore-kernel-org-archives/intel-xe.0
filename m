Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA6C4CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 14:27:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C06D10E1A0;
	Thu,  2 Oct 2025 14:27:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="miqsbWiT";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 17CE410E1A0
 for <intel-xe@lists.freedesktop.org>; Thu,  2 Oct 2025 14:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759415229; x=1790951229;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=aJSAegNsYV+odOJly/koJ+jbaQiD5Sbz0THZ2eueOns=;
 b=miqsbWiTstqRLdRDbmc3Rt3XLu8x6g6xsQuo5V0Li0PFp1cWcrwR6nvG
 PIo5em8OpdTwd0lrKQ1u8XNHjNQ129fng3I0CykTw6qYtKJ+9Gq3sqDv3
 P9lTuRvSSE82FbGA3E3pZZ4un7IyduW598uVPpTHp6YM69HgnzrZhdBxY
 L7aXTTPBXnyJcdPx7pIu9ugzKBm0Fp8fh4woYWBe4PlMcIowMwN9I1MwO
 tB4uQTEK2yIJWf8nQ3RN5fNxjJGsQWq5DDDuaqydtJ7JbERZ+ybMtfz54
 sIEUJnoqMLJkWOQ8hlXWvSOf19qXRjuu5bTlcz8FvXqgeipJ5FPR56NEO g==;
X-CSE-ConnectionGUID: qDm41VEKSdaUqP/0HWs2cw==
X-CSE-MsgGUID: WKbOrEzxSYiHAf8qHLE1lA==
X-IronPort-AV: E=McAfee;i="6800,10657,11570"; a="79348586"
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="79348586"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:27:02 -0700
X-CSE-ConnectionGUID: LrGhsSflRxGDfDX/6e6pOQ==
X-CSE-MsgGUID: g6+56eJXQe2fCp3/IcncWQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,309,1751266800"; d="scan'208";a="179071727"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa008.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Oct 2025 07:27:02 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:27:00 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Thu, 2 Oct 2025 07:27:00 -0700
Received: from DM1PR04CU001.outbound.protection.outlook.com (52.101.61.29) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Thu, 2 Oct 2025 07:26:59 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eN27q07Sj05IvX2I/aO69HpFFQFB3XZupA6qAOHbQAUylswR9UlaxDeyRdytr4GOp0Gm2YZHQ2ICnyFXrYa1cxc26euITScBsoAGBK3VWAUQFgo6jyxXhhYof7rBzl5jGsx5dbzkDNWzptqhluNF4reSolzSm8VW8XTZM6vTlLKulSfNksAStSOUy/HF4NTacoAzcMsxUARNzQLiQ7sxsURRqDE16Wb9TdydqweATr+saUcHxJ6K87eEPLc+8tjp8BnFUSIUSmyW89GxMhhZAyyPvcI6yRRXtqyUqdFU+HKFhuFWn3DsBRsjbR2sJmRsP8YGDprAG13ohA8+eOY1vg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3cwgtTc82awNwCFtfE+nZfVFQuKfafIV586avjg02h0=;
 b=sWlY4f9mGdep1NwlQo+d/mSxh1HWCvu0AnfblrQbnjx1s9FhcTzv+fPKOdD5vfIzjmHflvqrgAMvX9q4UMm+/rFvMSoVLm+HGDBkfVOrEHtvO+rvyFZYzS5rIXB9pCYKsYNfBnY043n2iAxi6/CFf1eIBrQuPZKfk02N0yHyqo9OPPzJDuQTTOvSOVsG3zZ5JgbxjOmOH3pPMhwNKSo81w4nje4jHVhoYcr3RAme/d6lZkO+nycD0Zsd4gwLmOoBJKTM73PoOEm23YOxRKZilDSLcbvAcDndQLCwvMkZQAnxidUJqdkj2JBcTydkqKD8bJhYDq9UwRv1NR+fqurGKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB7104.namprd11.prod.outlook.com (2603:10b6:303:22e::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.18; Thu, 2 Oct
 2025 14:26:45 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%7]) with mapi id 15.20.9160.015; Thu, 2 Oct 2025
 14:26:45 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250930225618.140071-38-matthew.d.roper@intel.com>
References: <20250930225618.140071-25-matthew.d.roper@intel.com>
 <20250930225618.140071-38-matthew.d.roper@intel.com>
Subject: Re: [PATCH v3 13/23] drm/xe: Make display part of Wa_22019338487 a
 device workaround
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: <matthew.d.roper@intel.com>
To: Matt Roper <matthew.d.roper@intel.com>, <intel-xe@lists.freedesktop.org>
Date: Thu, 2 Oct 2025 11:26:40 -0300
Message-ID: <175941520048.1952.3393510427815057372@intel.com>
User-Agent: alot/0.12.dev22+g972188619
X-ClientProxiedBy: BYAPR07CA0083.namprd07.prod.outlook.com
 (2603:10b6:a03:12b::24) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB7104:EE_
X-MS-Office365-Filtering-Correlation-Id: b56831e5-da35-4604-2c2f-08de01bfb69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWJWSUM1MlpEb2xJdnNMZXNPYlBJbFl4UVJ2MWJ5Ykk5eldJYUtKVWU0Y2JL?=
 =?utf-8?B?NExQM3QraHBzM3lVZHlJckowYTR6S0FUUG8wcDdUUHRYV3RNaHdNUDVnU09h?=
 =?utf-8?B?ZlB2dmFIdVZrazgwdTlrZjRUVnlEWGF3b3FIYVNOT3BCQ0pubVVIdmFFcm1w?=
 =?utf-8?B?andjSVdRdDBBcm9pNnpNZnFmWDZJVVVHdWRGSW04Sy8reEZMdGxXcWtyMlE4?=
 =?utf-8?B?MkVsSUR0akF4VHV0UkRjNTNzRGNtVS8rM2p4dFJnYTd2NlVKeHdSSlh5amNJ?=
 =?utf-8?B?cUZyZTUvampxOGFncCtzaHFTM0MycVZybHpQeEVCU0NiQ1JjeHUzQjlpWi9K?=
 =?utf-8?B?VmJiNVluVk4rS1BMOFQ4VDU2RFZraXZ6U0VGVkJmWmpLRmgwZXRzd3dTLzFi?=
 =?utf-8?B?aE9mK0pjbU5KK1lWdDltM3VXMUR4Ni9EbUdjUm1vbExNTThzMnNRUW9jTWNP?=
 =?utf-8?B?SFgzQUV2MEFHaHNmRUVmSE9NVHFhOWFZWGVTVXpHZUovNmh0V1dzSjQwN2lN?=
 =?utf-8?B?aW9TMmJGTzlySDFaektOMVNEbER3cWpYR2pNSVQyaGRLc1RsUjJGTzdCRkd0?=
 =?utf-8?B?S2h1MnBoL0tTcC9hWXlmM202bG9PdHpCN1pXM0xtMDdveExBZWl5djI1MzU4?=
 =?utf-8?B?VEZ6c2FROEFCTFBRZWpYNjQ1OXg4Tzk4RTFDV29RUDcyNWZxZHVYTVR4NzUw?=
 =?utf-8?B?NjhzVFBtdWo1V2V1Mmp2T3NLUnNmcjhLYjhpV045ekJ5QndDSjhTQkNFNzli?=
 =?utf-8?B?cTBGazR5a0s4akc5Z2xMR1BRWlVKV3BDL2kvNmUxcXU5RXhXbDJsR2tFWTlY?=
 =?utf-8?B?aVA2SlVtTUtSRUhFL2NxandKbTMwbmR6VFYyd2RQa3V4aHRwYXgxRk9kLzVI?=
 =?utf-8?B?Z2xEaGduTXptNEFwN0loNERLWS93OUdmd2NsMnc5MVJvRnhCL1Z3ZG1ucyt1?=
 =?utf-8?B?dzZzaVM3TkFoWUZNRVpIaXpMOXZHRHBEdWNDalNHYTRvNWxIVWwyb3h6N2xn?=
 =?utf-8?B?MCtrTWEwUVQ2SUlHRHVjNlhtN2NrY0czN3Jidzh4QzFYcTc3azZMcURVUWdq?=
 =?utf-8?B?TWJWU1VNVTRBU0RpcHo1Y2hmMVkxcENzVFcvb3dvc0lqL2s5TUtYKzVjdVFo?=
 =?utf-8?B?aENsOGlmUkFPTGkyYU9kMHhvZUQrNXg3b1JyM2s5UWhJYTRJNS9uU055QXlk?=
 =?utf-8?B?MzNxVnVVQnVpTUtQNkRJbUhpcUswMmppUnpFVW9vTXBtTGgvRm0zclRzZWds?=
 =?utf-8?B?ZUloRUxFbDY2dUJaSU9vTC9HNlFRR3JEWjFHYlplUXhBbjMwZ0c3dXdOaWF6?=
 =?utf-8?B?WlRLZ0IzMlJyM3FibHFhUWlFL0F3ODkwZWt2S1BGZkdPaENxcjV5WDBiS3ZU?=
 =?utf-8?B?YnlPYUYwd2lzelFyOEdrTTJOTDREOXhUOEt1M2luaDFJTWNRMjFXRmxvVUVr?=
 =?utf-8?B?MTJKMjlKYWNFOWlvZ25zRkZQYnRuQjB3OUFtejZ4QnhXVzlEaHhnTU9kZnkw?=
 =?utf-8?B?SVprVmd2Lys0QmJhWDhIb3JYT3YrMTNHTnJQMnpMZnFLVkt3K1A0dG9EUXI1?=
 =?utf-8?B?WEN2TXg2bU5JN0E2VjdRNDFJZjhsc2k3dlNyalZ1ZlZEaDRtU2V1am81RVpG?=
 =?utf-8?B?Vm05Yk1VZUNUVHFtNUJlYS83QkZCMmRmTTJlSWkrZEwrVkMyTDBZMVZQVkN1?=
 =?utf-8?B?U0p3QUZhWGVmSHdyN2tvZnNqSGg1Z0MwVEl0c252cUpsUlpzKzdITnJtQ1Ji?=
 =?utf-8?B?STQrdzF1RnRHZm5LdmV3dHdoa1krM0xGbllJN093a2NocTdVNThTcWx2VjVU?=
 =?utf-8?B?em5yWXNmU0VQRmVzN0hGd0Uydm1SQ1hiRC9yRnVvcGtaSEwrTTZHY3Z0VzFQ?=
 =?utf-8?B?Tmo4cVJ6azVWb0IrNzFvbXpyYlpNNEkrbmxZNWMyUlYyS0pvQ1Fsb2M1MFBM?=
 =?utf-8?Q?YR7882oIBoSqXywdugvOiqiGBlwfpN7N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UDZxM3FKZlJhUDg1TUt3RS8wcUdza0lNUzhVWnRtbjFvWUt6WENmMWdYMk1X?=
 =?utf-8?B?VWh2ajVqa2FITGlOWXl4V2Q2K2tCS1VSckJ5U1hoT3BSSTZEamdsREM3RUJL?=
 =?utf-8?B?UmZpSmUwSkdRUHpYYS9YV2paOUN3RTl1WUgwVi8yS3p6ci83VVdXZ2ZWcjVu?=
 =?utf-8?B?NkxldStJMUZrRE1ZQnBlRzlJSk9pY0JBNnEySUFUczFueTlPT2Jhb3ZRbUNF?=
 =?utf-8?B?RWRKMXdKeHVBNHZRQTlxeXBUcTRjRlpnQTZZVVU2YUt3MUJMaGswaENNcTI3?=
 =?utf-8?B?c2oxdDJpVDFZK0pTN0MyVFFEMnFHZW1WWFBvMU9LZjdpZmZHbDdXUXFWcmRn?=
 =?utf-8?B?M21vbndBWXA1NHZQM0VGTzJBTkFsU0lrUnJBVVFKbW1wNXFlZHl6M2hHY1ZZ?=
 =?utf-8?B?MWwzVlBtbVFHWkNHNk9zRTYxT1VjbFFHT3lMOUwyQUdOdStaZ0V2RzVjU0Vu?=
 =?utf-8?B?ZHg2WmVKejFqR0lVNVFKNGd4NzdoQjRKS25BRUFlb2JqMlEwaUh2Nzd1TnVt?=
 =?utf-8?B?NUZiSmRjMCs0Zk5reUF5b1NJd2NMN1p0aXFNQWxpdzlHNG83cFpaTmliTlBN?=
 =?utf-8?B?THpjdjFkY0VTSFJId0hjTUt4VVRjclFCeFdHVTdGcm9UZGFiR0UwRjBuZXJ2?=
 =?utf-8?B?VXJDdkNMNDZMdXZmTnN5MitOM3Y3VXRGK21YenhpZ1Yra1BwQkJwMy9XUW1o?=
 =?utf-8?B?YnE3UTdwQ0EzTjJzZXFCYjN6OGpJaFJHMlI3UytmVGVlTXA0ekpDaG1xUU9F?=
 =?utf-8?B?UjdkODBwYWwwMXZRampka2twMitHblhsVlFuajgzZE5tbWFSbGY3bnk2RFkx?=
 =?utf-8?B?UmFuUFpVTmVyVjZEQzY2SHkwLzVPcFplM1VNV0JnMzduRkNoZHhmNzM5Nys0?=
 =?utf-8?B?Z1RUcUZmTzVTQzlSOFI1eGF1R3ZBeWF0SGNlQ3Z0REZQMUtHcWVHRE5qL0Rk?=
 =?utf-8?B?N3VleEFLYit0YkoxK1VhOHNUVjR4UFNDa05uNWVvSyt4MDh0bktid0tySlpH?=
 =?utf-8?B?YUQyMjVUQU9aaDRLemYyZEY1ZDFvcE9KTllVWWtUTDVoMXBoTHdyWkJIWVUx?=
 =?utf-8?B?TVZXNnl3NktDY3dMb3pUNmVNdHZBT2JPK3dlZ3VWUDd5WmVGWFMxSmxKaHcr?=
 =?utf-8?B?bU1rVU5kUmJNTnNSRFVTVjBKRVhwbHVuRzBVTTRRUGlWeTJSMURzem9HK0lK?=
 =?utf-8?B?bmY0N0VGMERLWmpldE5SVmYxOTZZNDlqUzNXMHJoZS9KRjg2VmU1SFRxa1Zm?=
 =?utf-8?B?RzNsQnp1WXRGMmVDM1hURHBxaDV4NWQ3M1ZQaHcvNXBrYWYybXpoUU5vZHds?=
 =?utf-8?B?UzRJai8xeGxPeXgrTFJ1RWpIci9uT0M0N1BKdjdyVGN6amM1cEw1WG5nL3Vw?=
 =?utf-8?B?ekUxNHBmTnFMYUVYbHJXRTNmbXhVVXRTanJrUUZzdy9ZVnh4bFJLNjNJdlR2?=
 =?utf-8?B?ZWZ3bE5Nblp1NU5Bc3RhSElJYkVuTjY3clc1dU5CRVlKUUhjQWVoWkVzTUox?=
 =?utf-8?B?aWxPR2xVZEJ1eS93UmtFVUMwMitCSG1jNEhDZjdlcFJ1dXZ2Y1R0NzViMHhU?=
 =?utf-8?B?VndEbWRRNEdOcXN0ek1VVnowcExjS3NkaWhVczAxUVJaN0hidlViK0hQajl1?=
 =?utf-8?B?c2dVZkMvNlNabnRzZ2pyWmRYS2doNzNYYjVFQVpoOGJIYjhxaG13cU1wa0NS?=
 =?utf-8?B?MzZFTFpPNVBBRlhqVmIyVTlOK3ZUYmlJcjlndGNrbzF4MXYwZzNpL0ZDZDN2?=
 =?utf-8?B?Uytiek9lMUlFM3JmWGxFNEd3bFd1TEdGOEZZNkRzbkdDQWJ4NUNZUTJVUHZK?=
 =?utf-8?B?bkdsVGJYdXQ2S2hJcVdRTlY0UElnMngyeEd5bHB2NzV6K0xabVk0Wmc5ZW0y?=
 =?utf-8?B?VWFOZUlubG1jaEtpSWg2a1k1T0phK3Job1dYWE9HNXJ3czd6MjlYTkZQNXdw?=
 =?utf-8?B?TFhGaHA5ZWc1NHQyRmNWSjdqZHBKcWRoRGhodTNxU1ZQdlh1eVFPcEFNT1VK?=
 =?utf-8?B?ZlJuV3JPTzdXMmhhNTlqM3N5WklWUUwyRTdPY3dXVjFCSFloLzVFb0hHSC9v?=
 =?utf-8?B?YTBWVWRrbkh4Tkh4T0o1cHN5NStTMy9lcXpETXhUTXhmUXdhdWVEbkUreit5?=
 =?utf-8?B?SUdPS2Y5SHpacWppV3BweVhWMlNBYkRIcldnKzJmQ1dBVUNFN1loOUFEenFy?=
 =?utf-8?B?eVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: b56831e5-da35-4604-2c2f-08de01bfb69f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Oct 2025 14:26:44.9461 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JoUQ5hzFHEBg7t6HPdm5CkU9a8a9KHcsUPWhXp8Ooc6prOyAfNDfcVd9dukL7yA71dpqggTKZaIYuUiF7yu81A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB7104
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

Quoting Matt Roper (2025-09-30 19:56:30-03:00)
>The display part of Wa_22019338487 (i.e., avoiding use of stolen memory)
>is using a platform test rather than an graphics/media IP test.  Since
>this workaround is focused on non-GT uses of stolen memory, it makes
>sense that we'd want to still apply the workaround on affected platforms
>even if the GTs themselves are disabled via configfs.
>
>Signed-off-by: Matt Roper <matthew.d.roper@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/display/intel_fbdev_fb.c   | 4 ++--
> drivers/gpu/drm/xe/display/xe_plane_initial.c | 4 ++--
> drivers/gpu/drm/xe/xe_device_wa_oob.rules     | 1 +
> drivers/gpu/drm/xe/xe_wa_oob.rules            | 1 -
> 4 files changed, 5 insertions(+), 5 deletions(-)
>
>diff --git a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c b/drivers/gpu/drm=
/xe/display/intel_fbdev_fb.c
>index 35a5b07eeba4..af72f7305e5a 100644
>--- a/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>+++ b/drivers/gpu/drm/xe/display/intel_fbdev_fb.c
>@@ -10,7 +10,7 @@
> #include "xe_ttm_stolen_mgr.h"
> #include "xe_wa.h"
>=20
>-#include <generated/xe_wa_oob.h>
>+#include <generated/xe_device_wa_oob.h>
>=20
> struct drm_gem_object *intel_fbdev_fb_bo_create(struct drm_device *drm, i=
nt size)
> {
>@@ -19,7 +19,7 @@ struct drm_gem_object *intel_fbdev_fb_bo_create(struct d=
rm_device *drm, int size
>=20
>         obj =3D ERR_PTR(-ENODEV);
>=20
>-        if (!IS_DGFX(xe) && !XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_di=
splay)) {
>+        if (!IS_DGFX(xe) && !XE_DEVICE_WA(xe, 22019338487_display)) {
>                 obj =3D xe_bo_create_pin_map_novm(xe, xe_device_get_root_=
tile(xe),
>                                                 size,
>                                                 ttm_bo_type_kernel, XE_BO=
_FLAG_SCANOUT |
>diff --git a/drivers/gpu/drm/xe/display/xe_plane_initial.c b/drivers/gpu/d=
rm/xe/display/xe_plane_initial.c
>index 94f00def811b..12d25c5290fd 100644
>--- a/drivers/gpu/drm/xe/display/xe_plane_initial.c
>+++ b/drivers/gpu/drm/xe/display/xe_plane_initial.c
>@@ -25,7 +25,7 @@
> #include "xe_vram_types.h"
> #include "xe_wa.h"
>=20
>-#include <generated/xe_wa_oob.h>
>+#include <generated/xe_device_wa_oob.h>
>=20
> void intel_plane_initial_vblank_wait(struct intel_crtc *crtc)
> {
>@@ -123,7 +123,7 @@ initial_plane_bo(struct xe_device *xe,
>                 phys_base =3D base;
>                 flags |=3D XE_BO_FLAG_STOLEN;
>=20
>-                if (XE_GT_WA(xe_root_mmio_gt(xe), 22019338487_display))
>+                if (XE_DEVICE_WA(xe, 22019338487_display))
>                         return NULL;
>=20
>                 /*
>diff --git a/drivers/gpu/drm/xe/xe_device_wa_oob.rules b/drivers/gpu/drm/x=
e/xe_device_wa_oob.rules
>index 3a0c4ccc4224..3cc93f0e77f8 100644
>--- a/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_device_wa_oob.rules
>@@ -1,2 +1,3 @@
> 15015404425     PLATFORM(LUNARLAKE)
>                 PLATFORM(PANTHERLAKE)
>+22019338487_display        PLATFORM(LUNARLAKE)
>diff --git a/drivers/gpu/drm/xe/xe_wa_oob.rules b/drivers/gpu/drm/xe/xe_wa=
_oob.rules
>index f3a6d5d239ce..eb761d30e066 100644
>--- a/drivers/gpu/drm/xe/xe_wa_oob.rules
>+++ b/drivers/gpu/drm/xe/xe_wa_oob.rules
>@@ -45,7 +45,6 @@
> 22019338487        MEDIA_VERSION(2000)
>                 GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf)
>                 MEDIA_VERSION(3000), MEDIA_STEP(A0, B0), FUNC(xe_rtp_matc=
h_not_sriov_vf)
>-22019338487_display        PLATFORM(LUNARLAKE)
> 16023588340        GRAPHICS_VERSION(2001), FUNC(xe_rtp_match_not_sriov_vf=
)
> 14019789679        GRAPHICS_VERSION(1255)
>                 GRAPHICS_VERSION_RANGE(1270, 2004)
>--=20
>2.51.0
>
