Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 743CCC79F89
	for <intel-xe@archiver.kernel.org>; Mon,  7 Sep 2026 11:48:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3954E10E7B8;
	Mon,  7 Sep 2026 11:48:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Lp1D50Gg";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3CB0710E49D
 for <intel-xe@lists.freedesktop.org>; Mon,  7 Sep 2026 11:48:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1788781701; x=1820317701;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yLtjQJVgXKmLFRqQwCG5n+A37IvSTxqPQUZIwxBJTeU=;
 b=Lp1D50GgrTUo4YSVBFoR7nSxAkZLYbagC/9nDU9oz8tSGGqY1ztyBFoq
 eIxRf5I7Wxu+C7RQ0Rdmij3YEDSKKAi6uFUyWFb9VK4uasLty2k+F9g7M
 LLkasD8dMjtB70LAZAJJvJVccV6ac3VNyID9QyCvXU6+ZGusDM+ZUB4Bt
 sepcgdLE/C1gZt402IM8GdOCgN441D08qhT5fD2gPrlfdOjYScV3cLpvT
 MEYhBBTItUSV9IXmWYEM4Sv9qckFkfSOGyiac9M6Jg5QMfKjMAL1kuLzk
 rKgi7jJ/TuXkM5DT6bvhNQU4tOIeLI1+pxOmPj/3K9VkKU21QJwOV1hNJ A==;
X-CSE-ConnectionGUID: dv91L/cQQqSTsAGMTQWEWw==
X-CSE-MsgGUID: HDvJgjR/RUq7uH00cU80pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11898"; a="88118370"
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="88118370"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:48:21 -0700
X-CSE-ConnectionGUID: AH/a/t8vREGXB1LDx6DD0Q==
X-CSE-MsgGUID: QRfHMgvaRcK/QNodHOt6zA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,267,1779174000"; d="scan'208";a="274491314"
Received: from orsmsx901.amr.corp.intel.com ([10.22.229.23])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Sep 2026 04:48:21 -0700
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:48:20 -0700
Received: from ORSEDG902.ED.cps.intel.com (10.7.248.12) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46 via Frontend Transport; Mon, 7 Sep 2026 04:48:20 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.112) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.46; Mon, 7 Sep 2026 04:48:20 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=u8U7xgRRtOpAC4TH2gh6BUPFDm68OlEfKm+/+F1V0odJm/Qs16COn2fDCleruc0g1gL92nSccSQlsQFXfc03QER7tCTCZ2htYSHFhqQ+Qo2+mz3sIaHBpzusSujCrc4hvc5k2A8n/IbY6oiiZrB6EcBC+q0LbhcfJq7DM/K2RIXOd84IX5K1oSyqKKhsELaR4PWY85hm0zcqO7QKxmwpJn2qDTdU/utLsX8PTNRSC5/mF0jPzL3/qXx7Qj5hdex86NTqUQvYcXFb/LQQv7YX/bhg/6ezG85/csy8JNGuuPullr0wwK97LJrUpYzOiZI9Il6LWiFqgSXhHF/M0GoHSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DyH7Ne9vpFBimyfOz9nGA+ErVP5IPndCndxBvZYjpEs=;
 b=UEX/c8KlaSNSY9itJYGSroS2h3Q1S+az1xDMUEuCNXxw7g5CitiJfoU0ROSc5xDZNF7Bhk/PqZXSSCvm2+8DDsWsf8Rgrqxaw7GOKMdwt3Y7i+xkrqHj0BexepAEjKtohup83tW/08A4XRmohLZESx1f6c3IHH5ZX6DCeVRMRZGGyy6rKXzAPyWv6a6tPeRTjyhmOLxhULgKi5bBbMoOFELLoa5ANKFhu0VMRPQ5W3keTfZSebnedEmXOV9sm6HUSCIjuGegV+Xwx3YTiSzEkHKW7wevQpQ985Oc+8/dBaQfGb2DdijasyjFuMrLTFwxG8T/5wbDJHhsJZTEDvm4TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7530.namprd11.prod.outlook.com (2603:10b6:8:146::15)
 by CH0PR11MB8086.namprd11.prod.outlook.com (2603:10b6:610:190::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.382.15; Mon, 7 Sep
 2026 11:48:18 +0000
Received: from DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52]) by DS0PR11MB7530.namprd11.prod.outlook.com
 ([fe80::4957:93c1:7385:6c52%6]) with mapi id 15.21.0382.014; Mon, 7 Sep 2026
 11:48:17 +0000
Message-ID: <3be73c89-0ad9-4299-8c6e-ed55120f6b64@intel.com>
Date: Mon, 7 Sep 2026 13:47:54 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/9] drm/xe/sysctrl: Replace FIELD_GET() with
 REG_FIELD_GET()
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>
CC: <anshuman.gupta@intel.com>, <badal.nilawar@intel.com>,
 <vinay.belgaumkar@intel.com>, <riana.tauro@intel.com>,
 <karthik.poosa@intel.com>, <sk.anirban@intel.com>, <raag.jadav@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <umesh.nerlige.ramappa@intel.com>,
 <dnyaneshwar.bhadane@intel.com>, <anoop.c.vijay@intel.com>
References: <20260907105313.2208003-11-mallesh.koujalagi@intel.com>
 <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <20260907105313.2208003-17-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: VIYP296CA0005.AUTP296.PROD.OUTLOOK.COM
 (2603:10a6:800:29d::6) To PH7PR11MB7551.namprd11.prod.outlook.com
 (2603:10b6:510:27c::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7530:EE_|CH0PR11MB8086:EE_
X-MS-Office365-Filtering-Correlation-Id: bf998785-6e78-47bd-9419-08df0cd5e0f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|366016|1800799024|23010399003|11063799006|4143699003|56012099006|10067099003|18002099003|22082099003;
X-Microsoft-Antispam-Message-Info: fwFvk6LyFbX6+gxxDu1iNoOZl1AgAackU4i/HoVhthtG7NIUYU6n5o8C/f6PoN5GdSXsOtvzpP/lTX9xLLqQJE+wK8v12SzssVVQBFY/4NpbkN33ROQHKS4ail+IK9Ge0uJLaQDsiElwtIclurm2pmmy9/Nqh3e+zdcAqtyCHBxSfZ/VYgqs/sJEsOYF985LYoJEuto7hL/3ntDAxlTm/GlS6nlgiUQv3eaSzJxLpA4ssA88bFiL9tpaWh/BqVLNd3mmbRTIh9TGul5J9+FFJKuzkYy9QoDdDl20tzawis9j2mqpeW9rgzD2P5i4p9m3cKjQnhmLIdwxFZsWTQ8xXfFga6s+ZWETRd+bm03Vax+/vobFaTJPcTMFcp7zWPR7VMNn5koIbWHKRsMMZykVDKl92wI5Lj5uuoYEd8P6JbwisR7uSoH3FtiA+dk40ws8fvXXIF4rHPjraUB4qJYUZbxMQWbPOfS3xUwDdJN8GhvwtiKpHkcrVXRwVOPtPA1FRPA1KMVZnwQ2ZAsYOs0DIQpiSGkjeDkR2aRE3gGHuIAYnZ1q2EexR7VdJtglrVF8fD7ONliKaKbUutUk+I+pKPojs4ZcatClvRY4ntNPNILm6fibfWqhvj+env5pZGoJpQPK8zPWs2UHFxIU2wyFRQ36ObVnS2IZ29XaXA2aiGc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7530.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(11063799006)(4143699003)(56012099006)(10067099003)(18002099003)(22082099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dHpmazN0QlZlcU5NMlVHd0o3MnpuQmxsYXNrT21wVDJ4K0pWK05VZEdMd3Bm?=
 =?utf-8?B?bnM4UVZmWjhoY3pOejMweEU3bzlWVkdYbGVpdWhOTkZUQ2tPaHR1TSt4RGll?=
 =?utf-8?B?djdZN0p2SUt3THNZVzZjQy9KT1BEc2M2NkVlcDFOODRnYUNtS1lZblZXT3ZS?=
 =?utf-8?B?QnJiNVUrZWNUS1U4NGdBRFlIaURDOTdLWlR3R1RBTG1nUmQ1RFdCWVZyNVlG?=
 =?utf-8?B?dDNvdHN6V0NHQjU4eW9EdFZPOUFSZkFDY0JtaEJOa281N21FWmlabFR5UEdP?=
 =?utf-8?B?U04za0V2QmNnR3l4QXo3TlVrMUhjNUdRRUZ2UTI0MSsxZ0FvWC9DcldMcTdY?=
 =?utf-8?B?WXZ4OS9JY0ZLR29PTytlemIrMzR0cWhCbTNDaE9INTJYTHpmSkt6RENYcmZt?=
 =?utf-8?B?ZkxhaGE2ZkF5RmVsQysvY0Z2cWx1NjJwRkVYcjVILzVPNWF3ZVdsclYzd1o5?=
 =?utf-8?B?bFdPQnpLdXFZUUZ4ck5NMjBVWWlNKzZTcnExQURERmh6QjVTZlJGWHdndHNK?=
 =?utf-8?B?K2ZuaUJnRVA0WEVxeFY2UDBNUERVbVpXVE8vN1lWMG1ST0FPVkZjVnZOQWJq?=
 =?utf-8?B?ZE12dHVUcy9uRU9rQXVaRWtYRXlsYXVBVzBPeFpVK2VKOGhzMmhMQ0xHSE9m?=
 =?utf-8?B?VFJndjVXMWx4ellvN1RNbFgzT05yZ1ZCbU0vZVdzM3QwMk1TR3dNejh1VXB2?=
 =?utf-8?B?WTB5R0xRMU5mVkk0dlFPSzVRSmxpTzdwb25kd01WYkxuWFR4M3JMWmZaM3BQ?=
 =?utf-8?B?WkdzaFJRNDZGR1FKVWpqSk9iaWU5cm9hVytlb2J2ajJiZnYyTXhHR1UxVGE5?=
 =?utf-8?B?Z0IrTEVJT3RnZS9GNmEvbHc0RElaVzMreURxNHEzSGI0aXllOHBBTTY0aFNF?=
 =?utf-8?B?dmVCMGZCdHJIdy9iMkhObHRHUUNuU2VrclVCYVl1bGRsa2x3eEh5NzcxeHVw?=
 =?utf-8?B?Z3pUYnBpa2R4bzNXdUNuYWRpWkwwWFMwTlVZcnZSZXREdk5sNGZYeXBiTU9S?=
 =?utf-8?B?M3BDVEFFeGdCaXBXVGZyZHJVZ3F5aWErYjg2bmRnNFk2eWhXM0RZK0kzZkh6?=
 =?utf-8?B?Z2oxamNmZm1xbldEVHZpcmpqSm45ZkpvSmJFa1NuOGlna0hCTGlHVFEyd0Q2?=
 =?utf-8?B?Um9ILzR0dUQ2S0R3dVBUSndmMGRudkxnL0R5RzJGcDNUeGdwdEY5NzNGQjRl?=
 =?utf-8?B?cEs1TjdZQm1CYjM0N0c0djRVRTRsRGJjSUhLMjlRTXlWb3FBU25QMnlpZnhZ?=
 =?utf-8?B?QTNHU3ZzamJsc1RVSEEyZ3VTQkZXdHBhSUhhSDZhMHdoNExZQ1laSmxTaFU4?=
 =?utf-8?B?ZnJKQlp2cTk2OFhKUTd1eS8vSUdla1NOZm1kWUlxNFQ4KzJKNlJyNWdOdEJZ?=
 =?utf-8?B?MTdMcXRXVGZsalV0aDd0OHU5d1pWMkpadlc3YjJnSGRmSG1jTVFYWm1UV2l2?=
 =?utf-8?B?VnRxZXJtbVExbVVXY0ZsbW9XaHJIVmtacDJsbDBmWExxNXVXVjBDaEluTlZE?=
 =?utf-8?B?cC95NStWZ284bFJEdDRBdEw3RERRb2Jld0ZFM25BamVZQmlwYm9BUUJidGhC?=
 =?utf-8?B?bnlzN1BYSnB6KytIblo4NmtBSGpEMmM0RTlKYUVoNnVnSERERUM2K2xxb2ps?=
 =?utf-8?B?U2ZZc0VJMmlLbUxxS3RRYjNNOVRZTEN2a3FCZjNjZnNDUDczNFMrS2pqaHFq?=
 =?utf-8?B?VXZuVXZsUE9DY0N1VmxWZTlmR3FvTUFVVkVRemozYWVQazBzb2t5S3dIbmdE?=
 =?utf-8?B?cjRXenB1VkJpZnhaZmYvV0hxOThVNFd1Szdub1dlL1FGNktsUWlRekpQUFc3?=
 =?utf-8?B?TndEaWZkUUs5UVdqdU9zVk0yaExOT2htQ1V1V3lORllDZXZtcVM2Mm8zaVRU?=
 =?utf-8?B?RFU0NHJ2SkU1V0s4OHRvcG5tWkNCYVlBZDAwcURTTXowTW9GcTJyN04wYm0z?=
 =?utf-8?B?R2Z3V2ZqVS93dTBDR01NeDg3T2ROR214TFVUNnlHWkVFL0RycExNVVZXaGMz?=
 =?utf-8?B?WmdBRGlxOE9vTnIwR0ppWFJ1eDF1NUprLythWEpaVjE1NFQvNFVtc2lrVGhO?=
 =?utf-8?B?a21aNityVlZxRms5L21Gc2M3OEluWW81U2Z5N05tbVV2MGJsNVp4TkJtaC9n?=
 =?utf-8?B?MWsvd1I4bGRRY2pJN1YvRzZDZXYwb2NsanBIaHhWTjJEaFVNR2IraXNiTVlE?=
 =?utf-8?B?aERLU0w1YWRzUkpOeE5WbDhNRHVFU3M1SitkaUhTcjJKdm1RS0hubWRwRjRC?=
 =?utf-8?B?VWs5WXNHbU9aYlBpaC9wK25ZQjBscGxMMTIwdGFVeGwzSVRQSE9MaGNNSjFQ?=
 =?utf-8?B?OUtkcHVzTWNBdEd6RVg1T2xMcWdPTW5UeVJRN2kvdlVnS3J1ZlBsUWdybjN2?=
 =?utf-8?Q?KOK1CsFxSuCZIbeM=3D?=
X-Exchange-RoutingPolicyChecked: RwOb4YmJXv8RFJgIFW9jBj10liyZJ6MYCHVBSuUi6GfuWxm/Ej4sjdQhlvuWI11Pr1FnB4QnqnA74ZhlWKtOH81Vq5sAfLoTkOLSo3utgx7i69NnZq5XZGIc6qxB6qsoCydTOE5UHpDDPOV7u++AIy2J+gY0k9XHfk7TWRyjTQbNFsa8ovqeTZUKgLu+iyVT8iW8lgEqn4YwlMHjrb+tCcKFDkvqm3CveoQ+ajRPLYgoMXtnadvRvMirnzWa6f2E9z0fFWKMniEYYlpiqtjT3vm/fql6t2ldo4tvXnSytiTX5M8BwotmqAjdIvCY0qV4fmB4oRTqSZdtEzp0+sOwJQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: bf998785-6e78-47bd-9419-08df0cd5e0f1
X-MS-Exchange-CrossTenant-AuthSource: PH7PR11MB7551.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Sep 2026 11:48:17.7539 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Te24aze/cdE5FEcjonRNp85fp5x4LSQUYNsuHFUSgmi4/9ZLbONBBDz6WLo9771CpyB3GTcpFSCBQp5ZtTVBGqMyCXaLu6D+uTRmM1BWe8o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR11MB8086
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



On 9/7/2026 12:53 PM, Mallesh Koujalagi wrote:
> Use REG_FIELD_GET() when extracting fields from SysCtrl and

nit:

Use REG_FIELD_GET()and REG_FIELD_PREP() when working with fields

> application headers. This better reflects that the masks
> represent register-style bitfields and improves consistency.
> 
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
> v7:
> - Update FIELD_PREP to REG_FIELD_PREP. (Sashiko)
> - Update FIELD_GET to REG_FIELD_GET.
> ---
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.c | 20 ++++++++++----------
>  drivers/gpu/drm/xe/xe_sysctrl_mailbox.h |  6 +++---
>  2 files changed, 13 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> index 50bbdab072de..cdd929ebed4a 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.c
> @@ -24,16 +24,16 @@ struct xe_sysctrl_mailbox_msg_hdr {
>  } __packed;
>  
>  #define XE_SYSCTRL_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_GROUP_ID_MASK, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_COMMAND(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_COMMAND_MASK, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_IS_RESPONSE(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_IS_RESPONSE, le32_to_cpu((hdr)->data))
>  
>  #define XE_SYSCTRL_HDR_RESULT(hdr) \
> -	FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
> +	REG_FIELD_GET(SYSCTRL_HDR_RESULT_MASK, le32_to_cpu((hdr)->data))
>  
>  static int sysctrl_wait_bit_clear(struct xe_sysctrl *sc, u32 bit_mask,
>  				  unsigned int timeout_ms)
> @@ -112,8 +112,8 @@ static int sysctrl_prepare_command(struct xe_device *xe,
>  		return -ENOMEM;
>  
>  	hdr = (struct xe_sysctrl_mailbox_msg_hdr *)buffer;
> -	hdr->data = cpu_to_le32(FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> -				     FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
> +	hdr->data = cpu_to_le32(REG_FIELD_PREP(SYSCTRL_HDR_GROUP_ID_MASK, group_id) |
> +				REG_FIELD_PREP(SYSCTRL_HDR_COMMAND_MASK, command));
>  
>  	if (data_in && data_in_len)
>  		memcpy(buffer + sizeof(*hdr), data_in, data_in_len);
> @@ -186,8 +186,8 @@ static int sysctrl_process_frame(struct xe_sysctrl *sc, void *out,
>  	}
>  
>  	ctrl_reg = xe_mmio_read32(sc->mmio, SYSCTRL_MB_CTRL);
> -	total_frames = FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
> -	curr_frame = FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
> +	total_frames = REG_FIELD_GET(SYSCTRL_FRAME_TOTAL_MASK, ctrl_reg);
> +	curr_frame = REG_FIELD_GET(SYSCTRL_FRAME_CURRENT_MASK, ctrl_reg);
>  
>  	sysctrl_read_frame(sc, out, frame_size);
>  	sysctrl_clear_response(sc);
> @@ -295,8 +295,8 @@ void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 gr
>  {
>  	struct xe_sysctrl_app_msg_hdr header = {0};
>  
> -	header.data = FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> -		      FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);
> +	header.data = REG_FIELD_PREP(APP_HDR_GROUP_ID_MASK, group_id) |
> +		      REG_FIELD_PREP(APP_HDR_COMMAND_MASK, cmd_id);

hmm, shouldn't we use le32 conversion here?
other sysctrl cmd/hdr parsing/prep seems to use it


>  
>  	command->header = header;
>  	command->data_in = request;
> diff --git a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> index f0d5e3d7f5e3..5a3dd14e3a11 100644
> --- a/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> +++ b/drivers/gpu/drm/xe/xe_sysctrl_mailbox.h
> @@ -15,13 +15,13 @@ struct xe_sysctrl;
>  struct xe_sysctrl_mailbox_command;
>  
>  #define XE_SYSCTRL_APP_HDR_GROUP_ID(hdr) \
> -	FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_GROUP_ID_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_APP_HDR_COMMAND(hdr) \
> -	FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_COMMAND_MASK, (hdr)->data)
>  
>  #define XE_SYSCTRL_APP_HDR_VERSION(hdr) \
> -	FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)
> +	REG_FIELD_GET(APP_HDR_VERSION_MASK, (hdr)->data)

ditto

>  
>  void xe_sysctrl_create_command(struct xe_sysctrl_mailbox_command *command, u8 group_id, u8 cmd_id,
>  			       void *request, size_t request_len, void *response,

