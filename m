Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBB33CCF9E9
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 11:17:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79B3710E056;
	Wed, 29 Oct 2025 11:17:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="R2MDnYNF";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.21])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA4D410E056
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 11:17:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761736658; x=1793272658;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=3LD1Gy05eKmFiRdGyrEFCXduDynn89ZC5aFrj2/L7bQ=;
 b=R2MDnYNFQ/1LDzqcyw7x8iVbEE3HgG21QGXPp7HwtoxTwA/iO9/Gi/vw
 9KK2pZe8n/mChB+AvgFiqLpiIXliE1ZXBfuJGcxcFHd3Y0rRyHTolRnNr
 7SbUl5HCWxaf+DPKxk3fqXYNDN7+bOJcR1SJc4Svr4hT0bzQqrtDHxqpv
 GiC8aZKAUOthmCLsH7KuBojg+znmsiz8Iys2AY3UtPDM+++GWsX/n1+P/
 TVmwLaQfB3hseLyglB95nPGSpz+xcbewD84cXNhKfyylVnvlX8YNkhnpw
 PES+F1XlIOyCPeVlxQs5xr8y6bzyIuCt5+E0nveLtGiAXmf6FPCpLo5Nj g==;
X-CSE-ConnectionGUID: eTRG6aXdRNKsABdgBvGRhQ==
X-CSE-MsgGUID: KUVqx9weQoW6gEUjPZ8Y+Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="63758040"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="63758040"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa113.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:17:38 -0700
X-CSE-ConnectionGUID: a850rLlAT5CNxzelJxyOyw==
X-CSE-MsgGUID: /q7yaYA0TDqene9hKb//fA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,263,1754982000"; d="scan'208";a="185262517"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 04:17:37 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 04:17:36 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 04:17:36 -0700
Received: from MW6PR02CU001.outbound.protection.outlook.com (52.101.48.16) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 04:17:36 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=brdcwb2jQTdP5yDr/CK4LB5++JTScOCf+mX6Wakwss7ijQVjduJmdvVFuZsLyeTi8AYcgB6BE3Q8qlRr8vMysoRrb0xfEp3PfrOoHoy2tE+Y/JCe95wcZKtMxHCBRf0dbGX8BY3+AxXsd2WY4Z6GRDeijwmfrxhsaiAY/rmotqSPQlAJd3v4ukIJTMq3FqaBe+XbebvgxbBxZxTxXaXmd2Iv3f6MifaUnahOf4Tpp0yTlftarVM9Qf5c3G8zg7ECzoVBIRdn6qaNZSPztLwvgIpiIGoS1qu4RxDnQeh/rkMYzb30VYb/Of2DqEbI8K5zG0BOC4n3aybGu4MjvGz2CA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o2QR26Va27DrvabhFXbEQJOrx+VkbebN4ZnhmyEsECo=;
 b=uWePOrF0FzsTsoTtR+Al3hBqtLLKpo456M2V6fuSCe1jo4H0r8ptbUbcHuKwH5FCs1XWULQW1/ec9scNKkNPq1yAVBcf95236PHnekAfA3Up4Pp6b6e9vG5BaSvpIyUq4LFjolzjA6jtFPOT99R6mhHzzWx4W+8M7a49HGnXUGPEp0mVh+rzuHoDu8Q+At04a6D6RLqrnCwK/+FlefFW1PSCZHZa+a5B9InugTWw+0B2LBWR0ZSv+5H9KhOzVpawEJYZSh/UPz43LNniOYjAAZL+iHXfU1JvlJjFPT66GZyFtssDE1RTl1umNoqHhDa8qk2TS8qd/qJk7VTMEnk5tg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6135.namprd11.prod.outlook.com (2603:10b6:208:3c9::9)
 by SA3PR11MB9510.namprd11.prod.outlook.com (2603:10b6:806:47e::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 11:17:35 +0000
Received: from MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a]) by MN0PR11MB6135.namprd11.prod.outlook.com
 ([fe80::3225:d4ad:74a:6d7a%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 11:17:34 +0000
Date: Wed, 29 Oct 2025 12:17:30 +0100
From: Piotr =?utf-8?Q?Pi=C3=B3rkowski?= <piotr.piorkowski@intel.com>
To: Michal Wajdeczko <michal.wajdeczko@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [PATCH v2 05/17] drm/xe/pf: Allow change PF and VFs EQ/PT using
 sysfs
Message-ID: <20251029111730.63a7azuy6ddi35gr@intel.com>
References: <20251028175832.184534-1-michal.wajdeczko@intel.com>
 <20251028175832.184534-6-michal.wajdeczko@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251028175832.184534-6-michal.wajdeczko@intel.com>
X-ClientProxiedBy: DU2P250CA0002.EURP250.PROD.OUTLOOK.COM
 (2603:10a6:10:231::7) To MN0PR11MB6135.namprd11.prod.outlook.com
 (2603:10b6:208:3c9::9)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6135:EE_|SA3PR11MB9510:EE_
X-MS-Office365-Filtering-Correlation-Id: e955f1f0-ce92-484b-4e4e-08de16dcc22d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXhlSVRsTTlWOGsveHBIcDd1NTdwcGxLTmFpL2UvZm1rUjdBTlRGcm5Sa0s5?=
 =?utf-8?B?ejhFc3RBbjBVSGJSQ1VGdFdia2hNdHg3Q1RiUmI2NElyM2xGc2pqNlpIU1hp?=
 =?utf-8?B?ZjIzSm03QmpPTXhMR0NsRCtHN1RTOUsyQjZ4NjQ2NkVTOTdrSGNkTkhMNDYv?=
 =?utf-8?B?MjRKL1c4SGFSalR4ZENUa1lGeHJ3aS9IWDk2cmdLeWpkT2dCMFdLWnFXTC95?=
 =?utf-8?B?WTl6RVB5eG5sdGFkaTYrdVZPUnRvTGJQdU1pZC9tN2xvOXFZZ0dOeGc1cjJF?=
 =?utf-8?B?c3RwbXViN212U1RNUVhCdm5nQTlYNWZDRU9nR0lqdVh6VkdJeW03VWowUHps?=
 =?utf-8?B?SDI4YnpJeHc0WlMzcnNqN21kTFZ3Qjh4NjVybTc1V3JxRVp5K0xaYVhVdU9v?=
 =?utf-8?B?QkRNT0FYWGQxUnkrUjVIellIRE5FQStla0hwMUtIcUJJQkFHTlFFdnE0YkMz?=
 =?utf-8?B?OFo2QzJmaU5CTVR2ekwwUmQxTFlvNURrVTFHTDZwTFBub295WUVzWmw2cGRY?=
 =?utf-8?B?Z1BRMGhobzZOWk9NV2tqTitqQVprZi9iV2tuMWZZQkdjdHVkazFvWm5vOGx2?=
 =?utf-8?B?c1luYjhJd0dJenJCUFZlcUIvekZCSUtlMGpUTytZSUd3S1lNSmt2S0NOYXAy?=
 =?utf-8?B?WmlUaFpLS1pjMHNHbk1xNHVKOVNpdVhEcGpXdkMyVWVmL2VnRHNLNjlLbFRv?=
 =?utf-8?B?QStxT3lCbzhGRnFBL3MzeXZGdjMxb2JBWGZDc0xRd3pPRThoenlLcm80d3d5?=
 =?utf-8?B?NkRkU1BUbmx2TlNvV1ZWYnU3V1JCeWVTSk85MTk5eHpodXZMNlhjaUNUSGxB?=
 =?utf-8?B?elFGb0M0NnFidGZpWlpGYU1Bait3YWR5bUk2OW41UmxGN0FQN0xGN3I5NlV5?=
 =?utf-8?B?RUpmZ0lza1ZNcXNwVTlhTTNmbWppQ2RDMmhDOUE3TnhrRC85dVM3dTZ1eXRw?=
 =?utf-8?B?clBLUTU4eWJoUU1NRUxEbFdWc2M5Rnc0aFlGYVl3a29HaG43MnUzS2NkL0M5?=
 =?utf-8?B?RjVHeGhiY0xaRUhsL1MzK3BUZWJZZzNIUzArRmN3ZVVoYldNL2lQL1g3ckxW?=
 =?utf-8?B?M1VwVlMwR1lOVVg0bW5tOHFqaVA0OHV1ZXNYZTFsTEJqcXJjTGhkaGdXVU5B?=
 =?utf-8?B?SVhrS0RUUWlDajRZUGtsZGN5RzJhYUFaS2tyZGI4bVhsSEp0K0lYc0xvaWNy?=
 =?utf-8?B?NHQ3aVhjaTJLcEJ5bXNjNEFpZlNaaVZSTnZnTnV3cGJWR3EyK0FlYzVRdG00?=
 =?utf-8?B?UmZiREp5RUw5YWFwN3k3bkFKeUZQbnhJT1NXekI2MFB5NXVCVUwvQnpvYmR6?=
 =?utf-8?B?azhteTdscEtpVElGbGdTZEI2ak1DWEkzUlI3QVQ0UDQ0SSt6UGsrWnQ4WEI1?=
 =?utf-8?B?RmF3UXVUUXFlVUhXRXpoYk1RL1dsbFRtWlNtUERRekNnYTVLUUQzb25iUWt5?=
 =?utf-8?B?elErUGZoQ3V1THpjS1JDZVZ3dklxV3d6eEFDaEhMZXRVcGNpZXEwb3NuWmlG?=
 =?utf-8?B?Nlhac0NNRU9VVGtDdWJtR2gydXVLRWQvQkxJUC83WU0rS2xvUVVsTGgyV0l0?=
 =?utf-8?B?ZDZtZkZRZ0xIT1dHdkpBamdoUVp6eW9UVTdzZmRXUVdweURxVW4wcFhVWVRV?=
 =?utf-8?B?SkUvcHIzU2I5SzJnKzF2Si8ydVdGNDFndnB3OFFKRjdNcGtTaHMycUZFeVRw?=
 =?utf-8?B?WFpyY29MU3JYN0xrOXRBOEVxaXoxYVBFajRpMHJKZWkwd3JqbGZmSkQreXly?=
 =?utf-8?B?M3ZBZlF2c1Z3VHpzRzVyWUNyMGJhOHJkc2hveXJ0bXEzMithTWJYUFNvRUUr?=
 =?utf-8?B?Um4zK1c1NXh1RU9tdld4dHovRTFZZXVUaFBHN0hVWVg0bmh6c1FiSmhkSG1D?=
 =?utf-8?B?dkxpd3FoTXZ0Y2Q5WTZxRSt1YWg2b2JrKzRFaUgwZDg0N0tEUzRzTm9taGZL?=
 =?utf-8?Q?CXKNgt/gyqlFR5ry+A3Ric+imxJk+jre?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6135.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUhROUxvaVhlUXNsVEhqUy9pRFo4YlhRd2JibWFxbk5BaVk2bHpHZ2w5Vzkw?=
 =?utf-8?B?c0orY0lNNmd1OE5FN0R1cnlRdGtubkJkTCtPWUlhanBydERRMTdQWnpCdnZU?=
 =?utf-8?B?aVByU0pwUEkzMGdOaGtQK0M3dHNQaWpJd1BsbERhQ2wyUFVWM1RHamhCWVlT?=
 =?utf-8?B?djFTMXZ3ZnJDT00yK0l6TkNqdlhQeGpQZmNNZUZ2M0g3SEJEZ3M5UGsxYzkv?=
 =?utf-8?B?eG0rSnJHQ1JjcEJjdnFJclpmRzF6SSsrOEhxV0k2M09zZTBMQlpHWSt4M2Zh?=
 =?utf-8?B?dXcvZTdrM0toWVorNkdscURaUjNjN241WXhkeEhmdEx4UjlJYjEyMUsycVY4?=
 =?utf-8?B?Wk9YUUx3NVFFdnFIRHlwaDJrRUd6YVo0c2ZhWDVnN2kydlNlQWZ1dUJMSmZ0?=
 =?utf-8?B?SkF3OVVDVVhMK1V6Uk80NTVmMmFmWWJaMVhnTXVpbXR0dC9UZXlnd1JyQ2J3?=
 =?utf-8?B?dkZwMTZITGV3L3RvOWF3MXhhcitnZzNjY1JYV0Z3WEl5bDJGenpqN0RTRTB5?=
 =?utf-8?B?M1JNcCtCdkdnT1dqYkdiSk9BKzNtNUFxcnA2U1pRL0dndi9OdW8xNVV0bkM1?=
 =?utf-8?B?NXpMTGk3RkpTMjNmSWU0Ulhqak9ZY1QrYklQTmhGWmQzSkVMRHMzbXk0RFRv?=
 =?utf-8?B?blVSdnFnK0Y0T0NVMkk0MVpzbUdKWEVSSkgwSjNNKzFNNmZHYlpLTFlwYWQx?=
 =?utf-8?B?QS9EcWo1eHZickxwaURXN09VUEZtdXlaMWFSZUNGSlZuS3B3UDg3T2RZajBh?=
 =?utf-8?B?VGFMczJ2WFNuNlJTNXNldWIwV0FyV0VqZjBwOC9ZK3lMbmh4RWl4REUrZE45?=
 =?utf-8?B?bEdBTmwySGkwR2luZ3N6THB5ekd5STJMcjk0dHpWYXFNYThidWhaOTZQSmVo?=
 =?utf-8?B?TmsyQmFZcXRoRmJWc3h0NjdwQnpMc3BadTFFWmhXS0NYbVpQR1kyM2tyTVFW?=
 =?utf-8?B?YkFrbmhMUy9wcExxUTNOL3gwME5sY0F3ajVGd1JTd2NKeFZXWTJzL3owREp6?=
 =?utf-8?B?YUw2ZmFaYU92bUhwVjNkT3JFUTlUOEk1RFQ0MkJ3TmJnVE9DR0g0NzdrRFRK?=
 =?utf-8?B?ci83dFNxejY2aHNOU0dweE9YdXloMHVxMkU2emQxYjIxUkVEOFgwdjdvTnhz?=
 =?utf-8?B?YktGZW5QbkN1YUZZRGI0anpWUUtOZE1jc1RWSE0yM1dmcE5TTUdxZFJ5TTVF?=
 =?utf-8?B?bFlvNi9FTERDVjdEa2JYWkRteWdHZVlrbnpQZmU4RlE2a3hFMU05UUNtMWxj?=
 =?utf-8?B?ZDlEUzBUaFFZaW5uckt6a21WQ2cxejVya01XQUUzRXhZY1VGdEdZaDJYY2hT?=
 =?utf-8?B?azhnWENqc0xXd3ptamFoSXN0MjA4RElEdnZIbWYxK3l5djcvbGN0KzVaQThR?=
 =?utf-8?B?TWdFOEdYb2k5Um9SRTAwcWlQUWpiTFFZNFIrWGo5c3pETGs4STV4WHg5V0ti?=
 =?utf-8?B?anNRdktOS1pQRmhtVFVEVlhmZDVkMS9FSWNOSHUzMjNTaEtJSGhhbk5qQTRl?=
 =?utf-8?B?UU1ST3MzdVJQdDlYOWVPVlJsbHdsT0oxUzJQVEhNR0JRcHJjMUR0dHpUV3VG?=
 =?utf-8?B?NnZyaHl5RWxNUTFtMkpXWHdQd0VyVUxQNXNMa1FhdWl2M0VWalYxakZJV1cr?=
 =?utf-8?B?ZEVZbFNNKy94R0gyZjFXZGNjYW9zQnI1cEwwTzd0eEFWUkVVY2hRTVdZbFp5?=
 =?utf-8?B?ZFNIV1drNStUdGJiZVJKN0h4S09DQkFjSmtZb3R3ZjZnNGQ3b0Z6MXJCa1Ew?=
 =?utf-8?B?WnJBQnBJZmV3OXdwejdVM2VlVklBOHVrZVJEdXd1RjNNeXJqMDRrc2lKZ2pC?=
 =?utf-8?B?ZTdzajMxWmJZVUtRVEthSWhsdFR4SFNFQjZMdXNXVVhOM2xsYW9SbjZtbFhz?=
 =?utf-8?B?bVdScFBtNUNNUzFUT3JNSDM3MndsYVlmK2NscFcwTlJiWWF4bkloSUdMTFc1?=
 =?utf-8?B?cEMvenRhM1hRRlc3bytZM014MTRmSExPZ29EYnczR0VVSHBycTR3UW1oN1Fp?=
 =?utf-8?B?RXFFcC9nb3U3aXpUaXBuV3BNQjlDeGpMNVNlSlg3cktKRnNPVklVZ25BcEdO?=
 =?utf-8?B?dS9SRDBGbTVSampWNGgrdkx4UG12bnVUR2NCMlRtNjA2L3pOQkl3Vm9NRklt?=
 =?utf-8?B?a3l4TWJxV1IrUHlqU0ZRQUhYd2JkdW15bG5VM0oveU9SaXNqSTBEdXNyTkpS?=
 =?utf-8?B?VVE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: e955f1f0-ce92-484b-4e4e-08de16dcc22d
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6135.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 11:17:34.1439 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: J3vQxu+qh62ENzN0CdQyBhg2nqR65IThU6/9tdqVW5QFSTb7TJJ00cPoeUaT8a6x6u81huZRNBGvri8FYUJGMjTWuQKh+scDXfrfjNz6wmM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB9510
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

Michal Wajdeczko <michal.wajdeczko@intel.com> wrote on wto [2025-paź-28 18:58:19 +0100]:
> On current platforms, in SR-IOV virtualization, the GPU is shared
> between VFs on the time-slice basis. The 'execution quantum' (EQ)
> and 'preemption timeout' (PT) are two main scheduling parameters
> that could be set individually per each VF.
> 
> Add EQ/PT read-write attributes for the PF and all VFs.
> 
> By exposing those two parameters over sysfs, the admin can change
> their default values (infinity) and let the GuC scheduler enforce
> that settings.
> 
>  /sys/bus/pci/drivers/xe/BDF/
>  ├── sriov_admin/
>      ├── pf/
>      │   └── profile
>      │       ├── exec_quantum_ms	[RW] unsigned integer
>      │       └── preempt_timeout_us	[RW] unsigned integer
>      ├── vf1/
>      │   └── profile
>      │       ├── exec_quantum_ms	[RW] unsigned integer
>      │       └── preempt_timeout_us	[RW] unsigned integer
> 
> Writing 0 to these files will set infinity EQ/PT for the VF on all
> tiles/GTs. This is a default value. Writing non-zero integers to
> these files will change EQ/PT to new value (in their respective
> units: msec or usec).
> 
> Reading from these files will return EQ/PT as previously set on
> all tiles/GTs. In case of inconsistent values detected, due to
> errors or low-level configuration done using debugfs, -EUCLEAN
> error will be returned.
> 
> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> Acked-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
> ---
> v2: apply EQ/PT under single lock (Lucas)
> ---
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.c | 124 +++++++++++++++++++++
>  drivers/gpu/drm/xe/xe_sriov_pf_provision.h |   8 ++
>  drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c     |  54 ++++++++-
>  3 files changed, 184 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> index 663fb0c045e9..c5b3a6aa67f4 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.c
> @@ -152,3 +152,127 @@ int xe_sriov_pf_provision_set_mode(struct xe_device *xe, enum xe_sriov_provision
>  	xe->sriov.pf.provision.mode = mode;
>  	return 0;
>  }
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_eq() - Change VF's execution quantum.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @eq: execution quantum in [ms] to set
> + *
> + * Change VF's execution quantum (EQ) provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_exec_quantum_locked(gt, vfid, eq);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_eq() - Query VF's execution quantum.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @eq: placeholder for the returned execution quantum in [ms]
> + *
> + * Query VF's execution quantum (EQ) provisioning from all tiles/GTs.
> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int count = 0;
> +	u32 value;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		value = xe_gt_sriov_pf_config_get_exec_quantum_locked(gt, vfid);
> +		if (!count++)
> +			*eq = value;
> +		else if (value != *eq)
> +			return -EUCLEAN;

NIT: Perhaps it would be worth adding a dbg log with information about which GT is inconsistent.

> +	}
> +
> +	return !count ? -ENODATA : 0;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_apply_vf_pt() - Change VF's preemption timeout.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @pt: preemption timeout in [us] to set
> + *
> + * Change VF's preemption timeout (PT) provisioning on all tiles/GTs.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int result = 0;
> +	int err;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		err = xe_gt_sriov_pf_config_set_preempt_timeout_locked(gt, vfid, pt);
> +		result = result ?: err;
> +	}
> +
> +	return result;
> +}
> +
> +/**
> + * xe_sriov_pf_provision_query_vf_pt() - Query VF's preemption timeout.
> + * @xe: the PF &xe_device
> + * @vfid: the VF identifier
> + * @pt: placeholder for the returned preemption timeout in [us]
> + *
> + * Query VF's preemption timeout (PT) provisioning from all tiles/GTs.
> + * If values across tiles/GTs are inconsistent then -EUCLEAN error will be returned.
> + *
> + * This function can only be called on PF.
> + *
> + * Return: 0 on success or a negative error code on failure.
> + */
> +int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt)
> +{
> +	struct xe_gt *gt;
> +	unsigned int id;
> +	int count = 0;
> +	u32 value;
> +
> +	guard(mutex)(xe_sriov_pf_master_mutex(xe));
> +
> +	for_each_gt(gt, xe, id) {
> +		value = xe_gt_sriov_pf_config_get_preempt_timeout_locked(gt, vfid);
> +		if (!count++)
> +			*pt = value;
> +		else if (value != *pt)
> +			return -EUCLEAN;
> +	}
> +
> +	return !count ? -ENODATA : 0;
> +}
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> index cf3657a32e90..cb81b5880930 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_provision.h
> @@ -6,10 +6,18 @@
>  #ifndef _XE_SRIOV_PF_PROVISION_H_
>  #define _XE_SRIOV_PF_PROVISION_H_
>  
> +#include <linux/types.h>
> +
>  #include "xe_sriov_pf_provision_types.h"
>  
>  struct xe_device;
>  
> +int xe_sriov_pf_provision_apply_vf_eq(struct xe_device *xe, unsigned int vfid, u32 eq);
> +int xe_sriov_pf_provision_query_vf_eq(struct xe_device *xe, unsigned int vfid, u32 *eq);
> +
> +int xe_sriov_pf_provision_apply_vf_pt(struct xe_device *xe, unsigned int vfid, u32 pt);
> +int xe_sriov_pf_provision_query_vf_pt(struct xe_device *xe, unsigned int vfid, u32 *pt);
> +
>  int xe_sriov_pf_provision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  int xe_sriov_pf_unprovision_vfs(struct xe_device *xe, unsigned int num_vfs);
>  
> diff --git a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> index 439a0cd02a86..f12d6752e9f1 100644
> --- a/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> +++ b/drivers/gpu/drm/xe/xe_sriov_pf_sysfs.c
> @@ -13,6 +13,7 @@
>  #include "xe_sriov.h"
>  #include "xe_sriov_pf.h"
>  #include "xe_sriov_pf_helpers.h"
> +#include "xe_sriov_pf_provision.h"
>  #include "xe_sriov_pf_sysfs.h"
>  #include "xe_sriov_printk.h"
>  
> @@ -23,10 +24,14 @@
>   *     ├── ...
>   *     ├── pf/
>   *     │   ├── ...
> - *     │   └── ...
> + *     │   └── profile
> + *     │       ├── exec_quantum_ms
> + *     │       └── preempt_timeout_us
>   *     ├── vf1/
>   *     │   ├── ...
> - *     │   └── ...
> + *     │   └── profile
> + *     │       ├── exec_quantum_ms
> + *     │       └── preempt_timeout_us
>   *     ├── vf2/
>   *     :
>   *     └── vfN/
> @@ -85,7 +90,52 @@ static const struct attribute_group *xe_sriov_dev_attr_groups[] = {
>  
>  /* and VF-level attributes go here */
>  
> +#define DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(NAME, ITEM, TYPE, FORMAT)		\
> +static ssize_t xe_sriov_vf_attr_##NAME##_show(struct xe_device *xe, unsigned int vfid,	\
> +					      char *buf)				\
> +{											\
> +	TYPE value = 0;									\
> +	int err;									\
> +											\
> +	err = xe_sriov_pf_provision_query_vf_##ITEM(xe, vfid, &value);			\
> +	if (err)									\
> +		return err;								\
> +											\
> +	return sysfs_emit(buf, FORMAT, value);						\
> +}											\
> +											\
> +static ssize_t xe_sriov_vf_attr_##NAME##_store(struct xe_device *xe, unsigned int vfid,	\
> +					       const char *buf, size_t count)		\
> +{											\
> +	TYPE value;									\
> +	int err;									\
> +											\
> +	err = kstrto##TYPE(buf, 0, &value);						\
> +	if (err)									\
> +		return err;								\
> +											\
> +	err = xe_sriov_pf_provision_apply_vf_##ITEM(xe, vfid, value);			\
> +	return err ?: count;								\
> +}											\
> +											\
> +static XE_SRIOV_VF_ATTR(NAME)
> +
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(exec_quantum_ms, eq, u32, "%u\n");
> +DEFINE_SIMPLE_PROVISIONING_SRIOV_VF_ATTR(preempt_timeout_us, pt, u32, "%u\n");
> +
> +static struct attribute *profile_vf_attrs[] = {
> +	&xe_sriov_vf_attr_exec_quantum_ms.attr,
> +	&xe_sriov_vf_attr_preempt_timeout_us.attr,
> +	NULL
> +};
> +
> +static const struct attribute_group profile_vf_attr_group = {
> +	.name = "profile",
> +	.attrs = profile_vf_attrs,
> +};
> +
>  static const struct attribute_group *xe_sriov_vf_attr_groups[] = {
> +	&profile_vf_attr_group,
>  	NULL
>  };

LGTM:
Reviewed-by: Piotr Piórkowski <piotr.piorkowski@intel.com>

>  
> -- 
> 2.47.1
> 

-- 
