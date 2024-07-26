Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83D1CC3DA49
	for <intel-xe@archiver.kernel.org>; Fri, 26 Jul 2024 16:19:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C15510E2A0;
	Fri, 26 Jul 2024 16:19:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="K8FrAwWF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB2FD10E2A0
 for <intel-xe@lists.freedesktop.org>; Fri, 26 Jul 2024 16:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1722010789; x=1753546789;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=zif9t+YSs5FYTTchU9BOU4304vvcxrgzBoD41YONSmc=;
 b=K8FrAwWFG+G1G8zMVaU6/Fo62pqvo9k9JKtowUaNJ/4IrJam2+2mFa7H
 6v7NzLll3zW+gkdQ5NLsAtnAD0mrLCw+wnes513KouJHa4nx24h96hly7
 fHbAuRo/2MOgh0SGsmc4pas28UVTUNV44C9R+m3l0wFt6tnqoZyhCFwXq
 lt98igGIjNXJYIu4fTZvfHVjwbJ8r8xl/ctEl6mpPkToLdRFLJzmZQ2xM
 CO3puJ6r8Q8c1j11cYWe6KzgqEkR5YXrf/c+4P2Oti8Xp5tDaxvDe53hO
 Giaaqc1g4bMIrSu+bGcfEJgCJMDjUB5Ub0Dm5vG5i4QAoPD2SCF2/UyS0 g==;
X-CSE-ConnectionGUID: x2PgzENFRHaMHhfhQW4/hA==
X-CSE-MsgGUID: NOFEOBLDSyCl4qfpXLEyCQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11145"; a="19772089"
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="19772089"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 26 Jul 2024 09:19:48 -0700
X-CSE-ConnectionGUID: B5dILqRxSC+JouLRCGmAQw==
X-CSE-MsgGUID: 0Kfu/OVsS5yTwntLMP2etA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,239,1716274800"; d="scan'208";a="57892408"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa004.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 26 Jul 2024 09:19:47 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:19:46 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 26 Jul 2024 09:19:46 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 26 Jul 2024 09:19:46 -0700
Received: from NAM02-DM3-obe.outbound.protection.outlook.com (104.47.56.41) by
 edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 26 Jul 2024 09:19:46 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rd+TcPqnQ1lhKtASZ9xWrHRvNvZ53QI/VsRNl0svkrDkVUrNK9ki+hsxTq8drEms3ec5EnD7qhZ3B59K8ON3Z4+iNeQ9swkcKnNa47oKWsSMpRx4hS8QoQIl1XNQZ/xAisk6NkFsQDV+Rq7VollZn2SiN6V6GDA0bgCayEwgIwQYrvA2c/68kfoyMk9KsYFnDKCi6BFNr5oaiv9H1il7rJYOqnVcaNnhcWCcT/Aun7Si5W8gAU06KhQ+VCtL552X8q20Hox/f3G2TKveO5vEgPJJc+t5DkUSXX3awWxBUCSsmV8xl9so5o77NToHHFNUgXlabiGEPA3lualaQAcf7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vOdRUO2PhiJXHhrn7HjW5H4CBCdWFvVr6XGX6Ah+SNQ=;
 b=EgNRi9CA9YKsUGDHq6I9zYvoHVJ84KGJePrGLw5K/s8NIp0O8EPVCSjLNl/OiPP04uSs8hY/RwdrB6MSsI+Q1uK3FveOlfv8V+Nte4wWIhbLaPZ8WQ03z+CYubiQyw468jtXFXOlt+QDsS8EMyFt23NOqcxm/kC3rJiGQYVSFO4fk+bJlpjyALpw+WofmgEKqxKfTnkbVXE9MJ5eVKNQrovnL6R8aAUjLRs7mkB28fP2cRsnrN9JSh3IUHNGIVFo3881yYhYc4wG6JAJBbam68xAQNW0hkT3Lr/tUmDWRzjH7whDJDW0UycrHVuaZFU6Jk5ikHqsCWwfaPayfx8bog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from PH8PR11MB8287.namprd11.prod.outlook.com (2603:10b6:510:1c7::14)
 by MW4PR11MB6668.namprd11.prod.outlook.com (2603:10b6:303:1e9::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.17; Fri, 26 Jul
 2024 16:19:44 +0000
Received: from PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350]) by PH8PR11MB8287.namprd11.prod.outlook.com
 ([fe80::7e8b:2e5:8ce4:2350%4]) with mapi id 15.20.7762.027; Fri, 26 Jul 2024
 16:19:43 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20240726064337.797576-6-lucas.demarchi@intel.com>
References: <20240726064337.797576-1-lucas.demarchi@intel.com>
 <20240726064337.797576-6-lucas.demarchi@intel.com>
Subject: Re: [PATCH v2 5/7] drm/xe/rtp: Fix off-by-one when processing rules
From: Gustavo Sousa <gustavo.sousa@intel.com>
CC: Lucas De Marchi <lucas.demarchi@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>,
 <intel-xe@lists.freedesktop.org>
Date: Fri, 26 Jul 2024 13:19:38 -0300
Message-ID: <172201077887.1586.17959286967338886800@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: MW4PR03CA0252.namprd03.prod.outlook.com
 (2603:10b6:303:b4::17) To PH8PR11MB8287.namprd11.prod.outlook.com
 (2603:10b6:510:1c7::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR11MB8287:EE_|MW4PR11MB6668:EE_
X-MS-Office365-Filtering-Correlation-Id: 56d02a65-b64c-4429-01ab-08dcad8ec266
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a3Jhb3hib1dPRmlQaGYyQ21OZk8vU0UzbFhMSXVhdTBrODhRSWtXQzJYK3B1?=
 =?utf-8?B?YUV1aGpmVnp3aGpvajhLRHZKMkV3RGpSOFFTWWhzRlhxQWNzWmFmUGdCbUpW?=
 =?utf-8?B?OUo0VmhKYldobklBa243RS8veE5FUC95WXFvdkZtK3ZMZVp4b2JDelpkUDR1?=
 =?utf-8?B?QVptNlN6MDVXYko5ZVRhZlpHTUxIdlR6aFNRbWc3UEFtUmhLMHhycEJyVTZY?=
 =?utf-8?B?OU9NSEZXTlcyVk04VCtGMmVaOTVRT2hDYnFVeGg2S3hTSjVVa1RIdnoyV0J4?=
 =?utf-8?B?M2ExS2p6VmdvYWlpYkVIRXVmc1BWY2tEd1lFWTFYcEJ1MnJaME9QYUYrQThu?=
 =?utf-8?B?ajlGM2pZNmxZblN4RTcrbnlZODUydkhGcDhpdjg4MXQvOG9ab1dJTWdwSVMx?=
 =?utf-8?B?M1lDL1AzakRyaGRTUnhacXhtUldSRWVpWE9LU1BaV3RZUDZUc0NiYWxpNE56?=
 =?utf-8?B?YjFCWGp4NUs4UGM5cXoxdHpKbnVaYlo5a21YUmFFVHN1anBRU3hNY1hKank4?=
 =?utf-8?B?QURVNXloQkxrd0NmRVhFTU93RUxJRlFXa0dPN1ZnSE5WbWxhTnNGK2hTTS9H?=
 =?utf-8?B?RDdjUTY5OEN1b0p4a2p5WUx5RHdacTM0Y1VTLzZMc0hNK0s5QTFWNVVFbTRj?=
 =?utf-8?B?c2k5ZVgrVGpiek8xQ0FyWmtjNjJoQXpETjJDR1hwY1ppODZjNUR2Zm5yTFlB?=
 =?utf-8?B?SFR1NTNYYTF4UWdacTR2UlZwNGVhNnFhc3AvWW1qQ09mNlZZeHJXVzVoT0d3?=
 =?utf-8?B?RkEzRHJCYXc5K1MzOXhUTmd5Ym5yYjFvQVVqdXFGS1U4bDVFc295NzMvTW80?=
 =?utf-8?B?K2p2R1VoclRNN1p6NUxxRzJITHo0WithUHFJYjdZdE9WTENYTjVDOFordmhj?=
 =?utf-8?B?UDNVOENaeTFKZzF4Lzg2dkpuRVVIRHdTRkMxYnZUa1FpemFNVExPSVFVNmNV?=
 =?utf-8?B?dmp2R2UxdmFOVDJOZDNLQTcvY2V0SE0wYkRwRG1GQ29kb0hSN3NkdzNqSVVi?=
 =?utf-8?B?MkpVNmhvR1NvTnFPYTBJZmNlTkhMVTYxZGRsaHhIZUpaZEdNM01lazhpdmNE?=
 =?utf-8?B?Vzh3SFJXdGJzZ2tRUnRRQjQwU2FaM2FERkRnOEI1K0kwK09hV3FNcGxFbHdh?=
 =?utf-8?B?bnZHbTgwWTAwLzEyaXcwSytCTDBvKzhMd3VQQzc1VGpGUXBXWEN3eGlYZ0xl?=
 =?utf-8?B?RXVLYnhmb2F0TnhZTXp4NXhzODd5SlNSLzhoWEtFbXErQVgvK1JJcC9HUnVD?=
 =?utf-8?B?WFdqakF5ekZxRGpMbXI0T0pWdmFGeHlVeFhZTGkwQ1lxcFB6RHo4OE9vNlYy?=
 =?utf-8?B?VGlQcGlLM2N4emcxbk5vOE1HbUp6Tkh5RXlXVE5nelFJbmlOTUNncFdOcncv?=
 =?utf-8?B?ZHRRVFNCREV4MmRtWkNwQkpXc2hObjZXZWtTVHdTb0VXVkJIQXd6QVdaVThE?=
 =?utf-8?B?MUdmLzJOdmJaOUxNNE5lMnRjMXpQeWI4SVVUTmxTaTZpMGhqaHNMREVGMEhk?=
 =?utf-8?B?L2VrTUZJc09DdmI5a3lYeWNqN3lTZjRPN1V6VlBSRXJtZHlMV1NzUjZvYyty?=
 =?utf-8?B?Rmp3OTJYNU4zS1ROdms0dnErSFMwdVRIUjV4L0E2S2hCMVZhWkJNQnZEYlBB?=
 =?utf-8?B?QTU4R2dMUUc0eVBqSFRKY3ZjZS9aVDMyZVljZGFqZys2eVFLL204WG9hVGNC?=
 =?utf-8?B?a0dXT1pISFhVVXFMdzVtdEJVS3dJTGlFa3l6K1ZqSHpNcmVtZlE3cWVMSXli?=
 =?utf-8?B?M1JENjRPN2pRSTR5VFdIZU9FTnRDdjBhOEx5MUh5NFM4SGRxSGtTSGVydHp3?=
 =?utf-8?B?cjdOeFdwV0FpWjlnS0tVdz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH8PR11MB8287.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N0dtbGt3V0dwWHdXYkM4WVpCREREVyt1V3hYc2swL1B6L1JJOFRzNkx4S3Ft?=
 =?utf-8?B?UWl6SitSamFwZXNiYVFSUHRTeE8wWVFKWFhaRzYxOVU3ZnNiTlNwMnREc1ZV?=
 =?utf-8?B?UXhwVmZiVko4QUJxRUZiaTVzVlArYnZkSGxjb1MrUmxRYjZMVlZpMFZ0WHhi?=
 =?utf-8?B?WEFpZUlGRDFIRVp1bEoxUllhUjBpdlJtd0hpM1BZdUsvL1R1U3ExMDFxQzJL?=
 =?utf-8?B?UGZsQXV4OFFuVjdxOVdvL01BNTc5YmRrY04zUE1xMmk0bW0raE9HVG1jRnVj?=
 =?utf-8?B?aksxbUl6ekNyZWNZY1hYMTZLMElYKzhqeGZuODJpcmlOYlJTVWlBZENXT21O?=
 =?utf-8?B?VXB3bGN5K05FdWxVaDREVkFwVFp5NFhQOFlEZEpDUS9aWUE2ZW9qckZuV0o5?=
 =?utf-8?B?T09SazdvYS91Z3BkQTY0NzRGbVBXRzJiVkNoZ0ZTdnZvSktRRTNXUGZPVE10?=
 =?utf-8?B?dFR2UHVQT1ZKMnBnWEdXYU9uaHZrRGhJMUFmVjBQTm5HU05KRjJVNWVSQm9E?=
 =?utf-8?B?RmdIRjdwVGVDY2ltRHptRXpoL2tlQS8xZTBHRHZiSlJqekpqOUlqbTR0MmZU?=
 =?utf-8?B?ZTRkRE5GMkFmMHFIT1F0ak9rY3hnbnZMdU1XRXhjQjkwUnp3bVZROHJmb1JB?=
 =?utf-8?B?ajArd01VRldzNEVJaW1ab1JRZFRpc0NJQThlSGxGVmhrSEFFZ3Bpb0lMWFRY?=
 =?utf-8?B?ajJmRFhkd284NlhaL1JuSC9xSS84dWNaZXBmaXdJdXc1WDBnUTRaaUlxYnJP?=
 =?utf-8?B?dE8yUFVxTk1rdFBTUEQ4RHM3ZXVtOFJtWG5kTG0yWnZNNDBoUndCdlFNb3oy?=
 =?utf-8?B?UGQzUTNXbW80RmhreW56TDFhMUVpZDNlY1pNRklNMFdQK01xQ1BwWDI2V1JK?=
 =?utf-8?B?dTJVWGIwUmJlZi9yRU5KODVDZi9DUktkdXhScnBMT2t5Nm9tU3ExUEFZNjVz?=
 =?utf-8?B?cFQ0ZlFuQjZ6dlczL0o1ZW1tSGJ5NkoxMXBxNSt0Q0QvMFBqaTFiZmxSYkx2?=
 =?utf-8?B?R2gwdXFRRFlMSTZwd3JDT3lBckQwanFodHBOUDJFNFdoSTFqMHdYblV5K21a?=
 =?utf-8?B?ZjA4b1JoVTFVemtFY2QvTi9UZUpFMTlMc0p0a2pKR1JhYlBYVjFYYU1MV1NC?=
 =?utf-8?B?WGFIUDRNRkRtd0xxbE44eFJpKzZIb0JCbDZkWGt5TTZtWTZ1c24xcE4xVjZF?=
 =?utf-8?B?S1pFTGZLS2QrS0M0aXBDTnd5dWxyZzcvVTFCY3F0bllzNE1rTjVUL2JTdlZk?=
 =?utf-8?B?NiszNWZhaFdSMGlxWTJXV3VtRHMxVFRaQVh0djhqaXNka0kvWlI4aHRRbFlR?=
 =?utf-8?B?aVVKVldXWnQvQ1Q2NlVjUWxLenJGNURSR3VrcjdCNEp0STEraUdOVWlhWjlp?=
 =?utf-8?B?dXBlUXRkQ0xobC9vM2FTcWM1S2I1NHdyc24xajI5ZmNjT3pGcWRyNzhWOGZ1?=
 =?utf-8?B?MmVmbWhkVEIzQ09tSHkvb0I3bEcrZ2JKUzRNK3lWSGRzNWNaWFVUWGVSbkNX?=
 =?utf-8?B?eUdNbHN5a3VicCtmL2hpOERhNlhEcjhUZkd1NHVPOWVzemNPa1lxZU8vcUUy?=
 =?utf-8?B?bUMvM0RlOHRQd0NpclNsZnZZOFRzZG9yVC9CUXVZTVdpY3Q5WFczTlRPbzNs?=
 =?utf-8?B?VUVjcGF0eDJ6dVlJNHAwdkRnaEpiSEZ3WFZoWnJoV3pQT05ieTlNY0daZk5E?=
 =?utf-8?B?L2xKRWJJS2t1QWFLT2FBOWloc092NjMyQkx5UnkwZ041aEpFWU4wR1ZpeWhR?=
 =?utf-8?B?QkZrT2NFUUF1UlhSMGNpdWkwbDhYdHZRWVZKQWlra2tqZnFnMmx2cGpBNVZw?=
 =?utf-8?B?QzNwVm56WmMzZVIvZTVzSVBPd1IrVm9OeCt6b3RqV0l5cHVDOWJvMm5hMUFk?=
 =?utf-8?B?dWlBemVNc3h2dTcxU3VVbG5ad3V6RjdYMjBPbm9nZmZIdjJQMFlyRm5mS21M?=
 =?utf-8?B?WDFTeld1b0RTVFpuVko3ZlIrT2tEZEMyclZ3YngwUGs5Wi9ZRFJiVTdLd3A2?=
 =?utf-8?B?eDFQbXp1a3hKcWtPd29wYmkvWE02NHNUY2lvWVhBVk95V3cvcjFqaHdIRDNk?=
 =?utf-8?B?L3F2TG5yblQzYnFzN3NKYUJrVW8xYXNGVjJxbGZQbEZNc3NONzBMYTF5R2l5?=
 =?utf-8?B?NStEUkFabng1V0hjdyt4ZUJQbGcwcGcxNW5VUXlQN012TEQ2Y25IWXUwSFRF?=
 =?utf-8?B?ZHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 56d02a65-b64c-4429-01ab-08dcad8ec266
X-MS-Exchange-CrossTenant-AuthSource: PH8PR11MB8287.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 16:19:43.9099 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KrywKkQ9Rdln7BopKBiE3ZukCktNwlgtTEzWNNsH6O5BsNfDlN84xBu3yfTp1vkVDACLrVphF0GKR4owfmDQPw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR11MB6668
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

Quoting Lucas De Marchi (2024-07-26 03:43:35-03:00)
>Gustavo noticed an odd "+ 2" in rtp_mark_active() while processing
>rtp rules and pointed that it should be "+ 1". In fact, while processing
>entries without actions (OOB workarounds), if the WA is activated and
>has OR rules, it will also inadvertently activate the very next
>workaround.
>
>Test in a LNL B0 platform by moving 18024947630 on top of 16020292621,
>makes the latter become active:
>
>        $ cat /sys/kernel/debug/dri/0/gt0/workarounds
>        ...
>        OOB Workarounds
>                18024947630
>                16020292621
>                14018094691
>                16022287689
>                13011645652
>                22019338487_display
>
>In future a kunit test will be added to cover the rtp checks for entries
>without actions.
>
>Fixes: fe19328b900c ("drm/xe/rtp: Add support for entries with no action")
>Cc: Gustavo Sousa <gustavo.sousa@intel.com>
>Signed-off-by: Lucas De Marchi <lucas.demarchi@intel.com>

Reviewed-by: Gustavo Sousa <gustavo.sousa@intel.com>

>---
> drivers/gpu/drm/xe/xe_rtp.c | 2 +-
> 1 file changed, 1 insertion(+), 1 deletion(-)
>
>diff --git a/drivers/gpu/drm/xe/xe_rtp.c b/drivers/gpu/drm/xe/xe_rtp.c
>index acb35b95a3f6..f054ac9cf06d 100644
>--- a/drivers/gpu/drm/xe/xe_rtp.c
>+++ b/drivers/gpu/drm/xe/xe_rtp.c
>@@ -232,7 +232,7 @@ static void rtp_mark_active(struct xe_device *xe,
>         if (first =3D=3D last)
>                 bitmap_set(ctx->active_entries, first, 1);
>         else
>-                bitmap_set(ctx->active_entries, first, last - first + 2);
>+                bitmap_set(ctx->active_entries, first, last - first + 1);
> }
>=20
> /**
>--=20
>2.43.0
>
