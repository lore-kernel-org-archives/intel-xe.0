Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 263F8606A31B
	for <intel-xe@archiver.kernel.org>; Wed,  4 Nov 2026 00:36:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=mzjrYar5
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C536110E666;
	Wed,  4 Nov 2026 00:36:24 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0928510E666
 for <intel-xe@lists.freedesktop.org>; Wed,  4 Nov 2026 00:36:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793752579; x=1825288579;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=Y52rl2q1OixAoPR/k/lDpEa1fLMHBJkbhP1DZE2YVbs=;
 b=mzjrYar5oK3U2co9hcOfPpbJl8O+UPGZJAPMQ3BhPeX2fWE0sXqFCZ1R
 yI5gyl6ZqVHdx32WXumabhDqV95A3oErGjQz14YrJCRk2kZ9HZbbEAjPP
 8JDrw5wzl4otTmjmB8iMO1mYdt7c1z0WrvfWd3sNIacb+aue0MC12HzmD
 /pmQmJE7BttRHQ2RHgOOq7tMgnED81LimPC35tvq7u2yXg+jQ779K1IBX
 PWoGaa8S/2uVM/AiCXuTPD2GdH1QpywumSDAlXPQ26EQOKiOPMRMRwKUB
 zHXECiF8WgSlZAO6iHyRRKLjNxNOR0LQjRBuluRiZ9iWk++nnJEYHkybD Q==;
X-CSE-ConnectionGUID: hpixJqL/Q2iT669GmpP7EA==
X-CSE-MsgGUID: oSnFo9r3Q6Wvh3jpCMTBbw==
X-IronPort-AV: E=McAfee;i="6800,10657,11955"; a="2494266"
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="2494266"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:36:19 -0800
X-CSE-ConnectionGUID: srty0m2sSbO/Rr/ML7fwig==
X-CSE-MsgGUID: a8cNd869SAOpiDgKt/MegQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,194,1787036400"; 
   d="scan'208";a="8436026"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 03 Nov 2026 16:36:19 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 16:36:18 -0800
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 3 Nov 2026 16:36:18 -0800
Received: from BN8PR05CU002.outbound.protection.outlook.com (52.101.57.59) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 3 Nov 2026 16:36:17 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qwTOR9tJ9dBFDdHaMwwcCS9Q8rmlzIdbwEWrBu+CU5V7o8CepLQiRO8/oFGMs+6635S+Rugdt2eHv49dfRcN5byz7UQ+EF4L6/QhKgqL6k4cr8AfkU1aVL+igUCGIu+THB4Q9revb5GKkx8Qt733FocA848CG08fyglJuq/PCgVECf/wcBjDgCucG3VwZCRievQzI0Q1nT/ICascwJVguuAAuRbFYE6PmIYyhueUgATtoaEL4EKmQ9LxymdI68bmnvdmavrxgRfb90iYKzE9/PSKB94x361VyglbdB+WGVedcp+FbLaoa33jtJrHZ+Vprn3LK0rvSoGywjWvUThurg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mPJUjp6Ojl4jz43fCbofm5DcKTfS3RATJuZCGbxxn7s=;
 b=WDdhMFnk8XamW+wiUBIYmKyIQ+Pa5xJ/IBwv4CxfGKSMLl76Jwkq5sqRw4fhuBwEs9x0IUgmxTNP+faO3tgdwVmL8pB6B8EMqb5ItofU8N9LD0ZtazRWmB4HqkNTdeYyFEBgusHN/+NVKZiGiVfZ9WaCsyouttTtp59PajLmHoEZtglhSYWUTMb2XAMJzNXEDr7IZGLYy6ZuFkWSVkeBt+/NdEdiTu0P1o0akc2ThXqP/xSp9NuOutKeurqH5YHRMsw880P172YEdTH5rXH9rY3m8epCjByrpgUTvAsXd5MXwjpl1yMRUxjBrtGyca41Gx1SlFo7O2mOsPqAhkdmYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY8PR11MB7010.namprd11.prod.outlook.com (2603:10b6:930:56::19)
 by LV8PR11MB8769.namprd11.prod.outlook.com (2603:10b6:408:204::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Wed, 4 Nov
 2026 00:36:13 +0000
Received: from CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646]) by CY8PR11MB7010.namprd11.prod.outlook.com
 ([fe80::e26:c52f:6245:a646%6]) with mapi id 15.21.0569.011; Wed, 4 Nov 2026
 00:36:13 +0000
Message-ID: <928c8d84-d943-4299-bf69-ff9d0362dc4f@intel.com>
Date: Tue, 3 Nov 2026 16:36:09 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm/xe/guc: Reject a duplicate deregister-done G2H
To: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>,
 <intel-xe@lists.freedesktop.org>, <daniele.ceraolospurio@intel.com>,
 <alan.previn.teres.alexis@intel.com>, <julia.filipchuk@intel.com>
References: <20260908231854.1218934-4-umesh.nerlige.ramappa@intel.com>
 <20260908231854.1218934-5-umesh.nerlige.ramappa@intel.com>
Content-Language: en-US
From: "Narvaez, Jesus" <jesus.narvaez@intel.com>
Organization: Intel
In-Reply-To: <20260908231854.1218934-5-umesh.nerlige.ramappa@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0187.namprd03.prod.outlook.com
 (2603:10b6:303:b8::12) To CY8PR11MB7010.namprd11.prod.outlook.com
 (2603:10b6:930:56::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY8PR11MB7010:EE_|LV8PR11MB8769:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ea091d8-c69d-4c80-504c-08df3a0ba0f2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|1800799024|23010399003|22082099003|18002099003|261102123227099003|56012099006|10067099003|261009223027099003|261022105027099003|261021121427099003|261021123027099003|261022075727099003|4143699003|11063799006|261028144727099003|261026121527099003|261026140227099003;
X-Microsoft-Antispam-Message-Info: 5TbaRTakRGlqe8D1T4DGm3mNvmsflTkOkVfPC8c+4hzot9isiZJHzszSQwgYHGlNZnoPdq0s8CdzKvTm+XAnmlh5fOzs6wfdsKlP3/9eTCwq1f+E7ifFHhzSRiJegfb70zKu56TlhFFzcT5zCR21lo80I57/UJgytcVOeSCxU7olqhh0RxZ9aCV/1kqg7k7IfZE2qeA3ugcgmHgeufw+p9rPFIe3X4EQIUGyjDvWJMluZACs68azX+hwGTftje23zuUejoTVc3jHllRj+G5CEv7Eru94oSvsyO4enx6hTMb7WmTf15QHYGkV9oyeBAkPB1QBGSAtsl+5IXl41TxgN9ku9EMoT+ApBeyxy3OdspkXetC8xcIorEs5TXCKTsA47wZBUpifdIRigtPBXEjuHA+l6sGe5xQJSWMEKfXTm6ekv9HVikV35vHVj/aI/TxxxFeEdhm4WkfwC4602jEFTrF1SFXrNLnO5QQsVbhjHCAjojz4AdqLXgPQ3M0Qxx6TkCH6VYPm+arWNns8TvqAA/r8s0eMjbY7fDBstISYjgVs105eWxJ/tgvzznSNNRFOsmN08SMqagKsIc+p/GSdKAYPKJuU7HIlY/ADqTdpSCD6AVN/8muIs6OwJ0IbFVEXnxjAkVa29DK6ZaAHfFILSVaa5zMGaZZLuEF/pgaHz6A=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY8PR11MB7010.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(23010399003)(22082099003)(18002099003)(261102123227099003)(56012099006)(10067099003)(261009223027099003)(261022105027099003)(261021121427099003)(261021123027099003)(261022075727099003)(4143699003)(11063799006)(261028144727099003)(261026121527099003)(261026140227099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZTFLYmRMTFpya1J0TnQrM1VheWEveGdWNWM5M2l6ODVYT1prMVU1bHR4VHNa?=
 =?utf-8?B?NVlJMk13dFRzSWNLbjVIbXdaRVZHQXEyNmQyZHEwUjk3UDJqZC94Q2p6alo3?=
 =?utf-8?B?Vy8rT3JoQW9lR2s1eDV3VElMQSttSHFIa1NOb24xY3BFRDhmYys5MHg4QnNQ?=
 =?utf-8?B?UXFxTkZRTko4Q2dJanJURWJuWmluZFZEdzVCVlZLcFhMTGF6WXlnWm1xZ210?=
 =?utf-8?B?S2huZnNhcXMzNGRtZkNFaDFDeWc0MHk5MHlLSjV1eU9iNk5Tc3hhdnVtanlF?=
 =?utf-8?B?dGxyTUlHdW13NzZ1UnhSUS9rL3ZFSTlkRU9OZ0JDWWFZdklWN0pEMFVmbFQx?=
 =?utf-8?B?MGFHelNIeWVYSFgrQVlncWtWdlpLRlc0WGVXUEtMeXEzR2ZhRWFLaG9XZUs2?=
 =?utf-8?B?TDRERlM2TS9wbUYxdkcycG9veVZWbEpRVkczaURINGppeWIrWmhjN3pGcDkz?=
 =?utf-8?B?S2FUcnp2SDdHZWxicWpITXIxRXg3aDRnbnBadFpmWUZ5QXRSUDZOeW9uSXQw?=
 =?utf-8?B?dGZTVW9nSWVHSmErUVBqQ3dXNUdPeWNSS25jcWpHdUlrbjMzOTFCVmp6dVhj?=
 =?utf-8?B?bmJpMnN6ejlqaVg4VVZZaDlVbE5OYzgxS25UcmR5NEZMOGhhVlJrZGM2ZUVl?=
 =?utf-8?B?QUJENlhLdk51azhiVDlTdlRpaEc5cWNLczRLeFNOSDdqSHRZR09uczRDa2M5?=
 =?utf-8?B?SVVoOE5jZ0pQbnk4am9iak0rU04rYk5mdUFaSEpuM01PR2NXTXBQQmVVVExm?=
 =?utf-8?B?bXFKN2IwWGI1LzROR1J5NGFtbms2TUg1QWMyb2plMVozQWphUTc2TW9NMmhD?=
 =?utf-8?B?aFphTlVHSFF4T0RVWGg4NlFMUE5QV3ZtK3NlWW1tdVpOL3M2TEcxYk5tQmdr?=
 =?utf-8?B?cS9TczlUcGN0MHVXSURWZFZ1NnFCR05LYzdZb3YxZUc1blFVQTNHbnlRM3Rq?=
 =?utf-8?B?dWwweTVKRWJEcjFhbnV0dmxDcFZvWTdRbldsbnBSQ2ZMcDVhTCtvY3dHRGlF?=
 =?utf-8?B?SkZnd3pJbDAxbXBLcFcyNkloVmlIUzNDdGZwSzBSMkVOMVBha0Z4UWIrRHhU?=
 =?utf-8?B?ZE5YYTBmejZHV011dDRXdWxHVE5vZ24yMGxpcnU3bkc2QW9hMDVPK0kzQ201?=
 =?utf-8?B?UzVhTGd4dGhWRXN5Vnl1N2RmL1N1azFBZnYrWGkrTmtBbi82UUE2U2ZNZWRm?=
 =?utf-8?B?SHVOYStYa0I5b3A1WVU4U2RDaWlRM3BIR1NTZHRGMnFjcFg1d2VxYWI1Q2pH?=
 =?utf-8?B?akdNclFaZzhudVQraWNiWjdKZUcyTDFVRndSd3ZtTjZQcFYzLzJxOWU1SE53?=
 =?utf-8?B?eXEzUGZLN0dOdUZsWk1QaXJLT0xtRW1PTndFY2N1a0NEMktZOWI1b21pMDNY?=
 =?utf-8?B?NzNsOWYvdHBVY3EyVkdGK1kzZm5pZ0hDa29OQklMWndZakcwYVRkZlBwL1o4?=
 =?utf-8?B?V2J5ODFWZXdoTjJCa2Z4cEtRdHF4aUs2bkJzcGN1dnBQNE9xZGsyVkx6QzR6?=
 =?utf-8?B?VHBSWnAwNmppaUt4c3hndFBnT05xSVFNeDZQT0NQdGJ2cmJPMEVnR1doTTFL?=
 =?utf-8?B?aEVBY0pwa3h0NWZ6RVkzNFNRT0d2R2wrQTdxTjc5ajVuMEdidUMvODBTdlpM?=
 =?utf-8?B?MG5ycUJQbjFnaWRWakYyR2JUaUY3NkdoQkp6UmxURmNiS1k1UHJWSmZlTkpR?=
 =?utf-8?B?eGhRNHoxUk9SQjhZOFZubFMzRTFHYm9Na3lOOGRhQ0NkYmlTTUwzbE5DZjJ0?=
 =?utf-8?B?UzZ0ZWt1Y255Qnd5bEVrOVRLUU1VZWJ4b0dRM2xmWVQ0aXFCRGZ6WllHbXRu?=
 =?utf-8?B?K2d5V2pVZ2lHNndXbXp5c210T1A0MFNTY0dUTEdTQ2VhTWxzS2lSRDVoTXpl?=
 =?utf-8?B?bTFKcGNJL1hTOWd0NkovSWcyOHN0MDVLUVJvcUppdGJVVExMcmtwRFRkTVNU?=
 =?utf-8?B?WlhLS01OaUxnN0V2ZjRvWHVIVU1yTGFVKzl4Q3ZtWW5CeFJ6L3Z4WkxUUU54?=
 =?utf-8?B?NndZVVJKeUo5Smp1ZTJ3Y1ZJRzJPeVkwbzBmWkNuaTRlcDJWU0NvcTNURUNI?=
 =?utf-8?B?WFhYOUVtT0lNOG9QamVUZWJIOHp0SHAwaXN4WGxoa1EyZVRkc2xiWTN0Vkxs?=
 =?utf-8?B?aU9GbDA1YnRwRTNGTEphbnpsMXgzSWJwTFdOdndaNWVxdGFpemFtNHpVckJk?=
 =?utf-8?B?QlZ4aGpuZW9xU2tEVnNXODcxdHRiK3BUV1lSdllmUFlvSnhnYkFmMVV2S2xM?=
 =?utf-8?B?T2RzQWJZWVBEc3N5ZFdrZnE1RG9WUWpQYlZQdTB2ZmsxTy9sMmgxdHRwZG9D?=
 =?utf-8?B?UElCWlpVZFJtUE5yMFJJT2VVNWZGM1gzb3hPVWZBOUtSYW1aN0U1dz09?=
X-Exchange-RoutingPolicyChecked: SOSvaHyEQjn3Z9N2h5+YMGlwHPxxuqpwko7QzfOCjGg7i7b4lMDq+OfZ2LYEUzA/dseKmrtCTUyMKszSlABduQ4XrD3UUqfdp2lS9wg+rzOZKVZt/fsP5AhGatF9/vwL9RSNf5jQmJUQB5G+7ow6nXAeJgj07yK3STFHFHQIdfSyr/biiVpaHwKQZEXnAnUX3Neej+krRux9usyGLXrlAipRbZPNXtIzITc8z27YIHPCcuWEaeak8jbNbHnAO4QIRB1yT02Gv06A1GaJPcgD5agNRDEA/V8CMl2O9GClyJKHqn5hcBbYghQbD7/MvyoFJHJrAyl6EDxUe0qpTAVMuA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ea091d8-c69d-4c80-504c-08df3a0ba0f2
X-MS-Exchange-CrossTenant-AuthSource: CY8PR11MB7010.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Nov 2026 00:36:13.0579 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hXAOPv0CSupeS8tV+EvPcfw2LlSznoSUVQ6R1b4Cd7EH/GvM17aJwr4lMauYhItB7Gqy8M+6lYn2P5cc6qdwuw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8769
X-OriginatorOrg: intel.com
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=-17.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On 9/8/2026 4:18 PM, Umesh Nerlige Ramappa wrote:
> The registered bit is cleared by the first deregister-done, but the
> guc_id is only freed once the deferred destroy work has run, so there is
> a small window of time where a duplicate deregister can go through
> before the guc id is freed. Add an additional check to block a duplicate
> deregister.

I think you need to add "Discovered using AI-assisted static analysis 
confirmed by Intel Product Security." into the commit message for this 
patch.

>
> Fixes: dd08ebf6c352 ("drm/xe: Introduce a new DRM driver for Intel GPUs")
> Reported-by: Martin Hodo <martin.hodo@intel.com>
> Signed-off-by: Umesh Nerlige Ramappa <umesh.nerlige.ramappa@intel.com>
> Assisted-by: Claude:claude-opus-5

nit: The "Assisted-by" tag for AI is no longer required. I think this 
can be removed going forward. And with the commit message updated:

Reviewed-by: Jesus Narvaez <jesus.narvaez@intel.com>

Jesus Narvaez

> ---
>   drivers/gpu/drm/xe/xe_guc_submit.c | 11 +++++++++--
>   1 file changed, 9 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/xe/xe_guc_submit.c b/drivers/gpu/drm/xe/xe_guc_submit.c
> index f3ba8abfc228..7339c3cecdc0 100644
> --- a/drivers/gpu/drm/xe/xe_guc_submit.c
> +++ b/drivers/gpu/drm/xe/xe_guc_submit.c
> @@ -3350,8 +3350,15 @@ int xe_guc_deregister_done_handler(struct xe_guc *guc, u32 *msg, u32 len)
>   	if (unlikely(!q))
>   		return -EPROTO;
>   
> -	if (!exec_queue_destroyed(q) || exec_queue_pending_disable(q) ||
> -	    exec_queue_pending_enable(q) || exec_queue_enabled(q)) {
> +	/*
> +	 * The registered bit is cleared by the first deregister-done, but the
> +	 * guc_id is only freed once the deferred destroy work has run, so the
> +	 * lookup above still resolves in between. Checking it here makes a
> +	 * duplicate notification an error rather than a second destroy.
> +	 */
> +	if (!exec_queue_registered(q) || !exec_queue_destroyed(q) ||
> +	    exec_queue_pending_disable(q) || exec_queue_pending_enable(q) ||
> +	    exec_queue_enabled(q)) {
>   		xe_gt_err(guc_to_gt(guc),
>   			  "DEREGISTER_DONE: Unexpected engine state 0x%04x, guc_id=%d",
>   			  atomic_read(&q->guc->state), q->guc->id);
