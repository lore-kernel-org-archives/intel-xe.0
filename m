Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16643606A31B
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 17:41:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=h5xl7goR
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D462E10E8EA;
	Thu,  5 Nov 2026 17:41:35 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B90C310E957
 for <intel-xe@lists.freedesktop.org>; Thu,  5 Nov 2026 17:41:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793900489; x=1825436489;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=o7XJb+OGEK506eiqu59ccPJrKmfLHFKASsAxjNZWwe0=;
 b=h5xl7goRCbe/oRFy7cRlPTFdN2jMFVM7/5rSC5FiMgCDopRR+MJWFuKe
 9pfcteZCT0HP4wVcDWIcFVWoeoRv3y8fs+lKRu7Tl8MCFWZMGEN+GBQ9h
 0WoWqTk1fhaqPCUaBtXe/CWbbJis5F0q3bJoiEwqzQZgQB24pgufdN0lR
 31smSFiPErzI8gzbTwVq69gt46Xf+G4FsCDrFa4KbIoPIOQLUQsXh2fJe
 0blU/nzrv15uQlmUNNTbx6K0uFEyamXuWsDclL7WZ6uKQ4GNdTmgLPTd9
 pnjjxm76H1Etv4gVLBz7q2dLj3/Erv/mgFQ4R4dqDEwHJwJzUpllaTA70 g==;
X-CSE-ConnectionGUID: veWAteVvR0C3tHZlXmGSAw==
X-CSE-MsgGUID: SZtr9swtQI2nqfwSGHs/nQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11957"; a="2571487"
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="2571487"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:41:29 -0800
X-CSE-ConnectionGUID: DCuT4LQUREipvdoghzpTsQ==
X-CSE-MsgGUID: 50irrf2xRj+wJD9LJEUf+g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,197,1787036400"; 
   d="scan'208";a="7636170"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 Nov 2026 09:41:29 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 09:41:29 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 5 Nov 2026 09:41:29 -0800
Received: from SJ2PR03CU001.outbound.protection.outlook.com (52.101.43.37) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 5 Nov 2026 09:41:28 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OAzuB5TdkEzWbq1+Cqlf8joPlHSOpYLKxrdXAaw7vUmSF062DeOWUmOMHAgGHzW6CzEdFmx94lo6LvbvvxxvNyTlKAlZnjNjXVLlwhKx3wCM1LbdkEFZqa0s18pK6aIWslzqdo4rM388KPlSdRC7qdhKCOUhKsZkRYpMgcWyJGuzrNJVR7c7k/qdDGpU9cUnQIaR2mCI6h0fY9T4TUKttq/xn3MoHINKI6/mDSvMxsork8mVBQ5wTDPayS/tDnsBUz9ocs/ILMRtvLCUJdBjaA8JF9nTcVdxau3yv5FMFI6vRr3wPCOqHJtDl0PsxCniVE5WgLOkUu38J7opF7TU9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JSYpiMruje5aobGsTdIZsi19kBwttpViyb+DhqY6Avo=;
 b=hSieVPI+o/3wwleL/XprSuf91CVbCVSdod/28q5wUetAppxi5m8dwSkLSJ3Qlal1o6Pm8YWxJS8bTwccoK6AuSDYbBUlTbac+BJUbIGufjUhtIXjyUzJ+VKOuFpeL+djvKcay1y85UL5mStENJWJjvQxmYjJUS3BJ0ytAKA/4Au+ao0GFMzqKI5LzCyguxG88bC3hq8x4jwCs1jDv4hzT2UvRD7OM+50H3rb8ELqiublkyu/xaBLNvDKCPiz4A8tXUBQ7YlptBA8Bg6vYPX/1h33UWUiR+a8RiOJkRL+y0q/TOOgKWGLF6ekrsv69fnrdrmWuQZh/HMeerdn0F/xyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23) by SN7PR11MB6947.namprd11.prod.outlook.com
 (2603:10b6:806:2aa::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.592.8; Thu, 5 Nov 2026
 17:41:26 +0000
Received: from FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65]) by FT1PR11MB960200.namprd11.prod.outlook.com
 ([fe80::cfb1:f811:62bb:fa65%5]) with mapi id 15.21.0592.009; Thu, 5 Nov 2026
 17:41:26 +0000
Message-ID: <423fcbe7-5ccb-4b12-a709-6055a69bae93@intel.com>
Date: Thu, 5 Nov 2026 23:11:18 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 5/9] drm/xe/hwmon: expose pwm[1-3]_enable
To: "Purkait, Soham" <soham.purkait@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <rodrigo.vivi@intel.com>, <anshuman.gupta@intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>, <riana.tauro@intel.com>,
 <sk.anirban@intel.com>, <mallesh.koujalagi@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>
References: <20261015190751.1268916-1-karthik.poosa@intel.com>
 <20261015190751.1268916-6-karthik.poosa@intel.com>
 <c425f5cd-7df2-4ce7-b2b3-f12c32cc7308@intel.com>
Content-Language: en-US
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <c425f5cd-7df2-4ce7-b2b3-f12c32cc7308@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0211.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1b0::12) To FT1PR11MB960200.namprd11.prod.outlook.com
 (2603:10b6:170:25::23)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: FT1PR11MB960200:EE_|SN7PR11MB6947:EE_
X-MS-Office365-Filtering-Correlation-Id: 63c2c3de-5974-4982-5c47-08df3b64040a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|56012099006|261009223027099003|261021121427099003|261021123027099003|4143699003|5023799004|11063799006|261026121527099003|261102123227099003|261022105027099003|261026140227099003|261022113327099003|261028144727099003|261022075727099003|10067099003|22082099003|6133799003|18092099006|18002099003;
X-Microsoft-Antispam-Message-Info: blm2K0OqEQ2Qk0z3jctTOPTnbEfFSALRjKzZhGNZCEP02png2SjhMHHXBnZ/cPiYSgkvY572Cnrio5XvfBADVUD4hiE6Vqfb9X4EfKRcWhpIodq7Bb9eLIqctdikibWOFrO3plLCphXT2q7VCkcv+kZjs17O7GaFSu5t+WgO/2wdHS4vku/gWcPXGzoSyYoX8ijPh6BJLi13IJ9RM7W3eGhQL2+FKoTSJ6DoRsmJ8ImJY3HZkhW3hi+SWjCHDaDUgq0QKW9+3T4XqQE4zFCcDBj25JTS7J8NIJ1erjdmpiWSegXWE99Nzha3MHRbmhoOL9MiZaB268HJKM6/shiEViHF/nrucp6Io4Ua4tyvwSNCvpnYiMwm8gEef0XxI0q6cIfRHFeayWb9x/SUbvlKK2VnAcxL2MhZ+ewgdkYdP+czQDChVlDprsWLTBnO8NmVBMu12fIYNE8U8zujAwm+mQPbgJabxBYnbuvqN/rVjH4IrTmYy3toQoT5rQiq/8Jeqtk4nBaPW3Dm8A02pOtSmWWLub1XqHZNgELx6UIcC19aA0uMI77cmr/fblm52nzyLaAOBR8kHCg3P/kbrN43QK1ZSSPmgnWzFkPpIeIZY1VAV03aN0GMBmZhjNrtxAE2
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:FT1PR11MB960200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(56012099006)(261009223027099003)(261021121427099003)(261021123027099003)(4143699003)(5023799004)(11063799006)(261026121527099003)(261102123227099003)(261022105027099003)(261026140227099003)(261022113327099003)(261028144727099003)(261022075727099003)(10067099003)(22082099003)(6133799003)(18092099006)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d085M0x5bnZWVmJOck12N211bzlUS1lsZE5WVjdaaFBSMmhac0RLQlpKN1A5?=
 =?utf-8?B?YWc1anlaK09zTEJCblZjMW9XVFovQys0MDFtbExZQWdxa1dOOExKUTNlNmFF?=
 =?utf-8?B?VUJzSktEUmhSM0ZvZnd1WlI4RzBOSDR0NjNKVVFqb3BOWFVBUTVNWi9tS0Vj?=
 =?utf-8?B?Wk1XMnBOakdSL0tLUGFBd3F6ZFh4TkZCdUkyRnhlV3YxcUNmOWR5bmtzMVlL?=
 =?utf-8?B?Rk10d2NIUk5jeFpFN01BZWxJb2JjMVNidERBbzhvQkFhZktRQlQ5NGxFcnBX?=
 =?utf-8?B?Si9OeFdpU20vdkxPZi9PSFFRUDJSZXpjZ0VVeFVUV1A4eElQTVhKY01nTmFm?=
 =?utf-8?B?cmlmMEJKdGtkbVgrTUdDWERCSTZiWlhIK2V4RHVadlI2WEdsUE9BakdkMmM0?=
 =?utf-8?B?c2hhRG9ZblpKNjlqN016SnI1RkVNSzArTG9LVGJGVEtxVnNpTTlGWXFPMUhn?=
 =?utf-8?B?SEFVeUFlRmNNcWY4SlNaM3kzMXVwcVRlbkFTeTdXZ2VFS0NQWC9wVUt3aWd3?=
 =?utf-8?B?Y0hja1ovRExEUUVhajZyOGlqZklxR1NOZXhkaGtkamlDWjFPN2Q0aVBJdkVN?=
 =?utf-8?B?SkVndUxRU3RYOEJaKzRiM3FEMGNud1QvOFNyQ1h2Q2cwb0xPY1RuRW1BZjlm?=
 =?utf-8?B?MjFnVGZIMGRvUFY4d25zQmVnSjVYRWFjd2FUaGxaQ3VMZkJMSXk1NWt2YzQ0?=
 =?utf-8?B?aU9GUG8wOWtERHhmdzV4cVpwSzJocTlpcUd2djRlKzZ4a0l1TW1UOHRxMzFk?=
 =?utf-8?B?Ujl4SEQrY01QdEozSGhLWnZhcmFvZ2l2Tnp6Q1FiRlA2S0NhTmFLTUFvU3FL?=
 =?utf-8?B?azhhZnVkZlpQVGFhWFdhdllJWDMrdDY3N0xtUmQvbWEzL3d0UGZBYmllZHRZ?=
 =?utf-8?B?YkVRb1dIN2VvR2FlODFld1dWKy9kT215Y2VscEJNK212OTNIZ0wwMFplSUhi?=
 =?utf-8?B?QlRyZzUwL1Fpdi9TZmpvY2hoVW5NTlR3M3BFZXFzMlhQRmkxSENVdStoRHQy?=
 =?utf-8?B?UGQ4TTE3RmxKNXhLVjVQVVdHa09HR3JBT3NhTmVFRUxLZGYxd045bjdIaDF5?=
 =?utf-8?B?TVpmb0laZXYyb1kzUHphdVYraDB1NHozdWNLc2FkSlhnU29OOHlmMnMzenp1?=
 =?utf-8?B?RGZrRlRlZjVuQlRVNEhoU2dtQzkwdjMwajRWckh0elRuYjZKcjFYYXNYMStn?=
 =?utf-8?B?dFFTdktyNDFoTVpPY2lHZTI5QUJjb3R5eVcrTFo5cEpZcFlzOXJxbGxZcngx?=
 =?utf-8?B?RXF1NDlVWUl2STBnQnNRZUo2K2JWRE5jR25rQXB5WnBCdnU0NE9TWHl2NEl4?=
 =?utf-8?B?Z0JIZ2JheXYxb0Y1SEIxZjVpYWdKSWJNWG9aaVVSaXRTVkg1U1NYMlA5WVVX?=
 =?utf-8?B?V3crMlFqZktxZkhiZ0tCZGNMSFB0Y05BTzVEdU5hUnpPOUNXaXNEV3puK1o3?=
 =?utf-8?B?VUZ3MWpLRTl2dWVwTVUzeUdXWS9YUjJjYjNLR0RwdXdiZ3N3Q2xoNEE4dlNm?=
 =?utf-8?B?YVFUcHpIWW5IS2ZnMXJjLzFYakdHWm5jc042ZnlNWnRhZU11Q1dsQnRMalM0?=
 =?utf-8?B?alRFd3dpQnN2V3ZqNGhYTU1PZU90bnY5Y2xJL2NzUmxNSm9BSWFYNlNsMGwv?=
 =?utf-8?B?d0xsbUxDdE1lRzUyTDczM29CQlRTS2pTWGNtejRmdDV1UFpFZ2IvckxlZWQx?=
 =?utf-8?B?dkliMmgyYksreEZLU0sxRzF1QVlLZnh3OTZrMVN4elYzaUl0SEhDWk4yYXhD?=
 =?utf-8?B?QTNaQi9iUmxXdGd1MTJWaHpJY2h0K3JKeFloZ2o4Ri92UkpxWXh5eXVxSjVZ?=
 =?utf-8?B?OURNVU5qd2phTVFnOFhReGh0U0dFWGx6L0l4TWhhVFNBSHZ2THI1ZjVtNFVt?=
 =?utf-8?B?bXJyZkxiV3NobEVJM0lZUlRiN21tZFZiUXNkTGZEU1hnVGd6UTZNS3VUd0ps?=
 =?utf-8?B?OExEU2dNWVpsaWlCQ3JxaGFuT0tSUjhWdldGRm5MUDloZWtHalFLdUdpQ1k3?=
 =?utf-8?B?d09QV3kxTUh5aHJHdU9hTzdyZWNRVFV1NDI5TXQ0aXNYK0dhenYrU1hFa0Y4?=
 =?utf-8?B?bndnSDlLZGZ3bnQrdXZZUFhlWlNJZzlYcG45STFybzlFUXJWN3ZiZlo1WGpK?=
 =?utf-8?B?THpydmVyaGU2WWRvN21NUVNSMVkrbnA5b3BZRGZSYXlIOVZJVFlQMDhEM1BP?=
 =?utf-8?B?UjdnK0NCblI2eXJzZElEM1dqMWtXY0hQNEFHSk9RTkRKbEw0V2xEZnB5emtT?=
 =?utf-8?B?SndVSVk0dVJ0M2RieFlXWVp5bU4xWk1GaG1xeFRyZ1FnTDV2L3RpeDRSdFZq?=
 =?utf-8?B?K1hkcDJRQVpZczBJSUJSdXpPL1hTRFR0cXFRSmdMZEQ3VWVobkdPdz09?=
X-Exchange-RoutingPolicyChecked: u4dDgWS++CAXc6F/f77SfJ+ahIGJNL/g4R6w4bzowwFBBfpv8CfXncqvXIivAphnI1jqz7T41q/33wMKBjOG+ToyXyWjssbEvb6CeVnGcGwzJhO6vZkj3M7I0Zp4n08DmUVeEDolTSdzfmaGEVza1Q8utbLuo6QBxG37ja/wKArKsTIyHt4ndQqsnDx5rZnyZqsIWFvr7qI+0bIqyWPWeJpJixKMNJPgTo+XbK6qCY6YSml+w6L9JaB/b6231YIUPRo7zC4tf/iJLyOYo8OiPMOP+cUeQqp8j4xCtSu77rWqJkCblUKoxdUf/af8JW1XYF+xfVQIaXJ7+SHUW3yOFg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 63c2c3de-5974-4982-5c47-08df3b64040a
X-MS-Exchange-CrossTenant-AuthSource: FT1PR11MB960200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Nov 2026 17:41:26.3358 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: U0kb6u5Ge4s3GXxPopQffKyt2csZRFEh6rmGQoutHi9snxrjAqIihcijW7a38xemMDyCxj3Ivb38YcVeE+6E/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB6947
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


On 30-10-2026 00:03, Purkait, Soham wrote:
> Hi Karthik,
>
> On 16-10-2026 00:37, Karthik Poosa wrote:
>> Expose pwm[1-3]_enable to control the fan operating mode through
>> the hwmon interface.
>>   Mode 0 forces the fan to run at full speed.
>> Mode 1 enables user fan-table control.
>> Mode 2 restores firmware-controlled fan management.
>>   Document pwm[1-3]_enable in the Xe hwmon ABI.
>>
>> v2:
>>   - Use xe helpers for dmesg logs.
>>   - Update kernel version in Xe hwmon documentation.
>>   - Correct level of some dmesg logs.
>>
>> v3:
>>   - Each pwm_enable mode now sets its own state; drop the redundant
>>     post-switch pwm_enable_mode/is_full_speed update. (Badal)
>>   - Fix misindented dead assignment in the stock-table branch.
>>   - Make error handling consistent across pwm_enable modes. (Badal)
>>   - Document the pwm[1-3] manual-mode write precondition in the ABI. 
>> (Badal)
>>   - Use xe_pcode_write() instead of the timeout variant api as it is not
>>     needed.
>>
>> Signed-off-by: Karthik Poosa <karthik.poosa@intel.com>
>> Assisted-by: LLM
>> ---
>>   .../ABI/testing/sysfs-driver-intel-xe-hwmon   |  15 ++
>>   drivers/gpu/drm/xe/xe_hwmon.c                 | 156 +++++++++++++++++-
>>   2 files changed, 168 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon 
>> b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> index ce17e9ca3ed8..92c91c57b3f2 100644
>> --- a/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> +++ b/Documentation/ABI/testing/sysfs-driver-intel-xe-hwmon
>> @@ -329,4 +329,19 @@ Contact: intel-xe@lists.freedesktop.org
>>   Description:    RW. Target fan PWM duty value in the range 0..255. 
>> 0 is zero
>>                   fan speed and 255 is 100% fan speed.
>>   +                Writing requires the corresponding pwm[1-3]_enable 
>> to be set to
>> +                1 (manual user-table mode) first; otherwise the 
>> write is
>> +                rejected with -EINVAL.
>> +
>>                   Only supported for particular Intel Xe graphics 
>> platforms.
>> +
>> +What: /sys/bus/pci/drivers/xe/.../hwmon/hwmon<i>/pwm[1-3]_enable
>> +Date:          September 2026
>> +KernelVersion: 7.3
> Please use the correct version as per the prediction.
> https://jnikula.github.io/linux-kernel-tea-leaves/
This shall be 7.5 as this is needed for that release.
>> +Contact: intel-xe@lists.freedesktop.org
>> +Description:   RW. Fan control mode selector.
>> +
>> +               Use value 0 to run fans at full speed. Use value 1 to 
>> enable
>> +               user table control and value 2 to use firmware 
>> default behavior.
>> +
>> +               Only supported for particular Intel Xe graphics 
>> platforms.
> Use tab indentation.
ok
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c 
>> b/drivers/gpu/drm/xe/xe_hwmon.c
>> index a86ed741feb3..c3d5c682768d 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -139,6 +139,15 @@ struct xe_hwmon_energy_info {
>>       long accum_energy;
>>   };
>>   +enum xe_fan_pwm_enable_mode {
>> +    /** @XE_FAN_PWM_FULL_SPEED: force all user table points to full 
>> speed */
>> +    XE_FAN_PWM_FULL_SPEED = 0,
>> +    /** @XE_FAN_PWM_MANUAL_USER_TABLE: use the driver-managed user 
>> table */
>> +    XE_FAN_PWM_MANUAL_USER_TABLE = 1,
>> +    /** @XE_FAN_PWM_AUTO_STOCK_TABLE: use the firmware stock table */
> Keep the wordings consistent with the ABI doc.
ok
>> +    XE_FAN_PWM_AUTO_STOCK_TABLE = 2,
>> +};
>> +
>>   enum fan_table_type {
>>       /** @STOCK_FAN_TABLE: firmware-provided fan table */
>>       STOCK_FAN_TABLE,
>> @@ -189,6 +198,10 @@ struct xe_hwmon_fan_info {
>>       u32 max_rps;
>>       /** @min_pwm: minimum fan PWM */
>>       u32 min_pwm;
>> +    /** @pwm_enable_mode: current xe_fan_pwm_enable_mode */
>> +    u8 pwm_enable_mode;
>> +    /** @is_full_speed: flag indicating if fan is in full speed */
>> +    bool is_full_speed;
>>   };
>>     /**
>> @@ -917,7 +930,9 @@ static const struct hwmon_channel_info * const 
>> hwmon_info[] = {
>>       HWMON_CHANNEL_INFO(energy, HWMON_E_INPUT | HWMON_E_LABEL, 
>> HWMON_E_INPUT | HWMON_E_LABEL),
>>       HWMON_CHANNEL_INFO(fan, HWMON_F_INPUT | HWMON_F_MAX, 
>> HWMON_F_INPUT | HWMON_F_MAX,
>>                  HWMON_F_INPUT | HWMON_F_MAX),
>> -    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT, HWMON_PWM_INPUT, 
>> HWMON_PWM_INPUT),
>> +    HWMON_CHANNEL_INFO(pwm, HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> +               HWMON_PWM_INPUT | HWMON_PWM_ENABLE,
>> +               HWMON_PWM_INPUT | HWMON_PWM_ENABLE),
>>       NULL
>>   };
>>   @@ -1185,10 +1200,80 @@ static int 
>> xe_hwmon_get_fan_point_count(struct xe_hwmon *hwmon, u8 fan, u32 *poi
>>       return 0;
>>   }
>>   +static int xe_hwmon_activate_user_fan_table(struct xe_hwmon 
>> *hwmon, u8 fan,
>> +                        bool is_full_speed, enum fan_table_type 
>> table_source)
> xe_hwmon_activate_user_fan_table(), xe_hwmon_set_user_fan_pwm(), and 
> xe_hwmon_commit_user_fan_table() share the same write/batch/verify 
> logic. Can these be consolidated into a single helper ?
i shall check this.
>> +{
>> +    struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>> +    struct xe_pcode_write writes[MAX_FAN_CONTROL_POINTS + 1];
>> +    u32 point_count;
>> +    int ret;
>> +    int point;
>> +    struct fan_table *source_table = &fi->fan_table[table_source];
> Inverted xmas tree.
ok
>
>> +
>> +    xe_dbg(hwmon->xe, "activating fan %d user table from %s 
>> table\n", fan,
>> +           (table_source == USER_FAN_TABLE) ? "user" : "stock");
>> +
>> +    point_count = source_table->point_count;
>> +    if (!point_count || point_count > MAX_FAN_CONTROL_POINTS) {
>> +        xe_err(hwmon->xe,
>> +               "fan %d %s table point count %d is invalid, cannot 
>> activate user table\n",
>> +               fan, (table_source == USER_FAN_TABLE) ? "user" : 
>> "stock", point_count);
>> +        return -EINVAL;
>> +    }
>> +
>> +    for (point = 0; point < point_count; point++) {
>> +        u8 temp = source_table->fcp[point].temp;
>> +        u8 speed = is_full_speed ? 100 : max_t(u8, 
>> source_table->fcp[point].speed,
>> +                        min_t(u32, fi->min_pwm, U8_MAX));
> Nit: same per-point speed is recomputed below. Could these values be 
> reused?

it is already reused, both use same source i.e source_table->fcp[point]

scope of speed and temp inside for loop here. added them for readability.

>> +
>> +        writes[point].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_FAN_TABLE, fan);
>> +        writes[point].data = FIELD_PREP(FAN_CONTROL_POINT_TEMP_MASK, 
>> temp) |
>> +                    FIELD_PREP(FAN_CONTROL_POINT_SPEED_MASK, speed);
>> +    }
>> +
>> +    writes[point_count].mbox = PCODE_MBOX(FAN_SPEED_CONTROL, 
>> FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>> +                          fan);
>> +    writes[point_count].data = point_count;
>> +    ret = xe_pcode_write_batch(xe_device_get_root_tile(hwmon->xe), 
>> writes, point_count + 1);
>> +    if (ret) {
>> +        xe_dbg(hwmon->xe, "failed to write fan %d user table, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +
>> +    /* Verify if all the user points are set */
>> +    ret = xe_hwmon_get_fan_point_count(hwmon, fan, &point_count, 
>> USER_FAN_TABLE);
>> +    if (ret) {
>> +        xe_err(hwmon->xe,
>> +               "failed to read fan %d user table point count, 
>> ret=%d\n", fan, ret);
>> +        return ret;
>> +    }
>> +    if (point_count != source_table->point_count) {
>> +        xe_err(hwmon->xe, "fan %d user table point count mismatch, 
>> expected %u, got %u\n",
>> +               fan, source_table->point_count, point_count);
>> +        return -EIO;
>> +    }
>> +
>> +    if (table_source == STOCK_FAN_TABLE) {
>> +        for (point = 0; point < point_count; point++) {
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].temp =
>> +                source_table->fcp[point].temp;
>> +            fi->fan_table[USER_FAN_TABLE].fcp[point].speed =
>> +                is_full_speed ? 100 : max_t(u8, 
>> source_table->fcp[point].speed,
>> +                                min_t(u32, fi->min_pwm, U8_MAX));
> Nit: ditto
>> +        }
>> +    }
>> +
>> +    fi->fan_table[USER_FAN_TABLE].point_count = point_count;
>> +    fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +    fi->is_full_speed = is_full_speed;
>> +
>> +    return 0;
>> +}
>> +
>>   /* Temperature to set when setting the fan PWM with pwmN. */
>>   #define FIXED_PWM_TEMP    (1)
>>   -static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 
>> fan, u8 pwm)
>> +static int xe_hwmon_set_user_fan_pwm(struct xe_hwmon *hwmon, u8 fan, 
>> u8 pwm, bool full_speed)
> Either use full_speed or is_full_speed but keep it consistent throughout.
is_full_speed will be used
>>   {
>>       struct xe_hwmon_fan_info *fi = &hwmon->fi[fan];
>>       struct xe_pcode_write writes[MIN_FAN_CONTROL_POINTS + 1];
>> @@ -1196,6 +1281,11 @@ static int xe_hwmon_set_user_fan_pwm(struct 
>> xe_hwmon *hwmon, u8 fan, u8 pwm)
>>       u8 clamped_pwm;
>>       int ret, i;
>>   +    if (!full_speed && fi->pwm_enable_mode != 
>> XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +        xe_dbg(hwmon->xe, "fan %d manual mode is not active, cannot 
>> set pwm\n", fan);
>> +        return -EINVAL;
>> +    }
>> +
>>       pwm = DIV_ROUND_CLOSEST(pwm * 100, U8_MAX);
>>       clamped_pwm = max_t(u8, pwm, min_t(u32, fi->min_pwm, U8_MAX));
>>   @@ -1239,6 +1329,8 @@ static int xe_hwmon_set_user_fan_pwm(struct 
>> xe_hwmon *hwmon, u8 fan, u8 pwm)
>>       }
>>       fi->fan_table[USER_FAN_TABLE].point_count = 
>> MIN_FAN_CONTROL_POINTS;
>>   +    fi->pwm_enable_mode = XE_FAN_PWM_MANUAL_USER_TABLE;
>> +    fi->is_full_speed = full_speed;
>>       return 0;
>>   }
>>   @@ -1303,6 +1395,9 @@ static int 
>> xe_hwmon_read_fan_control_info(struct xe_hwmon *hwmon)
>> fi->fan_table[STOCK_FAN_TABLE].fcp[point].speed);
>>           }
>>   +        /* Set PWM enable mode to automatic i.e stock table in 
>> use. */
>> +        fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>> +
>>           /* Read minimum fan PWM */
>>           ret = xe_hwmon_pcode_read_fan_control(hwmon, 
>> FSC_READ_FAN_MIN_PWM, fan,
>>                                 &fi->min_pwm);
>> @@ -1870,6 +1965,7 @@ xe_hwmon_pwm_is_visible(struct xe_hwmon *hwmon, 
>> u32 attr, int channel)
>>         switch (attr) {
>>       case hwmon_pwm_input:
>> +    case hwmon_pwm_enable:
>>           return 0644;
>>       default:
>>           return 0;
>> @@ -1954,6 +2050,9 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>           *val = 
>> DIV_ROUND_CLOSEST(fi->fan_table[USER_FAN_TABLE].fcp[0].speed * 
>> U8_MAX, 100);
>>           xe_dbg(hwmon->xe, "pwm read for fan %d: %ld\n", channel, 
>> *val);
>>           break;
>> +    case hwmon_pwm_enable:
>> +        *val = fi->pwm_enable_mode;
>> +        break;
>>       default:
>>           ret = -EOPNOTSUPP;
>>           break;
>> @@ -1967,11 +2066,15 @@ xe_hwmon_pwm_read(struct xe_hwmon *hwmon, u32 
>> attr, int channel, long *val)
>>   static int
>>   xe_hwmon_pwm_write(struct xe_hwmon *hwmon, u32 attr, int channel, 
>> long val)
>>   {
>> +    struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +    struct xe_hwmon_fan_info *fi;
>>       int ret = 0;
>>         if (channel < 0 || channel >= FAN_MAX)
>>           return -EINVAL;
>>   +    fi = &hwmon->fi[channel];
>> +
>>       mutex_lock(&hwmon->hwmon_lock);
>>         switch (attr) {
>> @@ -1980,12 +2083,59 @@ xe_hwmon_pwm_write(struct xe_hwmon *hwmon, 
>> u32 attr, int channel, long val)
>>               ret = -EINVAL;
>>               break;
>>           }
>> -        ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val);
>> +        ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, (u8)val, 
>> false);
>> +        break;
>> +    case hwmon_pwm_enable:
>> +        if (val == XE_FAN_PWM_FULL_SPEED) {
>> +            ret = xe_hwmon_set_user_fan_pwm(hwmon, channel, U8_MAX, 
>> true);
>> +            if (ret) {
>> +                xe_warn(hwmon->xe,
>> +                    "full speed enable for fan %d failed, ret=%d\n",
>> +                    channel, ret);
>> +                break;
>> +            }
>> +        } else if (val == XE_FAN_PWM_MANUAL_USER_TABLE) {
>> +            enum fan_table_type source = 
>> fi->fan_table[USER_FAN_TABLE].point_count ?
>> +                USER_FAN_TABLE : STOCK_FAN_TABLE;
>> +
>> +            /*
>> +             * Manual fan speed control using user fan table.
>> +             * If user fan table is not programmed, it would be 
>> initialized with
>> +             * clamped stock points which allows manual control with 
>> some
>> +             * default points.
>> +             */
>> +            ret = xe_hwmon_activate_user_fan_table(hwmon, channel, 
>> false, source);
>> +            if (ret) {
>> +                xe_warn(hwmon->xe,
>> +                    "failed to activate user fan table for fan %d, 
>> ret=%d\n",
>> +                    channel, ret);
>> +                break;
>> +            }
>> +        } else if (val == XE_FAN_PWM_AUTO_STOCK_TABLE) {
>> +            /* Switch to stock table specifying the user points to 
>> 0. */
>> +            ret = xe_pcode_write(root_tile, 
>> PCODE_MBOX(FAN_SPEED_CONTROL,
>> + FSC_WRITE_NUM_FAN_CONTROL_POINTS,
>> +                                   channel), 0);
> Is it required to verify the write as other modes ?
I think it may not needed, as setting points to 0 reverts to stock and 
it returns the status.
We can try reading the count and checking it is equal to 
FSC_READ_STOCK_FAN_CONTROL_POINTS.
I shall check with hw team if it is really necessary.
>> +            if (ret) {
>> +                xe_warn(hwmon->xe,
>> +                    "failed to disable user fan table for fan %d, 
>> ret=%d\n",
>> +                    channel, ret);
>> +                break;
>> +            }
>> +            xe_dbg(hwmon->xe,
>> +                   "automatic control enabled for fan %d using stock 
>> table\n",
>> +                   channel);
>> +            fi->pwm_enable_mode = XE_FAN_PWM_AUTO_STOCK_TABLE;
>> +            fi->is_full_speed = false;
>> +        } else {
> Rejected silently. Add a xe_dbg/xe_warn before these -EINVAL returns 
> for clarity.
>
> Regards,
> Soham
ok
>> +            ret = -EINVAL;
>> +        }
>>           break;
>>       default:
>>           ret = -EOPNOTSUPP;
>>           break;
>>       }
>> +
>>       mutex_unlock(&hwmon->hwmon_lock);
>>         return ret;
