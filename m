Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC2DCC87FCB
	for <intel-xe@archiver.kernel.org>; Mon,  4 Aug 2025 16:54:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 739D610E21B;
	Mon,  4 Aug 2025 16:54:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BsHS00WN";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAA1410E217
 for <intel-xe@lists.freedesktop.org>; Mon,  4 Aug 2025 16:54:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1754326470; x=1785862470;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=vfunDgjEfictphrHM7w4E2wzmRsPgad4KjoTaq14cdI=;
 b=BsHS00WNsqruIBd5YAgikVyjbiZXmXMcb9BTn0g7UOrQ7T0+zqti7IKW
 ObX9RKlL3FIqg6iLUfbexm+hjGzfcEHIV0QFnPDUGR9SDMlkXegySpvVq
 Y9Ld36bCY9JW7O7SWyHs2xVOWyteeXzEy8wrXafo4p4Ql8lbfIMHjPs7j
 XO+rm0jsp0m4ogiSMK+4U9YJhPvL4+tm2LtkyM5zRWJ5rRyWW91Dcu0s5
 gn46MmMtyGkWDKEYES6vc7sX5TjfHSiyi+vC3HxSET5RXAdj8X7gAWrbu
 bb0rIcEArRC0YgZdpz8MSyVsB0kPGbIpLaMbQ8ve1aRJeRS26t3AMiJ1D Q==;
X-CSE-ConnectionGUID: vARYXk+xQ2e9nn34d3TCUQ==
X-CSE-MsgGUID: EJQgxQYtQ1+MLig38M3wEg==
X-IronPort-AV: E=McAfee;i="6800,10657,11512"; a="79158658"
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="79158658"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 09:54:29 -0700
X-CSE-ConnectionGUID: XecyZ4P/Roe4dJ4Rtof3+A==
X-CSE-MsgGUID: 4yxmRdMdSDqVIQx8ds2Jqg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.17,258,1747724400"; d="scan'208";a="163889656"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 04 Aug 2025 09:54:29 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 09:54:28 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26 via Frontend Transport; Mon, 4 Aug 2025 09:54:28 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (40.107.94.81) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.26; Mon, 4 Aug 2025 09:54:28 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mrkugmo7Pu6M3zdJH8yPYkaL+xlHYaLt9uAfZmf8rmfc6YN7zh6aPooFChPnozDoC+KyFdXjlTEB7sn6iW0G64Z/BEEfxtr+3rkSAi1ElpBNeNvt/2yUY2AE0pyV+FYqFH6cT+MspVR7r5jq2vRts7h2VEObQtCD+xKwuhDxSGMJsXZYZlmTZLWlJDz6KpCoMv9sRO7x2Td77smkz/0aFkEdPC3q/iQSWB2QoVfnEd9drOmiDIeQV04iuK+PhcqR/rQpHUkfazvqxmAmj6CeHBR53QvyCygAIAlUEHQbDU1pAfttZ/4Ht3I4LmeeGjt9q1LICNEj164NmZkAEzC/nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1cSAkjUsKKEGJBtBcVsKoP7VWF1jIzCbK0U2n7bkEw4=;
 b=U269B3PKk3GLrZdPYHzNkghD20Rim4HpiACfPZqyFuOBG8ltCPEfKeqchjrXzF2OZaQh83sLCwMgQHwx2wAZBEZmvWpxD/+BuwS3OnypRAJ5Ifct/cd93YTFisarTPH35i7FsXLL+AmQX3ARZc24A6q6D7kyg6ePhYrKm/tirfAyNtd9kiHZDUgMK+efVlljJrxUc8hascqeWRUC2ubIuf6p07vwK+V4QxpwXzIBFSPQkKEz0V40WnGNYv3t4wex0baOpPdMv7mEnXU8GsgSIHjyZUZASsEGtFdipCuxMdhBfybIXJZCNqZWhXiqNnWYydU+TwM1pVN6j7fdyE7qsQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CYYPR11MB8430.namprd11.prod.outlook.com (2603:10b6:930:c6::19)
 by SA1PR11MB5825.namprd11.prod.outlook.com (2603:10b6:806:234::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Mon, 4 Aug
 2025 16:54:25 +0000
Received: from CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563]) by CYYPR11MB8430.namprd11.prod.outlook.com
 ([fe80::76d2:8036:2c6b:7563%5]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 16:54:25 +0000
Date: Mon, 4 Aug 2025 12:54:22 -0400
From: Rodrigo Vivi <rodrigo.vivi@intel.com>
To: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
CC: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>,
 <intel-xe@lists.freedesktop.org>, Michal Wajdeczko
 <michal.wajdeczko@intel.com>, Matthew Brost <matthew.brost@intel.com>,
 Anshuman Gupta <anshuman.gupta@intel.com>
Subject: Re: [PATCH v3] drm/xe/pm: Disable RPM for SR-IOV VFs with no PCIe PM
 capability]
Message-ID: <aJDlvknZOh7u0Gdf@intel.com>
References: <20250801163017.23242-1-satyanarayana.k.v.p@intel.com>
 <aJDI21VmY6Unf9Vw@intel.com>
 <9f22cc70-116f-4ba5-a2f5-08dfce89e5c3@intel.com>
 <aJDNq7IzmGBFSytg@intel.com>
 <xdrfj24g5nuglrnrnl4twfosd36tgkvs52y4fv5fmkpibtjgby@yfgrjm25fpj7>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <xdrfj24g5nuglrnrnl4twfosd36tgkvs52y4fv5fmkpibtjgby@yfgrjm25fpj7>
X-ClientProxiedBy: SJ0PR03CA0376.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::21) To CYYPR11MB8430.namprd11.prod.outlook.com
 (2603:10b6:930:c6::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CYYPR11MB8430:EE_|SA1PR11MB5825:EE_
X-MS-Office365-Filtering-Correlation-Id: d32b8995-458b-4645-5869-08ddd3779182
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?VlE3QjZPSzcrNGhobVBieGptNlBoN1BLL3kwdUhxUWx5NG53WVROZHRFQ3hB?=
 =?utf-8?B?QUswbXY3aVJEbUZ6VlI0V2dBSmduSGRqNkNhbG15ejlHY3Z4Tm1QajFiQVIy?=
 =?utf-8?B?QTVIaHhhbFFrL3lxMEpaUks0MmdnaG0zK1Z5bGQ0bG53RlVKTmtBa3ZTWkNZ?=
 =?utf-8?B?SW9jdHRoSVVYMDJ0OHArdkNmVDZvNlpENmJZNlg5WXJGZGJiRG13Y09jQ0h0?=
 =?utf-8?B?R2pYaEFQdU8vUzVPa3VFV2tqemdKZEowbHRCYUxab0VWRzRoWDZMNk55QUNZ?=
 =?utf-8?B?S0NjVXV4WkE2cis4RWN5Nm5GbkhtR1ZyQXF6Tnl6R3pXZWI2WlV6SHY3WFBX?=
 =?utf-8?B?MDhHbGtXNWRwZWtwVHBrK0Y1b0tOQXVmQW9PMkVJY1RNTFY3MnpRSHBFS20z?=
 =?utf-8?B?UG9tUXRScm5XU3BPek8rNzlVdzJIQVR0UUJFUnFMUnBFbjJVMmpGMEt4eFF0?=
 =?utf-8?B?SjNBYjVDaXJBWjFSc1hOZ29FczAzWE92WFBwRUNXd3hya1BFZHcrVWxBWnQy?=
 =?utf-8?B?ZmhGQU1waGI4cG9McTBrMm9xVDJhMU1OVDk5c3JlSEJoSEt6alpxMlFDN1hM?=
 =?utf-8?B?clNKVThZdkRwZi9WR3ROWXAvTmF1RHVTdTMzbjA5cnlDRlUvMElaNGhmUlZI?=
 =?utf-8?B?RnpFd3BoZHoxZDZvUU91a3ZGNHBjamJObE1taGYvaVJHZi94ai9HaUEzd0l3?=
 =?utf-8?B?Z2I0elZTU2VmZHgrRk1BT2U2aTNRN1F4VWQxZnBUdkZlQjVpMWZxMWYySkRp?=
 =?utf-8?B?UHdra0Y5WFRzNzdldWhLM3BRZU04ck1UY1lyWWF5SVpJRWFPUHA3d1VzMXht?=
 =?utf-8?B?Sk1kQVQwbmRybmhxaVFnNDV3L0NmQzJlMlE4OHlkRzFOWGlrUzMvVkFTekJ4?=
 =?utf-8?B?bzRSNzhzUjdVd0R3dVRiRWZmZUFjelVuYXVlSXFJNTBSSWpobDFXMnhEOTEr?=
 =?utf-8?B?VHl1UzJGSlBDbnhONXhSYkJ1YkkyZkN5M3ZNR2VZakk5R0ZnZWx5cEk5QndQ?=
 =?utf-8?B?WTV4bGVNNmZ1MEZqZGFaZm9rc3UrT3BaSGVEU1BCdnJaRlVuMWQwYkIvSlQ5?=
 =?utf-8?B?VnNMd2d2amw2QzUzNU5Yd3MxMjhmOS9ZLzJUYWd1ZlhYKzJYOGtmWGdjbVpN?=
 =?utf-8?B?OUJDUVljUHhrZnFJbmVTMEhpMU0wWWErSGIyN1JiKzllT2EyKzNEelVTOThl?=
 =?utf-8?B?NWpnakdmczNyd21HVEh2MEFqZDNQVGFIRmY0YmEwc3hWMDV0MURYTUdtL0Qz?=
 =?utf-8?B?VVI1WDhTem4wUXQrL3U4SWI5Slp5TGZ0Wm9nNHJ5dGNLRjR5TXA2Tnl2Snp2?=
 =?utf-8?B?emJuOGoyWHJMNmtabHlOVDZVNEtpYVhZZHVhVW1qRW8yTFR6azlaUGFOWXph?=
 =?utf-8?B?a1pvei9lSnQ0ZjBQU0dxL0hFQmNuQ1MyTGxDZmhyRk9OSXUwdnhRa25zQ3dW?=
 =?utf-8?B?UTVSQVJ1MXZNYjlIUy9yZ1VQblJjeGZOWmExcVh2UFUrYlRBeUxPRUZnUkpE?=
 =?utf-8?B?a1NBL29hcHF3WmVOUENVUjRiYXhJK3Jiamw0dWtKTVFWVXhWWlVmWnRwTjM0?=
 =?utf-8?B?dkZNOThhMHhKekRWUlZLR3RyQ1M0M093VEtpTVV4WThyNjlXV2ZXaEdYV0hj?=
 =?utf-8?B?aVpOWWJJdm1mOS9Xdk1LK2cwN1B3VDBJWERXeXg1NXlXd2ZIU01QVGlvaWtS?=
 =?utf-8?B?T2U3cG5ZK0k1TTZTOGgvVXNtK3g2eUhIOURLbEVVL3VoazJxYkZXV3pwSHpT?=
 =?utf-8?B?d2hsUmhLV0hBUzQ3amE2d09TQUFKTGk1K2tZTUVrMjZFY1hLOG96YWhDeS9l?=
 =?utf-8?B?bjk0aGExYi9IbHA3NXdDdnRSKzgrNDdlS0tDQXFuNTdYTHBacTQ3RnV0SFdu?=
 =?utf-8?B?V1VUbTVTSGV6TmlpOGU0Tmg1aVAzOEQxSXNObWEvVGtmL0loWG84d1dtay9F?=
 =?utf-8?Q?T/jm9Oolp9Q=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CYYPR11MB8430.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?S0ExQWFYdkxCRGxETFJ1WndqQUt3NUJVNnE2UTJCbjFPeG9EdXhJOU50NEk4?=
 =?utf-8?B?WFNpV052dDA5YkdqWDdJZzNtNmtQb3RkOFJ3b0R6Q1dXOWF5U3FMUno2anBV?=
 =?utf-8?B?OU5sRWFUWHdqNXNSd0FpZGhGd3puM3I3WkRLcTRPWU84SnhwMjFWTkJHNHpr?=
 =?utf-8?B?TU5QZTdlOGJnZXZQNldBOXMyaXRkYjk4cHdnL0pPRUJEc0tpRHZMT21kbm5z?=
 =?utf-8?B?WUxBM1pTcHkyUFZhS3NiWlpkbGE4emRINkZjTDk5Wk13SWhwaWpHN3ZJNDd1?=
 =?utf-8?B?MnJtR2xlanFFNUp5dTJMZkc1dWF4UmEyK3pJTGpna1g4QUVRcElZMThoS1Q1?=
 =?utf-8?B?ekpwVmdmQ3BEaUpTK01RZHBvMGNIMmxEcUcwK2ZYMHNaelo0U09SVnhTL3g0?=
 =?utf-8?B?THRncDY3OTdDSTJubGdVUThFMlF1UkdCVDg3b09pU3pWanNURDZsK3ZOOGJR?=
 =?utf-8?B?MzlRd3dXZEJyNFhwVTQ1TWVZNjYyZ0k2UWJCRWpEUVJUM2ZoQTdHTDUzb3Vk?=
 =?utf-8?B?U1dJM1ZhMWFOVlpiaVBKeTJjVkNaVldzZTBLMXk2cnYzT3lMbEtpMTZha1Zv?=
 =?utf-8?B?dnFqK1ZlYTdJMDRuek5mUjh6NGRJVjhnQ09MbWoxR3lBUVhMQXJYayswYm1S?=
 =?utf-8?B?N1BnUWdwRVd3YUpHeFhObXR1L3pDZVM3TEVSc1pVdS9zRDVUMWxoT01iT3Zt?=
 =?utf-8?B?alN3bHFYb24xM05vVHFHWElGTmt4Vm01TW9JSGsvb1ZrcHBuZWNLeTNvRTF4?=
 =?utf-8?B?YXVBbGV1dzV4SGlHdk9USS9wNGc4VHAvM0tXczhqeHFjVXBqYW9Nc3ZEYXhh?=
 =?utf-8?B?QVd4UDBqSTEwcnY0cVpadjVYS0lCTnpCSG9xbEJjZTg1a3ZXa3RqNDRyZm1M?=
 =?utf-8?B?cHkrTHRXUmdmck1GN0U2L0ZKaExhYmt4SUcyYStqRnE0R3BBYmtCaGRDZzFK?=
 =?utf-8?B?azlacHdXaEtyNm1URFptZjFicDMyMmcydGpqdlJHbHR2YWUyZWlBenQ5Vm5o?=
 =?utf-8?B?K2RmdVp0bFNRVzczQW02cWc1R3FvN0laMHZIWVNUVWdJVG45QUJ6MGs2Q09Q?=
 =?utf-8?B?NEEyd1M4UnZLQzI0c3h6Nm9FV3BLWk1NSDF5cTAwcFpoVkdRUkhwZzlvZGd3?=
 =?utf-8?B?alkzVFBRSWQva09XUW5FNDFhSExvR1BxVFNkRGxRa1lkZ0orOC8xd0c1bTVT?=
 =?utf-8?B?ZXVXbHFiN0hJUlhuQzhkSUFTTFQraDdiNFNJcGNqYURNdjF0MG9LakMrcjhm?=
 =?utf-8?B?enJvS2tzR3hsQUhmR2lKVTNybU5jeWhRR3g0K3RwSEF4cWw3QzVSWDh1MzhM?=
 =?utf-8?B?WFRvcFZNUElOa0dVMGhlalhRV1RVTWQrY2FBZnRRcVIvWkJYRGtvemViamds?=
 =?utf-8?B?OERWYVkzTWNFajFHQWk0NHduZ1BCUlp1eWpSRktiUTF6T3ZZakdBNU5PWEd2?=
 =?utf-8?B?cTVuR3FuKzlqVWNraWQzRkJUVnVNME1ST204UUpkVjFmTHhJQlRNRnhob3lj?=
 =?utf-8?B?TFJuRDUxRm1OMGd0ZlI3RGRGSnprWlFBU3orUEk0QXl3VkJreVZpWWZGYnVM?=
 =?utf-8?B?RXlzMll3RWRtMFNJTUN1OXNPbGhNVDVYY2hTZlFsdnZ5aVgxMzBSdXJxQzRv?=
 =?utf-8?B?OHBBQmJWMW54THpHVERTekY4NS9uclBZZHh5SWhnVmtNYldqVWgyekZIdlUy?=
 =?utf-8?B?UUZ1ekVSMlhIWXFjM2VBSlZGMUZhb3o0U1RYMDNBYnRXcEJWc3JhMGRyZmht?=
 =?utf-8?B?N3ZHejFmdlpjZkk1MFRJSk5rdmpUaDhPM0tkbW9DcmdSMHhnM1BNRDQxM2FZ?=
 =?utf-8?B?M3REQVNuUzZ6eVd6OHg2TUJ3c0Uxc2c2ZUI1bmZkRVBRZm84VEdkN3ZFSklo?=
 =?utf-8?B?dGtsWEhzSTlsR1NGWld5TC92TFRCL25qRmhyNkxCbFgwaC95SGtadmhQUUxZ?=
 =?utf-8?B?MUNUOTZQUi9uZnhraWNPc3dXbVJmWGZzSTZxU2Voc2Jjc0JxNWtsYWRsRW4x?=
 =?utf-8?B?UDNUNVBHVnljZC9wRXhkKzR0ekM1bE1seWxTMGlyamIrZUNoWnJvVytIRXIz?=
 =?utf-8?B?ckVmL2RuMnB0Y3ZUN0NpcXU1U3MyTFdxZWM1NWprMnJ3eGFDNEF0VW04OWRT?=
 =?utf-8?Q?iZWLXUXTtk/oTbiS50TCUdDo5?=
X-MS-Exchange-CrossTenant-Network-Message-Id: d32b8995-458b-4645-5869-08ddd3779182
X-MS-Exchange-CrossTenant-AuthSource: CYYPR11MB8430.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 16:54:25.4633 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TfettWREjjl/dvOixUsM3+qI5MV+NmdSNimNGRXpUT7p+hbwSYgPdpcFRybA0DDWO8kSnRqUDzjEpfjTonC6zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5825
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

On Mon, Aug 04, 2025 at 06:20:57PM +0200, Michał Winiarski wrote:
> On Mon, Aug 04, 2025 at 11:11:39AM -0400, Rodrigo Vivi wrote:
> > On Mon, Aug 04, 2025 at 08:30:12PM +0530, K V P, Satyanarayana wrote:
> > > 
> > > 
> > > On 04-08-2025 20:21, Rodrigo Vivi wrote:
> > > > On Fri, Aug 01, 2025 at 10:00:17PM +0530, Satyanarayana K V P wrote:
> > > > > Enable Runtime Power Management (RPM) for PCI Express devices by utilizing
> > > > > their native Power Management (PM) capabilities. The specification (as per
> > > > > section 5.10.1 in PCI Express® Base Specification Revision 7.0) mandates
> > > > > that Virtual Functions (VFs) without Power Management capability inherit
> > > > > their associated Physical Function's (PF) power state.
> > > > > 
> > > > > As per PCIe spec "If a VF does not implement the PCI Power Management
> > > > > Capability, then the VF behaves as if it had been programmed into the
> > > > > equivalent power state of its associated PF"
> > > > > 
> > > > > Since Intel GPU VFs lack PM capability implementations, VFs power behavior
> > > > 
> > > > If this is a true statement your patch below is wrong.
> > > > It should simply be if (IS_VF) return;
> > > > 
> > > The current GPU VFs are lacking PM capability. But in future, if VFs (new
> > > generation GPUs) support PM capability, then VF should be able to manage PM
> > > on its own. As per spec, if VF does not implement PCI PM capability, it
> > > should follow PF power states. If implemented, VF should manage PM directly.
> > > 
> > > So, checking for both pm_cap and IS_VF.
> > 
> > So the commit message should be written in a way to explain that possibility.
> > 
> > But anyway, please step back for a moment and think about the whole flow
> > itself and the reasoning behind pm_cap.
> > 
> > pci subsystem is the one already checking the pm_caps before doing the
> > pci pm transitions. If the check is not there, please go there and add it
> > to the pci subsystem.
> > 
> > From our side, if we need to avoid that VF follows the PF and goes to sleep,
> > then the PF needs to get an extra refcount for the whole duration of the VF,
> > so PF won't be allowed to sleep then VF will also not sleep.
> 
> PF is already taking the refcount, from PCI perspective, VF device is
> never going into low-power state.
> 
> Main thing to keep in mind here, is that runtime_pm is decoupled from
> PCI subsystem. It's the drivers responsibility to actually trigger PCI
> PM transition into low-power state as part of runtime suspend handling.
> Usually that's one of the last steps, and before that, the driver needs
> to make sure that the state of all the resources is not "lost" after
> moving into low-power state, and the driver is able to recover that
> state as part of runtime resume.
> 
> For VF that doesn't implement pm_caps - that last step, which is moving
> into low-power state is a no-op.
> In other words - for VF w/o PM caps, with the current driver codebase
> we're going through all the driver-specific extra work in suspend/resume
> handlers to end up doing nothing in the end.
> 
> Perhaps the commit message is not expressing that clearly enough, but
> the reasoning behind the patch is simple - if PCI PM transition is a
> no-op, don't do any extra work (by not using runtime PM).
> 
> Does that sound reasonable?

Finally a reasonable explanation, thank you!

Satyanarayana, please make sure that this is pretty clear in the commit
message, and also use if (IS_VF() && !pm_cap) instead of the inverted negative or.

Also worth a comment in the code as well right before the if:

/* For VF that doesn't implement pm_caps, the rpm functions are no-op */

Thanks,
Rodrigo.

> 
> Thanks,
> -Michał
> 
> > 
> > > 
> > > > > must mirror their PF's state. During VF creation, the PF remains active
> > > > > from the PCI subsystem perspective. To maintain consistency, explicitly
> > > > > disable RPM for VFs missing PM capability to ensure they follow their PF's
> > > > > power management status rather than entering low-power states
> > > > > independently.
> > > > > 
> > > > > Signed-off-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>
> > > > > Cc: Michal Wajdeczko <michal.wajdeczko@intel.com>
> > > > > Cc: Matthew Brost <matthew.brost@intel.com>
> > > > > Cc: Michał Winiarski <michal.winiarski@intel.com>
> > > > > Cc: Anshuman Gupta <anshuman.gupta@intel.com>
> > > > > Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > > > > 
> > > > > ---
> > > > > V2 -> V3:
> > > > > - Fixed review comments (Michal Wajdeczko).
> > > > > 
> > > > > V1 -> V2:
> > > > > - Disable RPM only for VF devices when PM cap is not implemented.
> > > > > ---
> > > > >   drivers/gpu/drm/xe/xe_pm.c | 14 ++++++++++++++
> > > > >   1 file changed, 14 insertions(+)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/xe/xe_pm.c b/drivers/gpu/drm/xe/xe_pm.c
> > > > > index 8aae66660931..019de04fa7bb 100644
> > > > > --- a/drivers/gpu/drm/xe/xe_pm.c
> > > > > +++ b/drivers/gpu/drm/xe/xe_pm.c
> > > > > @@ -246,8 +246,18 @@ static bool xe_pm_pci_d3cold_capable(struct xe_device *xe)
> > > > >   static void xe_pm_runtime_init(struct xe_device *xe)
> > > > >   {
> > > > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > > >   	struct device *dev = xe->drm.dev;
> > > > > +	/*
> > > > > +	 * Disable RPM for VFs if PM cap is not supported.
> > > > > +	 * As per PCIe specification, "If a VF does not implement the PCI Power
> > > > > +	 * Management Capability, then the VF behaves as if it had been programmed
> > > > > +	 * into the equivalent power state of its associated PF"
> > > > > +	 */
> > > > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > > > +		return;
> > > > > +
> > > > >   	/*
> > > > >   	 * Disable the system suspend direct complete optimization.
> > > > >   	 * We need to ensure that the regular device suspend/resume functions
> > > > > @@ -366,8 +376,12 @@ int xe_pm_init(struct xe_device *xe)
> > > > >   static void xe_pm_runtime_fini(struct xe_device *xe)
> > > > >   {
> > > > > +	struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
> > > > >   	struct device *dev = xe->drm.dev;
> > > > > +	if (!(pdev->pm_cap || !IS_SRIOV_VF(xe)))
> > > > > +		return;
> > > > > +
> > > > >   	pm_runtime_get_sync(dev);
> > > > >   	pm_runtime_forbid(dev);
> > > > >   }
> > > > > -- 
> > > > > 2.43.0
> > > > > 
> > > 
