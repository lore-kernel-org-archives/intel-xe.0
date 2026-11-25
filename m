Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18056606A31E
	for <intel-xe@archiver.kernel.org>; Wed, 25 Nov 2026 08:24:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=B4JQFj30;
	dkim=pass (1024-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=selector1 header.b=DDpregwn
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE77810E169;
	Wed, 25 Nov 2026 08:24:42 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55DD110E169
 for <intel-xe@lists.freedesktop.org>; Wed, 25 Nov 2026 08:24:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1795595072; x=1827131072;
 h=message-id:date:subject:to:references:from:in-reply-to:
 mime-version; bh=sxv3CqGtiwnNtkfNspC6lSv8CUi/rBf2wLG4jlLIhxk=;
 b=B4JQFj305yrjb0B+g8OfuHqb3CxhMUNpFrpNqzEmHnKOAHsHrUqagSPr
 AzNKa/LRTyjVChj0cHzjevTWfAmQeutF9+uPjeeXbHFygd1T3yDGK/tu0
 PGWQPCSFdhH5JKgeOV22px9SZMd+bqbe1wMOWPmarBsIcV+F+vUMlvGnY
 PwFmvF47PwQsdyWr3dSZZGtSO5XmOXGPIDAnHWyMpU6V5My3OmD2d0I3X
 b2X/s6YpbU/RuIxkJkIEIeZqn2rp1FfsXGADX7d3TXWu1AFYrGFBnI/ra
 MUFai5LbVX3RcOWA/vEqRvFY0QtsoRcilOkMWt9mXSMNN3FSFn323Uo5F A==;
X-CSE-ConnectionGUID: a+dPzp9AThKcTqCvPJotcQ==
X-CSE-MsgGUID: IO+vTV7WRHKFNnBVrgqS7A==
X-IronPort-AV: E=McAfee;i="6800,10657,11976"; a="4338622"
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208,217";a="4338622"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
 by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:24:31 -0800
X-CSE-ConnectionGUID: oSeVSoZ0Te+CdJTHH75SBw==
X-CSE-MsgGUID: 9T+1YppxQM2gSWbB1ZSwZQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,232,1787036400"; d="scan'208,217";a="12118392"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa009.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 25 Nov 2026 00:24:31 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 00:24:30 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57 via Frontend Transport; Wed, 25 Nov 2026 00:24:30 -0800
Received: from SN4PR0501CU005.outbound.protection.outlook.com (40.93.194.33)
 by edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.57; Wed, 25 Nov 2026 00:24:30 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d03lLiIjIJK+Sbqt+0uQN54+yxkW2pn6y/NhuCzOleH8sB+YxeH9YoeRfv6rAXcox3yFcCw+9zB1UNJLiJNN4VCWtCFaXqbZfHPR5suoWIsAaLSxIw87ilu669ttfQK+vt2Ip9TAqTGnkmLNmsUxh45eRDDWR8BuOX/Gcw6/wjzK7QI84WY+lrrTKa4YaEdgSCLGGI2z+cybW3D/PBMH4sTEvfN0qRHSr9OGHl+crsi5HSxXba9Qd9sAwIJQPFv/ctHyvRgon9qyWtlfPg9Y1UynOd041D7YzqNKqAazKVEwz+EhBND/OGip0E51d0pSpeOZ4CdlIDS15EJKtPYhpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ELRTpH7/iCuoTnwzwBIKj6WlJA6j61kHmfgiWaxaVVs=;
 b=pnB0xSUWQvYb635mDmuLq5/TZeQqD+Zl2k26bD4dg9hvnx4/a2LKbhE5DGsJAzhMGjUfOI8XvPDep3+CeK6C1nkoI9+n5QvY6+/GigpjZzwqHwyzLhQDbGX9WinePr6G047PU/LlcFc0IeVUPw0ThOUfkyNqZ3CA6hscumeNOEYE73JMqUFte95Y2crYH4Iq0xTgZPXecsilO4DpilS3+hUMc9AxostxtxUVTRD7JycdKJHBFOpAnYGr7Yrsmloz9WhdQUHxyePDUCsldk3UAWB87t+V5Wj9TQEE63jQ5RfwTxz1SIv3xQips6gc9YApntaCmonjlBTNR+P9GLlmrA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=intel.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ELRTpH7/iCuoTnwzwBIKj6WlJA6j61kHmfgiWaxaVVs=;
 b=DDpregwn2vAXFbgciCAa17WxpIzJLgnZI2NJ+wlZXbA+QXm2+m5ljDA5WwuIdLQ/7OXKuY6XABO84ASAPiVFNwtFnj5xj4QNsq1szH71wH89PWW4UdpXTpV9mSdBy6csmaeQtNNa9tDocw6+Lzr13e7lKYjnDWRuGFE0sDBeGk8=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB6468.namprd11.prod.outlook.com (2603:10b6:208:3a4::18)
 by SJ1PR11MB6249.namprd11.prod.outlook.com (2603:10b6:a03:45a::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.662.7; Wed, 25 Nov
 2026 08:22:44 +0000
Received: from IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5]) by IA1PR11MB6468.namprd11.prod.outlook.com
 ([fe80::c69b:dedf:a089:33e5%5]) with mapi id 15.21.0639.012; Wed, 25 Nov 2026
 08:22:44 +0000
Content-Type: multipart/alternative;
 boundary="------------9H2lBugswC7fT5pMcozQ5Kh7"
Message-ID: <45c4c1bc-fb68-418a-9eaf-d75e3a4ab7cf@intel.com>
Date: Wed, 25 Nov 2026 13:52:37 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] drm/xe/pf: Restore default PF scheduling on failed
 VF enable
To: <intel-xe@lists.freedesktop.org>
References: <20261124105009.3431301-1-piotr.piorkowski@intel.com>
 <20261124105009.3431301-2-piotr.piorkowski@intel.com>
Content-Language: en-US
From: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
In-Reply-To: <20261124105009.3431301-2-piotr.piorkowski@intel.com>
X-ClientProxiedBy: MA5PR01CA0306.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::18) To IA1PR11MB6468.namprd11.prod.outlook.com
 (2603:10b6:208:3a4::18)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB6468:EE_|SJ1PR11MB6249:EE_
X-MS-Office365-Filtering-Correlation-Id: 26ad54ee-3225-4533-7279-08df4acd47ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|23010399003|1800799024|10067099003|56012099006|11063799006|261022113327099003|261022105027099003|261022075727099003|261028144727099003|261026121527099003|261026140227099003|261021121427099003|261102123227099003|261009223027099003|4143699003|22082099003|18002099003|8096899003|3023799007|13003099007;
X-Microsoft-Antispam-Message-Info: 5Nsf7kLOa2Y1Fr/kpDrOs/InieLbx4qiDt1IoNdxC+5902nLdtGkZ1pXLG2S7IVWuV0iTsK5UaVQ9LXdGglkzQhi1VyfSISCc/tadpeMozkEdf18KmhjIRtf6wMCeKgGamhgfwKT8nu/5yFdxawWZW8zwQo37UhHfEGlYEiQB9wYAIe8qBb0q2uH+nbHgDkQbGABykMvxKnWVZuS09wyy7PnR5DH8C7aMErvIS7rC7BxAyLFbq///pRsc9tyAkEDOyHMW6mrxniczHG/ENXf1DxBVf7Q8ARGNssZgYh3IpTV0RoPJVJyzYExajlqF9uXSYaFsisL57KhI0vI1CocSPUJZq01tFC8hWFJT0VJZh4hJvF7tDijdtq/YJJezibSbMmUOaQYHHYdFDZojTdGo9SltGcnXOhBzEMOR958joWLvQqQaj56NWSToBB46Phb7MAFMvEk9/vKpxBdCIpvv2coOSFCwAjn9N8pBq5lkB6rn4RGpFKkBLvpi1lfmfkgTnbiAATcPnHTxZNqtm9Ts5s3EbmhmX43Y4gZQ3VrjZrQ7szQeEszECqlmPMu6kXDJE/jv569kI2YAyQWWCvtvu/HrEoA7EKya95MY2giOtMrBMe95C8go6XXBeW8YJbA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB6468.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(23010399003)(1800799024)(10067099003)(56012099006)(11063799006)(261022113327099003)(261022105027099003)(261022075727099003)(261028144727099003)(261026121527099003)(261026140227099003)(261021121427099003)(261102123227099003)(261009223027099003)(4143699003)(22082099003)(18002099003)(8096899003)(3023799007)(13003099007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?blZZK0NqOGpReWVpU1NxclBIdWV1S1ZVU2RkMDRCOWNNWGtpUVprZlRrNmdx?=
 =?utf-8?B?Wk9zZmJqTVJwLzJzQ2NjVjEyL0hmbVY4MVNQS2FhdHNSSnZ5TWd3NjZCT25F?=
 =?utf-8?B?SDZ2MTlWMGsydTV6SUY0Y0NqeEdZcXlmdUNJRCszQlpMMFBGaysyQUZtSWdj?=
 =?utf-8?B?aHlJa01NVTJpSExDZXJRMDR3eUtqbE1nNnQ2bWMzcVM3bitWS2N0bGJXK2I4?=
 =?utf-8?B?YUMwZmRjMWVabGkrV2MvZFQvQjFvb1lpZkNvWk11UithdlpBODlhc0x3aiti?=
 =?utf-8?B?dk9IUTg4VWVURzhmZVNRNWpiRFdxcFp1VFZ3ME53V2Z4ZWg5YlRiWlNLVmMx?=
 =?utf-8?B?cDJDSzVOajFzSmZBaThURlZqVTZsc040U2tTTC81N2E1U212VTVqMkhGQlRL?=
 =?utf-8?B?b0YwMSs3VFNRSklnSis1WGpvZGFPNytYRzlpTTFQZGZDaGZTdUlreU15b2Y1?=
 =?utf-8?B?SmxIWWFqZ0Erb1VUc28rYUZvM1VyT0ZaME8yN3pITTFETFpWY2p5WUV4dm02?=
 =?utf-8?B?RnhoaGlLUTV5bkdlcU9sMld4UTYyK1p1bjdPWlRiTXNCb2pOSTVta3I2bG1W?=
 =?utf-8?B?RWRpVXhaZmJKWHU1NEZMWFNUR0pLY1pVbDYvb2Q5ckk1QTdUZmVGeHNzSEZR?=
 =?utf-8?B?QTlaSVdnVVdYcEdreTVLWlRuaG5Jb2FIdG14VWhGcFhwQnlXU1FlQUNGVktN?=
 =?utf-8?B?NWRjUU4zYW1GbnhGNStEdU1WeEpER0NXdGY4UHE1SjdVYjhiUUNwdXMvbmtq?=
 =?utf-8?B?SzZFK3U1cFZUYUpBNFBNbXlBNzkvejVLRUdQZDhYQnNXa1RhNENCVzIyUDRW?=
 =?utf-8?B?cWY5M3VYR09SZUFHb2U0TmVuQ0VvZEw0aXFQRmVESFo1V1NSdTIvSWJxc0l2?=
 =?utf-8?B?V1VFZHAreFdRTU5mV2hneW1rSmx1SEw4Y2ZHY2R0a3BWMTQ3YXU3ditBWjV1?=
 =?utf-8?B?bnluQ1ZjN1FrZStJc2NteUtjekJZM2VNeG5aNTdTalFPTlNiNHpyUnNYU3dJ?=
 =?utf-8?B?MURTOFErVjdxSnAwYURsM0ZrRjdUVDBkNVhCaHpqcUpvU0VuSnpVV0xGR3Mr?=
 =?utf-8?B?N0hGZ2E1RjczNjNQc00zUG9ONVJxLzZPeU1LRFNjMDBURzVGajI4bWxQdzc4?=
 =?utf-8?B?V3kvaVJZa0lML1hubmpIRFdGd1F6cTZUMDB3ZDJvcFZZZ3QvazhaVFp5ZnBE?=
 =?utf-8?B?ZklabFd1WENkK3I4ay9XR1EvQlhHRDg4RkJPdHhVdlZnalF5clVvL1dycngw?=
 =?utf-8?B?Z0lnZU02WURoUURQemV0ZXN0L3E3Wjd3d2UxSlowQ2NSQ3ZrNk5SY3E2TEt4?=
 =?utf-8?B?dFJMT2o1cGhFWXJEQ0RQYUJ3bERuVHNXMXdIRmgrV3VocThSbk4ycmlEd3dV?=
 =?utf-8?B?eXNwdmJqYXBmcmp6cWwvTnZGMGFIdkNCTUUyZXcxYnk1M3hLNWUxc3dxeDlO?=
 =?utf-8?B?UllMZytWOHpWTHAxcDY0dHZGdkZ1WDVBZnhUYjhqVE5JZWF3MUZXQjBPcE9q?=
 =?utf-8?B?QUZYYVdpaTFxQ3NFUk1JZVFReEpvcm5reXNBYlB3Z0trQUlLakc1V0w5ODRx?=
 =?utf-8?B?Q2s5ejZXTWhRS0JUWGQ3R0Z4ODFWamQ4MGhkeWZBMlEzSlhDZnRmdjhZckhm?=
 =?utf-8?B?V2pvK05LbjZ1eHJ0ZXBnblJJSGhMVUFYRzd6eUU2dDVubnMvZG5EdDNETUsx?=
 =?utf-8?B?NGJNTnhEV0drOTNBeXRaZUJqcFM0UlE5Nkw4SEY5aDFyUHB4ZTVBanVJQWZx?=
 =?utf-8?B?R2s4QkRMSVVlK3lnWVR0THk1dTJJWUpvTFhXcVVzRGUwc1J2RXpTM1lKRmpi?=
 =?utf-8?B?QllhYU1iYSt2K3B4NGlyNGNQRFFkcFZRU0dic0huOVVLU1MvWWhzZ21ZcnRO?=
 =?utf-8?B?cGF6bkMyL3FDWmdOTGxGTFpkMEExWlB2bEkzV095S3oySDNBRE45QkpxY25t?=
 =?utf-8?B?R0ZaYThLeFZvRzZ1Tm80Nmt2SnJCZ05YK2dJdDhJeVVNOVZ1UmNrYjk2aE5N?=
 =?utf-8?B?NGdUNXovcUpFdlFHeXl6eHBydTJTVk1kUTh3alRaU1UvU3oycUxqMEpJbHVX?=
 =?utf-8?B?dXRIS3FoK2FHc3pWNCtUTHEydUpYTk9ZNm1HdmZua3dsaGpjQXdQZ01Eanht?=
 =?utf-8?B?SzdVOUgxTm01WHV2K0dvT0tVc2huY28yNW1TY0hxSjlEMTVIWmdYQXpwNkRS?=
 =?utf-8?B?Q1IzK3ZJcE5aT1VvTzhVSkdhOHZIeFYvVFE3Q0dacHhMdWtETCsreForNGtW?=
 =?utf-8?B?UHd3TTVSVGR6bjd5RGdtL0U5TytadE5OWExLNGcza0J2TTNyRlozRUwrMnVY?=
 =?utf-8?B?RFU4di93emtVZ2l2V0VWVEg1NTJzcmhGNTcva0VFNWtFOFEvVi9TK0RVNXFW?=
 =?utf-8?Q?63cD2asjHHHC7zQw=3D?=
X-Exchange-RoutingPolicyChecked: htlVZxxBAd2Nie6eA5kxlhh4eWiO+BxoFYbMaamAAeOPQnSgJVns56EITIhdZu5j4783u9VUlRW4gUhCet9RniPuihEFpPChCkO0+mvt7p85Jy7WF3eKYg5yMDdD/X6H02xs496HGBr8n9OuAsLLqszgdGSKztyvh7W9l9Y+OtiNtvr3YFw7mPYidPzxoLo9cn20MGf1slv+sS9CmZhFWIvp1FxxWvKAUMmDJNZMMzU576KBt6K65mRp+c9Gc0VXfbB8pwzjxOQJhsUdl5iAGFeZWILTh3jX2bHTYOBdLPfvCduFgBUCBx/W4IygIL5c2VuuVvpovMM3nz97VSwxTg==
X-MS-Exchange-CrossTenant-Network-Message-Id: 26ad54ee-3225-4533-7279-08df4acd47ad
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB6468.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Nov 2026 08:22:44.4842 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YwpZF4bP1dZ7ojMnAeAav7hV4dYNe0+x0kdMkamS7n7os/kDwNwBfdtA0xOoqvbcTE4gXeZb036rCRIF8mWYvEe0NDruBXIQ30fptnxg+5Q=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR11MB6249
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
X-Spam-Status: No, score=-14.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HTML_MESSAGE,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--------------9H2lBugswC7fT5pMcozQ5Kh7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 24-Nov-26 4:20 PM, Piórkowski, Piotr wrote:
> From: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
>
> When VF enabling fails, xe_sriov_pf_unprovision_vfs() releases VF
> resources but does not restore PF scheduling parameters set by
> xe_gt_sriov_pf_config_set_fair_sched(). This leaves the PF with
> scheduling parameters (exec_quantum, preempt_timeout) set
> even though no VFs are enabled.
>
> Add xe_sriov_pf_reprovision_default() to the failure path, mirroring
> what pf_disable_vfs() already does on the normal disable path.
>
> v2:
> - picked up from standalone patch and rebased (Piotr)
>    https://lore.kernel.org/all/20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com/
>
> Fixes: afc480ff55c5 ("drm/xe/pf: Perform fair scheduling auto-provisioning")
> Signed-off-by: Marcin Bernatowicz<marcin.bernatowicz@linux.intel.com>
> Signed-off-by: Piotr Piórkowski<piotr.piorkowski@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_pci_sriov.c | 1 +
>   1 file changed, 1 insertion(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
> index 31abcee55211..3bf995736502 100644
> --- a/drivers/gpu/drm/xe/xe_pci_sriov.c
> +++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
> @@ -178,6 +178,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
>   
>   failed:
>   	pf_resize_vf_vram_bar(xe, xe->sriov.pf.device_total_vfs);
> +	xe_sriov_pf_reprovision_default(xe);
>   	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
>   	xe_pm_runtime_put(xe);
>   	pf_finish_vfs_enabling(xe);

LGTM.

Reviewed-by: Satyanarayana K V P <satyanarayana.k.v.p@intel.com>

--------------9H2lBugswC7fT5pMcozQ5Kh7
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 24-Nov-26 4:20 PM, Piórkowski, Piotr
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20261124105009.3431301-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">From: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>

When VF enabling fails, xe_sriov_pf_unprovision_vfs() releases VF
resources but does not restore PF scheduling parameters set by
xe_gt_sriov_pf_config_set_fair_sched(). This leaves the PF with
scheduling parameters (exec_quantum, preempt_timeout) set
even though no VFs are enabled.

Add xe_sriov_pf_reprovision_default() to the failure path, mirroring
what pf_disable_vfs() already does on the normal disable path.

v2:
- picked up from standalone patch and rebased (Piotr)
  <a class="moz-txt-link-freetext" href="https://lore.kernel.org/all/20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com/">https://lore.kernel.org/all/20260806095046.1360538-1-marcin.bernatowicz@linux.intel.com/</a>

Fixes: afc480ff55c5 (&quot;drm/xe/pf: Perform fair scheduling auto-provisioning&quot;)
Signed-off-by: Marcin Bernatowicz <a class="moz-txt-link-rfc2396E" href="mailto:marcin.bernatowicz@linux.intel.com">&lt;marcin.bernatowicz@linux.intel.com&gt;</a>
Signed-off-by: Piotr Piórkowski <a class="moz-txt-link-rfc2396E" href="mailto:piotr.piorkowski@intel.com">&lt;piotr.piorkowski@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/xe_pci_sriov.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/xe/xe_pci_sriov.c b/drivers/gpu/drm/xe/xe_pci_sriov.c
index 31abcee55211..3bf995736502 100644
--- a/drivers/gpu/drm/xe/xe_pci_sriov.c
+++ b/drivers/gpu/drm/xe/xe_pci_sriov.c
@@ -178,6 +178,7 @@ static int pf_enable_vfs(struct xe_device *xe, int num_vfs)
 
 failed:
 	pf_resize_vf_vram_bar(xe, xe-&gt;sriov.pf.device_total_vfs);
+	xe_sriov_pf_reprovision_default(xe);
 	xe_sriov_pf_unprovision_vfs(xe, num_vfs);
 	xe_pm_runtime_put(xe);
 	pf_finish_vfs_enabling(xe);</pre>
    </blockquote>
    <p>LGTM.</p>
    <p><span style="font-family:Menlo">Reviewed-by: </span><span style="font-family:Aptos">Satyanarayana
        K V P <a class="moz-txt-link-rfc2396E" href="mailto:satyanarayana.k.v.p@intel.com">&lt;satyanarayana.k.v.p@intel.com&gt;</a></span></p>
    <blockquote type="cite" cite="mid:20261124105009.3431301-2-piotr.piorkowski@intel.com">
      <pre wrap="" class="moz-quote-pre">
</pre>
    </blockquote>
  </body>
</html>

--------------9H2lBugswC7fT5pMcozQ5Kh7--
