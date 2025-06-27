Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59484C77B7F
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 10:04:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204CF10E9B3;
	Fri, 27 Jun 2025 10:04:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Cdk/RpMS";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31B1410E9B0
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 10:04:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751018640; x=1782554640;
 h=from:to:cc:subject:date:message-id:in-reply-to:
 references:content-transfer-encoding:mime-version;
 bh=OaIMNzPlu9XAM79DLd9Dztdiauk6VMtXnausYPy7a10=;
 b=Cdk/RpMSbWHmg/LViwmGmphsIfqXQnNbceQ4ELVjivdY1OZPfvpyHB+z
 MAyqkID7SV9SKadw3KmuAbmUgHWQxPoff5511bzUpX7aaccVkIzVQzoce
 M/kW4hMD0fHuyLX2QcGxj70x1L6W4zWBRbVnT6F8MzvIPzFZykZYdB9kf
 bsdBU3soW1G2EG/GCOPmI4gIP1MGrmJJJqF0qwrSXuRWT0aQLq/fGnbqN
 /VEMJUBfJ+nx2g4RJNtDgvtdYp6CIPzO50626ICejopJtGvM6O83d2iws
 BX0Idh5HMX289OQtA0WqFMzjhRMKpMQcqGIBX3K1dPl8qPkxSBDZ8Eg86 g==;
X-CSE-ConnectionGUID: HRNfSPVHRaWcleaITQpfVg==
X-CSE-MsgGUID: gJz64c+3QP2uxsEhwvdpTw==
X-IronPort-AV: E=McAfee;i="6800,10657,11476"; a="64019089"
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="64019089"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:04:00 -0700
X-CSE-ConnectionGUID: qLTYDZPcSaScADLSBQJMnQ==
X-CSE-MsgGUID: kvQM5d7yQN2sDBoIH18YzQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,270,1744095600"; d="scan'208";a="157314812"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 03:03:59 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:59 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 03:03:59 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (40.107.243.69)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 03:03:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HKaZe4wBi03U6kbSkA1jJNDyFfyadeaMau0zRY0MUGIFaBVw0lTzxQM4TposXCpo0GIjUv2Iyxy9roA6F1jrhiizuXBKDB2FrIO38F01COXYpg2kEUSYYFEgofMJ4yMvlW8t+NQwTKwEK7lVQQsjUtHQXFlvAdfJWxFZpYxBGCjyZL+CBZHglH1pkNB4x5Ewz5b9RTqdBOzBXTVkuW/B9k1satZQRpRefy2KPhpaItYNzpq2vjdVQ/DBK+ycuUKEyCMWE6IMspzwUxRd4X0M+7pnit6rFHsHodhUnG40EtiULrGaMB3/7lciC0eE1XO5BFjLcuU9cCzuuubXl+QZFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M51l9tM1TKXvygp61qSJ32vKUsWAbpJ2nhRpQtc/LSY=;
 b=ZKuFQZsBOk8pV1pYPEZIS7Q3K40pPC9n+Q4ECwzL/PJlMbTACyPfH+GkNVDYgNbjmX3/7xhDB2NIXUgbTAc4+D97PY9L/QaIrkcl+xohBzQvWOfOhIAwjRvdxJIYzbZMaJ2DMRdfWtKwzPjmb4K7AI2zlsnzFOgnSvWlLE5Z/NbD2ICivEocpBAgSToug45BkiOt/8c/V1RyfD28R9x82tK+ZcJFVWoQvfCkdRIq55MyAmc0YNTxAJRGgblwcpZG9ld98Z9dVgGB3AXTWAUqBZXGYlAxEck5pzGfAydjPDK0ggBIOlIXSWMajtqDqYx44xcWhOlhT0CAaKNuCfGP/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SN7PR11MB7042.namprd11.prod.outlook.com (2603:10b6:806:299::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8880.17; Fri, 27 Jun
 2025 10:03:32 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.8857.020; Fri, 27 Jun 2025
 10:03:32 +0000
From: =?UTF-8?q?Pi=C3=B3rkowski=2C=20Piotr?= <piotr.piorkowski@intel.com>
To: <intel-xe@lists.freedesktop.org>
CC: =?UTF-8?q?Piotr=20Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>, "Stuart
 Summers" <stuart.summers@intel.com>, Matthew Auld <matthew.auld@intel.com>,
 Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH v7 4/4] drm/xe: Unify the initialization of VRAM regions
Date: Fri, 27 Jun 2025 12:03:08 +0200
Message-ID: <20250627100308.3401653-5-piotr.piorkowski@intel.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
References: <20250627100308.3401653-1-piotr.piorkowski@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: DUZPR01CA0250.eurprd01.prod.exchangelabs.com
 (2603:10a6:10:4b5::6) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SN7PR11MB7042:EE_
X-MS-Office365-Filtering-Correlation-Id: cf18dd8c-09f0-44f0-f435-08ddb561df97
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?RFdQanZFclUwNC91WGlRM05VSTBpckNYUElnL2F6Wm03MEwxZlgycXJCTW9q?=
 =?utf-8?B?K1JkcFFJaG15TnFKaHByTHg4dk15em5XTHpDSTRwZ1QxVmV0UlN0dEE5RitX?=
 =?utf-8?B?cS9mbGcvdTlsTmpBNFpsa2pueTVwbzB2blRnYUdNNEJFYURBQTBTM1pUMnhN?=
 =?utf-8?B?d3M4dGRIanQ1VTlEM0Yrd2JtR0VzVFBPRnVtTjVudS8vOW5qUHpxWkJKR3ov?=
 =?utf-8?B?cHlXcFduNys0QkhqTHhlR3RuWlZVMnIzdm1iYk0rb2o1dGxJN3FXQ0tnd0xj?=
 =?utf-8?B?cFIzTWFVZGdQRjFDeDdjS2R1UlVBcGRKWVc4c0hXRDJnQkcwRnliQ254OHhJ?=
 =?utf-8?B?Q0h3NTh1c2tsalo2YmYxZzdMQzhHaXVJNU9XNjdDWiswaUp0OFZIVnRkdHVi?=
 =?utf-8?B?enpDNWxQKy8wQXhlQk1xbE1WSDFJV1dCb2oyNGRqc3RQRHNSemJHNlBPbldE?=
 =?utf-8?B?UjVXUzZjcFcxMXg3RnhnalVrajd6SmdMMThWdGZ5VW1oWnhEYVI2UVpnSlNX?=
 =?utf-8?B?dnlLdWpOTjhUMjU5cDR1K2dDYXc2Ny9Pa2RYOG8xdzhvbFIvaUlVazJzRCtk?=
 =?utf-8?B?WHkvUjJtOGhrc3NJQTI2bGNHWmFnMWlsM3VGMG5Ici93Vk5CWVdWUjFaRzZF?=
 =?utf-8?B?TTNRVDlhQkExdTJVVncxUGNFaXVjbFBBNExvM0ZYNnRmbUgwaGN6Mjg3bXVT?=
 =?utf-8?B?MldBK25TUWVtWjdYTEh4Y2JuSmFQVEZiZWdVUjhxNE9VOUExZlpyK05TZkNL?=
 =?utf-8?B?QlVqZU52UWpLaEUxZVcvWkxKeTFoT3pqMklxeElOdWFCQ1M2RzhHU0EyZkF4?=
 =?utf-8?B?UTU5N0VJbSt0a1FHR0hTZ0UwTmsvOEdtOFlBMFU4TFh4TlErYjNTeG9wNTVK?=
 =?utf-8?B?SDZVMm5UTUFLN1BmcWNyQ3NGbWtpSXU2RWRpM01iWHFZMUkwYnNjV3AzaVh1?=
 =?utf-8?B?dlc3cFJ2RnJSZHY0OWxPNWlrVGdrRkpVdGhaaHF1eFZ6S0NsZm53TEFKbVds?=
 =?utf-8?B?RXRDL3lJUXFFbEswU2h5VFoyRjFYbEpaNmM4SjluRm4zK3JjalZQUFltYWM0?=
 =?utf-8?B?Vk1WYWwvcmNPMnpFRkw4Z3FmMmc0Q3IxZjNQOCtjUVJ3WVZ4QkVLRTlNa3Rw?=
 =?utf-8?B?NzBVTkxTbnREM2tXT1EvL3FiakdmWFBHWDk2QlVjT2s2eUhHVWVWVnVmMG9m?=
 =?utf-8?B?RlJhaURMcmF1c0RwaUlsVXJrM255a09LVHFnYWFXdXRMS0k3ay9LbFNsdFhu?=
 =?utf-8?B?VVBqbEtlZW9zZnZjSVVML0NFR1RtVlVuOGptZXVMRHNSK0o0RVo1NlNlWTRq?=
 =?utf-8?B?QkNLSmtSOWRlak9LTXFiMWd5U3RKMkhWR2dzVnJiQ1d0TnpPMkpiQVBrSll3?=
 =?utf-8?B?bld4RmE4T29PTlN2Zk9MTndvOTRNaS9xR25WenJYd2JWZ01VcFFlQVExZTk2?=
 =?utf-8?B?TWM1QnNlanYwYjJTZlQycWI2N25ubVplSW9QWlAxWFB5aUxsZWxsaVExeWN1?=
 =?utf-8?B?U1FiV2JlZkl1VVVCZDBIYlpZd1FiQUNGYmh4TW9ZUmZ1Q1JaQ2lvQkNJYzRV?=
 =?utf-8?B?eUNOQjNOUlZoaGgwVUx0alFpY2QyNXNNdkZEVzlQYkU3T2hOWEFXTDBWMnQ0?=
 =?utf-8?B?WE5qNXhHcXpLWVNPR2t5RUZiQ1dXajFPb3NaL251RXdTMmtvaG1wM2VTc1dP?=
 =?utf-8?B?Sm1CQXU4SkFPRkNlQzZGTFRhb3VKR1NEcVFSMFAzSnlTTHBPRHJUQ1BJTlls?=
 =?utf-8?B?NzV1RXJrRzE2SUZJUnRkYmQ2VzI5Z09qQlo3S1FlbU9HS1U1c2tuMGU2SS9Y?=
 =?utf-8?B?OVBpTXZQN2RzMTZRUnBPRjNmb3FqUlh2WnNySklEeVBsbG0xYytpdmlvQmtZ?=
 =?utf-8?B?a3A5czZ3N3pIdzAvQmhHYThTZjRrbXdtNW9RSmY4UVdvSmFPQ0NyU1Rza2x0?=
 =?utf-8?Q?14PToKbFmqM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEJaT21DbmNBWjV3UmJQTVd5dVB6VHp2NDhmOCtRNFp5amR2QW9nSWpUells?=
 =?utf-8?B?U2hpRFpURnl0blNTMXFWRzQrd04zYnRsakt2N21hZi80TmFleTdDSXpOMnNt?=
 =?utf-8?B?TlhCcnZhMEM1TWhUd3p3aUE3V1ZMZEdCQXJLVDBGUXpzUHorSXhwRzgvZEVB?=
 =?utf-8?B?RTFhR0NleHpCZnA0V1dDUGdDUng2bzhPTit0ZmdYRjM2bGpGQ1RJNDFueGZp?=
 =?utf-8?B?RzhCRUpVbnJjeUN6UjlzTGNEVmhOaHk5TUxvMVhrVHdRSmtISmorSWdKRTFT?=
 =?utf-8?B?dkY2MmoyRGhleGF4cGNxOXk5a202RlBRTjQ4S3QrZUVpNU9rbDN1RVM4SVMw?=
 =?utf-8?B?VHIweGYwSTVON0hmTzhGUzcyb2tUUjVFamlXS1o4V0xxQXlnU3hSSHhsN2V4?=
 =?utf-8?B?NXZwMHdqQ0NSTVc0bngrVXlXMkFjK3RTK01PNGlTZ0R4TmdUUElQN2p4TFRp?=
 =?utf-8?B?YzNXVkJUWU9ONDhueTZLalRUZlowRnVBK1lIZmpIUmIvTmdhOXg3VkZxQ0Uy?=
 =?utf-8?B?QW40dFh0WVI5a0dVTGVtSWh3dGtlbnJndVRuNmV6bjNlcUViYTNONkw0d25v?=
 =?utf-8?B?ejBmb2x0Q3JRK1JHQXIvT05GNjk1cE5IL3h6M0VzSVdiWkhkWWZqRXVpcU0r?=
 =?utf-8?B?UUhhOXFFZldVWjlPOUNvKzM0YUc2ajkyNkgveHFtR1VGQ2pGZUdjRlpod285?=
 =?utf-8?B?VzIzbzdSY0kwUnNZREJhdkx5UytqY0tMbDl4SVA4Z2F0THYySDY0R21Gc0FN?=
 =?utf-8?B?Mkg3dW5CMnVSbXBSZjQxd1BpenJLdzJRWERNUXpXR1d3VytXWWdqMXB4cThn?=
 =?utf-8?B?czFxa1M3dVVQTWwvS0t0ZXdDT3Y5ZmRydlV1c3RhYzdZdS9ueTNjeGhZeDRL?=
 =?utf-8?B?MWM2UHFlNFI0ZGtuTjVTcEFFejBvK0V2VzNnZDJZQWZiVXFTeE8rOE14Nk9V?=
 =?utf-8?B?OXM5OVpwNnQ4SUVzQ2NYNXNoTUpXZllpelRObzFTcElYODVyUmdNWC9iWWxh?=
 =?utf-8?B?U04xMFVmbU5iYjZXZzN5S21PVktMb0FCQ0FBVHpvTzF3UUl1Ylo2NDhqdVFN?=
 =?utf-8?B?bGZzMFh4cm9nWXRhdFhQQjZkNTdCbVVyeXVnMW5ZNXlqL2dNUVlzRWtXRHZk?=
 =?utf-8?B?Mlo3dlFVNHVTOXRiR2lCWktiVVNDMHhDK0FTaTUxcU93bVNBaThoUU5LdjFk?=
 =?utf-8?B?MjlRdWNZcnJsRW93aUFzNmdXSlVHWWtoUDFPTXpQYlpSUFFwV2J6UGZaUlZm?=
 =?utf-8?B?V2pFUmR4UFpLZmoybTY3RkZQMWZ3N1lzRWNhMWgwcFlzQ1Z5WWNNOEE2MVFj?=
 =?utf-8?B?c2NyOTkybFljTXFuRE1udUFTd0FSVFJkeGorRi9CYTRYaUxMaWZOM25jWjNy?=
 =?utf-8?B?cEJINXBDYjhnS3VRMlMvYWVudWJxRXcwamhKYTl3dGN3QWJTQkdsQ1lEL2Jr?=
 =?utf-8?B?T1B6eTJJT1plU3dlcHpsM2M4N2hUME5PQ1J1VHNHeUMvN0EwdVMrbjAvd1V1?=
 =?utf-8?B?WHRldjl0OURZUktLU1FiK3dVTTBwNTQ0bm1BWnZ3S2dFUVhnbS9ZSmRieTJF?=
 =?utf-8?B?cmtxZkxCbjlNUkZZMTIvclJvM2l0VE5ZS2kvZFY0QWtPK2gyQWxqcmpYQVo0?=
 =?utf-8?B?elZtV0JIRnJCVllrL21ld3ZDQ203RUd6aGlueG13Vko1RWhxaTMvNTIrVm9h?=
 =?utf-8?B?enlVTXBZeUFUOXRhZFhzS2dza1pnQVBDRVVLQTJHd2tla2ltWUFtdE5OVzFR?=
 =?utf-8?B?ZHlSeURYQmtDbFZKOHhHT3c2N08yL0w2Y21xQnlCMTcxYUdQTnRPVW5SUEho?=
 =?utf-8?B?SUVlbGpYUUt0ZnI5SEgvWVphVmtPRkJtYVYzNWJ5OUtUZ2FpWUREQW5SbWsv?=
 =?utf-8?B?U2x3WmN2Tkd5UElaM0hQcUdJNlZQeGFrby9wbmtmdjhJbWhUbEJZdFpOZDF4?=
 =?utf-8?B?ZFkxcVNZVCtIQ3JMVUt1N1IyTGpVS3NmRFdma2FmR1BCYjVqci9FUFpnRm5t?=
 =?utf-8?B?SUJweTFrSzFMZnJJam1Dd0hqeTdvSm43R1c0QzIxd3Q3SEtkdzdpM3V2K1ZS?=
 =?utf-8?B?RUg2ckpqVm1NdVdDVTZhMjUrdmEzWHZyczk1VlJ0eGQ0SDZ2RXZGc3BHcDZQ?=
 =?utf-8?B?blpRTHU3MncrR3Z4UldJRnlUakN5a2FYSGNkQWJCMGxHU005U3VQaXpyZFlR?=
 =?utf-8?B?S1E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cf18dd8c-09f0-44f0-f435-08ddb561df97
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jun 2025 10:03:32.6480 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OPM2uBqu75w/thPFHEftwPU33zgZmenTPgu9kkKdpsngv9yy/6nFelEqi91/R/BFYCU0MhgwWpZCt74uHVFceZ46k+mxCii/Jy3pp+qini0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7042
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

From: Piotr Piórkowski <piotr.piorkowski@intel.com>

Currently in the drivers we have defined VRAM regions per device and per
tile. Initialization of these regions is done in two completely different
ways. To simplify the logic of the code and make it easier to add new
regions in the future, let's unify the way we initialize VRAM regions.

v2:
- fix doc comments in struct xe_vram_region
- remove unnecessary includes (Jani)
v3:
- move code from xe_vram_init_regions_managers to xe_tile_init_noalloc
  (Matthew)
- replace ioremap_wc to devm_ioremap_wc for mapping VRAM BAR
  (Matthew)
- Replace the tile id parameter with vram region in the xe_pf_begin
  function.

Signed-off-by: Piotr Piórkowski <piotr.piorkowski@intel.com>
Cc: Stuart Summers <stuart.summers@intel.com>
Cc: Matthew Auld <matthew.auld@intel.com>
Cc: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/xe/xe_gt_pagefault.c |  13 ++-
 drivers/gpu/drm/xe/xe_query.c        |   3 +-
 drivers/gpu/drm/xe/xe_tile.c         |  38 +++----
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.c |  16 ++-
 drivers/gpu/drm/xe/xe_ttm_vram_mgr.h |   3 +-
 drivers/gpu/drm/xe/xe_vram.c         | 149 ++++++++++++++++-----------
 drivers/gpu/drm/xe/xe_vram.h         |   1 +
 drivers/gpu/drm/xe/xe_vram_types.h   |   8 ++
 8 files changed, 134 insertions(+), 97 deletions(-)

diff --git a/drivers/gpu/drm/xe/xe_gt_pagefault.c b/drivers/gpu/drm/xe/xe_gt_pagefault.c
index 3522865c67c9..9cb50e0ed9f5 100644
--- a/drivers/gpu/drm/xe/xe_gt_pagefault.c
+++ b/drivers/gpu/drm/xe/xe_gt_pagefault.c
@@ -23,6 +23,7 @@
 #include "xe_svm.h"
 #include "xe_trace_bo.h"
 #include "xe_vm.h"
+#include "xe_vram_types.h"
 
 struct pagefault {
 	u64 page_addr;
@@ -74,7 +75,7 @@ static bool vma_is_valid(struct xe_tile *tile, struct xe_vma *vma)
 }
 
 static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
-		       bool atomic, unsigned int id)
+		       bool atomic, struct xe_vram_region *vram)
 {
 	struct xe_bo *bo = xe_vma_bo(vma);
 	struct xe_vm *vm = xe_vma_vm(vma);
@@ -84,14 +85,16 @@ static int xe_pf_begin(struct drm_exec *exec, struct xe_vma *vma,
 	if (err)
 		return err;
 
-	if (atomic && IS_DGFX(vm->xe)) {
+	if (atomic && vram) {
+		xe_assert(vm->xe, IS_DGFX(vm->xe));
+
 		if (xe_vma_is_userptr(vma)) {
 			err = -EACCES;
 			return err;
 		}
 
 		/* Migrate to VRAM, move should invalidate the VMA first */
-		err = xe_bo_migrate(bo, XE_PL_VRAM0 + id);
+		err = xe_bo_migrate(bo, vram->placement);
 		if (err)
 			return err;
 	} else if (bo) {
@@ -138,7 +141,7 @@ static int handle_vma_pagefault(struct xe_gt *gt, struct xe_vma *vma,
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		err = xe_pf_begin(&exec, vma, atomic, tile->id);
+		err = xe_pf_begin(&exec, vma, atomic, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (xe_vm_validate_should_retry(&exec, err, &end))
 			err = -EAGAIN;
@@ -572,7 +575,7 @@ static int handle_acc(struct xe_gt *gt, struct acc *acc)
 	/* Lock VM and BOs dma-resv */
 	drm_exec_init(&exec, 0, 0);
 	drm_exec_until_all_locked(&exec) {
-		ret = xe_pf_begin(&exec, vma, true, tile->id);
+		ret = xe_pf_begin(&exec, vma, true, tile->mem.vram);
 		drm_exec_retry_on_contention(&exec);
 		if (ret)
 			break;
diff --git a/drivers/gpu/drm/xe/xe_query.c b/drivers/gpu/drm/xe/xe_query.c
index ba9b7482605c..f02987753779 100644
--- a/drivers/gpu/drm/xe/xe_query.c
+++ b/drivers/gpu/drm/xe/xe_query.c
@@ -27,6 +27,7 @@
 #include "xe_oa.h"
 #include "xe_pxp.h"
 #include "xe_ttm_vram_mgr.h"
+#include "xe_vram_types.h"
 #include "xe_wa.h"
 
 static const u16 xe_to_user_engine_class[] = {
@@ -409,7 +410,7 @@ static int query_gt_list(struct xe_device *xe, struct drm_xe_device_query *query
 			gt_list->gt_list[id].near_mem_regions = 0x1;
 		else
 			gt_list->gt_list[id].near_mem_regions =
-				BIT(gt_to_tile(gt)->id) << 1;
+				BIT(gt_to_tile(gt)->mem.vram->id) << 1;
 		gt_list->gt_list[id].far_mem_regions = xe->info.mem_region_mask ^
 			gt_list->gt_list[id].near_mem_regions;
 
diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
index 87217d62d6a4..613c3c52b3ed 100644
--- a/drivers/gpu/drm/xe/xe_tile.c
+++ b/drivers/gpu/drm/xe/xe_tile.c
@@ -7,6 +7,7 @@
 
 #include <drm/drm_managed.h>
 
+#include "xe_bo.h"
 #include "xe_device.h"
 #include "xe_ggtt.h"
 #include "xe_gt.h"
@@ -20,6 +21,7 @@
 #include "xe_ttm_vram_mgr.h"
 #include "xe_vram_types.h"
 #include "xe_wa.h"
+#include "xe_vram.h"
 
 /**
  * DOC: Multi-tile Design
@@ -113,11 +115,9 @@ int xe_tile_alloc_vram(struct xe_tile *tile)
 	if (!IS_DGFX(xe))
 		return 0;
 
-	vram = drmm_kzalloc(&xe->drm, sizeof(*vram), GFP_KERNEL);
-	if (!vram)
-		return -ENOMEM;
-
-	vram->tile = tile;
+	vram = xe_vram_region_alloc(xe, tile->id, XE_PL_VRAM0 + tile->id);
+	if (IS_ERR(vram))
+		return PTR_ERR(vram);
 	tile->mem.vram = vram;
 
 	return 0;
@@ -155,21 +155,6 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
 }
 ALLOW_ERROR_INJECTION(xe_tile_init_early, ERRNO); /* See xe_pci_probe() */
 
-static int tile_ttm_mgr_init(struct xe_tile *tile)
-{
-	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	if (tile->mem.vram->usable_size) {
-		err = xe_ttm_vram_mgr_init(tile, &tile->mem.vram->ttm);
-		if (err)
-			return err;
-		xe->info.mem_region_mask |= BIT(tile->id) << 1;
-	}
-
-	return 0;
-}
-
 /**
  * xe_tile_init_noalloc - Init tile up to the point where allocations can happen.
  * @tile: The tile to initialize.
@@ -187,17 +172,20 @@ static int tile_ttm_mgr_init(struct xe_tile *tile)
 int xe_tile_init_noalloc(struct xe_tile *tile)
 {
 	struct xe_device *xe = tile_to_xe(tile);
-	int err;
-
-	err = tile_ttm_mgr_init(tile);
-	if (err)
-		return err;
 
 	xe_wa_apply_tile_workarounds(tile);
 
 	if (xe->info.has_usm && IS_DGFX(xe))
 		xe_devm_add(tile, tile->mem.vram);
 
+	if (IS_DGFX(xe) && !ttm_resource_manager_used(&tile->mem.vram->ttm.manager)) {
+		int err = xe_ttm_vram_mgr_init(xe, tile->mem.vram);
+
+		if (err)
+			return err;
+		xe->info.mem_region_mask |= BIT(tile->mem.vram->id) << 1;
+	}
+
 	return xe_tile_sysfs_init(tile);
 }
 
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
index 585bc1232658..c00f5782cb63 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.c
@@ -338,12 +338,18 @@ int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 	return drmm_add_action_or_reset(&xe->drm, ttm_vram_mgr_fini, mgr);
 }
 
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr)
+/**
+ * xe_ttm_vram_mgr_init - initialize TTM VRAM region
+ * @xe: pointer to Xe device
+ * @vram: pointer to xe_vram_region that contains the memory region attributes
+ *
+ * Initialize the Xe TTM for given @vram region using the given parameters.
+ *
+ * Returns 0 for success, negative error code otherwise.
+ */
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram)
 {
-	struct xe_device *xe = tile_to_xe(tile);
-	struct xe_vram_region *vram = tile->mem.vram;
-
-	return __xe_ttm_vram_mgr_init(xe, mgr, XE_PL_VRAM0 + tile->id,
+	return __xe_ttm_vram_mgr_init(xe, &vram->ttm, vram->placement,
 				      vram->usable_size, vram->io_size,
 				      PAGE_SIZE);
 }
diff --git a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
index cc76050e376d..87b7fae5edba 100644
--- a/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
+++ b/drivers/gpu/drm/xe/xe_ttm_vram_mgr.h
@@ -11,11 +11,12 @@
 enum dma_data_direction;
 struct xe_device;
 struct xe_tile;
+struct xe_vram_region;
 
 int __xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_ttm_vram_mgr *mgr,
 			   u32 mem_type, u64 size, u64 io_size,
 			   u64 default_page_size);
-int xe_ttm_vram_mgr_init(struct xe_tile *tile, struct xe_ttm_vram_mgr *mgr);
+int xe_ttm_vram_mgr_init(struct xe_device *xe, struct xe_vram_region *vram);
 int xe_ttm_vram_mgr_alloc_sgt(struct xe_device *xe,
 			      struct ttm_resource *res,
 			      u64 offset, u64 length,
diff --git a/drivers/gpu/drm/xe/xe_vram.c b/drivers/gpu/drm/xe/xe_vram.c
index cf92a9aa2435..6cf85077d196 100644
--- a/drivers/gpu/drm/xe/xe_vram.c
+++ b/drivers/gpu/drm/xe/xe_vram.c
@@ -19,6 +19,7 @@
 #include "xe_mmio.h"
 #include "xe_module.h"
 #include "xe_sriov.h"
+#include "xe_ttm_vram_mgr.h"
 #include "xe_vram.h"
 #include "xe_vram_types.h"
 
@@ -137,7 +138,7 @@ static bool resource_is_valid(struct pci_dev *pdev, int bar)
 	return true;
 }
 
-static int determine_lmem_bar_size(struct xe_device *xe)
+static int determine_lmem_bar_size(struct xe_device *xe, struct xe_vram_region *lmem_bar)
 {
 	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
 
@@ -148,17 +149,16 @@ static int determine_lmem_bar_size(struct xe_device *xe)
 
 	resize_vram_bar(xe);
 
-	xe->mem.vram->io_start = pci_resource_start(pdev, LMEM_BAR);
-	xe->mem.vram->io_size = pci_resource_len(pdev, LMEM_BAR);
-	if (!xe->mem.vram->io_size)
+	lmem_bar->io_start = pci_resource_start(pdev, LMEM_BAR);
+	lmem_bar->io_size = pci_resource_len(pdev, LMEM_BAR);
+	if (!lmem_bar->io_size)
 		return -EIO;
 
 	/* XXX: Need to change when xe link code is ready */
-	xe->mem.vram->dpa_base = 0;
+	lmem_bar->dpa_base = 0;
 
 	/* set up a map to the total memory area. */
-	xe->mem.vram->mapping = devm_ioremap_wc(&pdev->dev, xe->mem.vram->io_start,
-						xe->mem.vram->io_size);
+	lmem_bar->mapping = devm_ioremap_wc(&pdev->dev, lmem_bar->io_start, lmem_bar->io_size);
 
 	return 0;
 }
@@ -286,6 +286,65 @@ static void vram_fini(void *arg)
 		tile->mem.vram->mapping = NULL;
 }
 
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement)
+{
+	struct xe_vram_region *vram;
+	struct drm_device *drm = &xe->drm;
+
+	xe_assert(xe, id < xe->info.tile_count);
+
+	vram = drmm_kzalloc(drm, sizeof(*vram), GFP_KERNEL);
+	if (!vram)
+		return NULL;
+
+	vram->id = id;
+	vram->placement = placement;
+	vram->tile = &xe->tiles[id];
+
+	return vram;
+}
+
+static void print_vram_region_info(struct xe_device *xe, struct xe_vram_region *vram)
+{
+	struct drm_device *drm = &xe->drm;
+
+	if (vram->io_size < vram->usable_size)
+		drm_info(drm, "Small BAR device\n");
+
+	drm_info(drm,
+		 "VRAM[%u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
+		 vram->id, &vram->actual_physical_size, &vram->usable_size, &vram->io_size);
+	drm_info(drm, "VRAM[%u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
+		 vram->id, &vram->dpa_base, vram->dpa_base + (u64)vram->actual_physical_size,
+		 &vram->io_start, vram->io_start + (u64)vram->io_size);
+}
+
+static int vram_region_init(struct xe_device *xe, struct xe_vram_region *vram,
+			    struct xe_vram_region *lmem_bar, u64 offset, u64 usable_size,
+			    u64 region_size, resource_size_t remain_io_size)
+{
+	/* Check if VRAM region is already initialized */
+	if (vram->mapping)
+		return 0;
+
+	vram->actual_physical_size = region_size;
+	vram->io_start = lmem_bar->io_start + offset;
+	vram->io_size = min_t(u64, usable_size, remain_io_size);
+
+	if (!vram->io_size) {
+		drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
+		return -ENODEV;
+	}
+
+	vram->dpa_base = lmem_bar->dpa_base + offset;
+	vram->mapping = lmem_bar->mapping + offset;
+	vram->usable_size = usable_size;
+
+	print_vram_region_info(xe, vram);
+
+	return 0;
+}
+
 /**
  * xe_vram_probe() - Probe VRAM configuration
  * @xe: the &xe_device
@@ -297,82 +356,52 @@ static void vram_fini(void *arg)
 int xe_vram_probe(struct xe_device *xe)
 {
 	struct xe_tile *tile;
-	resource_size_t io_size;
+	struct xe_vram_region lmem_bar;
+	resource_size_t remain_io_size;
 	u64 available_size = 0;
 	u64 total_size = 0;
-	u64 tile_offset;
-	u64 tile_size;
-	u64 vram_size;
 	int err;
 	u8 id;
 
 	if (!IS_DGFX(xe))
 		return 0;
 
-	/* Get the size of the root tile's vram for later accessibility comparison */
-	tile = xe_device_get_root_tile(xe);
-	err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
-	if (err)
-		return err;
-
-	err = determine_lmem_bar_size(xe);
+	err = determine_lmem_bar_size(xe, &lmem_bar);
 	if (err)
 		return err;
+	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &lmem_bar.io_start, &lmem_bar.io_size);
 
-	drm_info(&xe->drm, "VISIBLE VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->io_size);
+	remain_io_size = lmem_bar.io_size;
 
-	io_size = xe->mem.vram->io_size;
-
-	/* tile specific ranges */
 	for_each_tile(tile, xe, id) {
-		err = tile_vram_size(tile, &vram_size, &tile_size, &tile_offset);
+		u64 region_size;
+		u64 usable_size;
+		u64 tile_offset;
+
+		err = tile_vram_size(tile, &usable_size, &region_size, &tile_offset);
 		if (err)
 			return err;
 
-		tile->mem.vram->actual_physical_size = tile_size;
-		tile->mem.vram->io_start = xe->mem.vram->io_start + tile_offset;
-		tile->mem.vram->io_size = min_t(u64, vram_size, io_size);
+		total_size += region_size;
+		available_size += usable_size;
 
-		if (!tile->mem.vram->io_size) {
-			drm_err(&xe->drm, "Tile without any CPU visible VRAM. Aborting.\n");
-			return -ENODEV;
-		}
+		err = vram_region_init(xe, tile->mem.vram, &lmem_bar, tile_offset, usable_size,
+				       region_size, remain_io_size);
+		if (err)
+			return err;
 
-		tile->mem.vram->dpa_base = xe->mem.vram->dpa_base + tile_offset;
-		tile->mem.vram->usable_size = vram_size;
-		tile->mem.vram->mapping = xe->mem.vram->mapping + tile_offset;
-
-		if (tile->mem.vram->io_size < tile->mem.vram->usable_size)
-			drm_info(&xe->drm, "Small BAR device\n");
-		drm_info(&xe->drm,
-			 "VRAM[%u, %u]: Actual physical size %pa, usable size exclude stolen %pa, CPU accessible size %pa\n",
-			 id, tile->id, &tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->usable_size, &tile->mem.vram->io_size);
-		drm_info(&xe->drm, "VRAM[%u, %u]: DPA range: [%pa-%llx], io range: [%pa-%llx]\n",
-			 id, tile->id, &tile->mem.vram->dpa_base,
-			 tile->mem.vram->dpa_base + (u64)tile->mem.vram->actual_physical_size,
-			 &tile->mem.vram->io_start,
-			 tile->mem.vram->io_start + (u64)tile->mem.vram->io_size);
-
-		/* calculate total size using tile size to get the correct HW sizing */
-		total_size += tile_size;
-		available_size += vram_size;
-
-		if (total_size > xe->mem.vram->io_size) {
+		if (total_size > lmem_bar.io_size) {
 			drm_info(&xe->drm, "VRAM: %pa is larger than resource %pa\n",
-				 &total_size, &xe->mem.vram->io_size);
+				 &total_size, &lmem_bar.io_size);
 		}
 
-		io_size -= min_t(u64, tile_size, io_size);
+		remain_io_size -= min_t(u64, tile->mem.vram->actual_physical_size, remain_io_size);
 	}
 
-	xe->mem.vram->actual_physical_size = total_size;
-
-	drm_info(&xe->drm, "Total VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &xe->mem.vram->actual_physical_size);
-	drm_info(&xe->drm, "Available VRAM: %pa, %pa\n", &xe->mem.vram->io_start,
-		 &available_size);
+	err = vram_region_init(xe, xe->mem.vram, &lmem_bar, 0, available_size, total_size,
+			       lmem_bar.io_size);
+	if (err)
+		return err;
 
 	return devm_add_action_or_reset(xe->drm.dev, vram_fini, xe);
 }
diff --git a/drivers/gpu/drm/xe/xe_vram.h b/drivers/gpu/drm/xe/xe_vram.h
index 9092ae86df22..802bd57e7c96 100644
--- a/drivers/gpu/drm/xe/xe_vram.h
+++ b/drivers/gpu/drm/xe/xe_vram.h
@@ -13,5 +13,6 @@ struct xe_vram_region;
 
 int xe_vram_probe(struct xe_device *xe);
 resource_size_t xe_vram_region_actual_physical_size(struct xe_vram_region *vram);
+struct xe_vram_region *xe_vram_region_alloc(struct xe_device *xe, u8 id, u32 placement);
 
 #endif
diff --git a/drivers/gpu/drm/xe/xe_vram_types.h b/drivers/gpu/drm/xe/xe_vram_types.h
index f4e06c9a4648..31c57fd23e27 100644
--- a/drivers/gpu/drm/xe/xe_vram_types.h
+++ b/drivers/gpu/drm/xe/xe_vram_types.h
@@ -22,6 +22,12 @@ struct xe_tile;
 struct xe_vram_region {
 	/** @tile: Backpointer to tile */
 	struct xe_tile *tile;
+	/**
+	 * @id: VRAM region instance id
+	 *
+	 * The value should be unique for VRAM region.
+	 */
+	u8 id;
 	/** @io_start: IO start address of this VRAM instance */
 	resource_size_t io_start;
 	/**
@@ -54,6 +60,8 @@ struct xe_vram_region {
 	void __iomem *mapping;
 	/** @ttm: VRAM TTM manager */
 	struct xe_ttm_vram_mgr ttm;
+	/** @placement: TTM placement dedicated for this region */
+	u32 placement;
 #if IS_ENABLED(CONFIG_DRM_XE_PAGEMAP)
 	/** @pagemap: Used to remap device memory as ZONE_DEVICE */
 	struct dev_pagemap pagemap;
-- 
2.34.1

