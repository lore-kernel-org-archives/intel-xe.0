Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A845A606A31F
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 08:24:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=lX73/P4f
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD5C10E287;
	Thu, 29 Oct 2026 08:24:12 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0B2510E287
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Oct 2026 08:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793262247; x=1824798247;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=YDp3hT/g6p0py15PMy05Q07wDGfkSPxlAmGlfkpvzhM=;
 b=lX73/P4fAh17yTCFF+4UQh08vMzL4BkV4ldLzg3CYM6s4Jc6srOdOHGa
 dcms5t+px+DQQ+TlD3EzV+OxbpqdemTFpd+MweYMyRtoQ9F3gWI8rjnH7
 pkd4n06ZMOBTonzqjXmaglAWhHTHtfXkirWcsXCXp0qi4sYlCjCJf257X
 5s8J0nZrJC4snUdtk74p1FtJm+yYCKCtJuuIXapdINdGE3ngDnPsr+huX
 CmXBvStU04oOjfKnUOMmatyitGlhtMfs6pG5vH0l5P7HLD8PJiTo1wLcL
 SbS3SSZM+n++WwxzoAyR8JDeQwyaFw5ZyNQ0ai8VVyPyQlxF5+tjO/+EB A==;
X-CSE-ConnectionGUID: 6leGon9rTE625p5WpnEqYA==
X-CSE-MsgGUID: 0upoI+FCSZm7gKPmF26CXg==
X-IronPort-AV: E=McAfee;i="6800,10657,11949"; a="1886796"
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="1886796"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:24:07 -0700
X-CSE-ConnectionGUID: xYksAyLZQR25Lg4J9n/H5Q==
X-CSE-MsgGUID: SZ5Ha2guQVWHAc0XTaPyig==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,184,1787036400"; 
   d="scan'208";a="5007969"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2026 01:24:06 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:24:05 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Thu, 29 Oct 2026 01:24:05 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.9) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Thu, 29 Oct 2026 01:24:05 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pEVrSKnzVxI3b8a7RzA/TOoBqhrzCGYIMQo1C+TUj6ud5e6nX3ChYb9+xaivA6qUe1h8aTN+aDcBHrpfXdB5eyozNtgFkqAfWvW9nWfXCXGFFY9dsXduImDz2cSC4jcvjxoPkrnPeIxxKRyd5xWWO2n2YTCq0RMAB18DO7ggM7WERkC3Rjz9IDEkMA9PqdFKcoQg3lPVT4Qotl0vd4+Tb30tY3V+t8zYzbJO+F5T689cWAzjNPMXa4JjEhIYatpYKK50O2QXo2U59WdY9vwMZWO9csjgm5EjmOsi8TIqTWq+L28OMqFeO/E/PC3jUXIbnGHDmxGK735QNNEBXcqxdw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=94WUsPuR9CiLfaiHKjhc6CQ/JlxIeKrbxHQN0XiOXCE=;
 b=gTWOK4E/diXxUsbUbVE1HkCHvfoq1U8Zv8RLYb0eDnD/yed4H97U9//+wMVyxZ7Fo4rQ8tLsZ/nBVVx4ABeXsN42qCgcOGN3qQt8SR3W+0eCbTz2EWBjsD4+1gXLeBCxTsKog7/HY1cfSpQsgmt1CcO6uPYaIRjJgfkRVOEC0seySXHMa7qkt0/TwJYScwC/UQ5Fdz+zZv1JoFVUQIIsWFWJkMxlVSrtWWfIzQCjr/DgSlTtEQUBeM1bV94Na2sYVbCE2rgv65jhzSKgn5KGwYU5Oq9+KGzy6xbL2ocGgY+9fB3czH1YCmFgVtlxSdArcmNh5xKSn4/U9AjTbcpnWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.21.569.8; Thu, 29 Oct 2026 08:24:04 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%4]) with mapi id 15.21.0546.021; Thu, 29 Oct 2026
 08:24:03 +0000
Message-ID: <b8cc8266-68e2-440d-b87e-d4c7877b9b4a@intel.com>
Date: Thu, 29 Oct 2026 13:53:55 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/9] drm/xe/xe_hw_error: Handle non-fatal errors routed
 via direct IRQ
To: Andi Shyti <andi.shyti@kernel.org>
CC: <intel-xe@lists.freedesktop.org>, <anshuman.gupta@intel.com>,
 <rodrigo.vivi@intel.com>, <aravind.iddamsetty@linux.intel.com>,
 <badal.nilawar@intel.com>, <raag.jadav@intel.com>,
 <ravi.kishore.koppuravuri@intel.com>, <mallesh.koujalagi@intel.com>,
 <tejas.upadhyay@intel.com>
References: <20261026060459.771448-11-riana.tauro@intel.com>
 <20261026060459.771448-15-riana.tauro@intel.com>
 <auIedl6plynJE3ML@zenone.zhora.eu>
Content-Language: en-US
From: "Tauro, Riana" <riana.tauro@intel.com>
In-Reply-To: <auIedl6plynJE3ML@zenone.zhora.eu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5PR01CA0307.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:220::8) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|IA1PR11MB8200:EE_
X-MS-Office365-Filtering-Correlation-Id: 673e92bb-6f85-4a58-8046-08df3595fdd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|23010399003|1800799024|376014|22082099003|18002099003|56012099006|4143699003|11063799006|261028144727099003|261022105027099003|10067099003|261026121527099003|261009223027099003|261026140227099003|260925021911599003|260925021311599003|260925022911599003;
X-Microsoft-Antispam-Message-Info: nNHcMDKHVZKaIM2DUXj9OFJzyRH8GzRFmnNs4ObKU03OD+Iojkj0wLEoCGtU8m6JyNQJZ7OP+ojarw6A2TvOyov7s4GoDAeqkw4No424AOxlBFsYY2IPkXDLejOtqCQJy4bOxFvmRMsJoziRjxersbT/dEfQlVc/SgqWblunrgkFnbKwLQ5ChuZ5Lov8o5L8WNV0BNr2N38hvQgAXJqQDwu5Cz3qZLdZ6X161UkBZovCqS/SmG4pfEjqgcdDuFuSTC7fl+1ia+B+2HSoiL5MvSlBmDYnrbRdMCYA/FdgHobFdMdq5Ny/bYCgMQiGAwClMYbbJvsHpqOdeZTlJoOX/+dWzrK3tnl/lrEUvVSju3tdJhPXo4CO6aEV+t4xVBvdKU2Usa36Fw1r/E89reMJO4m7zSQYJaHjS1aG8G/mYYubXF/OU3LtbC+MheUAXpe0ibq+0yOdGqATOtjlqzMfFQYSi0W8Bg5xhBZ+KnQlzm7O/Ape1B8Lo2Fi5VYdC4LbRbBq6vbm+HX9qt+Oe6phJZF0BJsWseNOYcN4V89YEEgocYT4CjZf6pGIdamnADMLaVtAIkj9qjG9JZCcDRuq6g+exG2lEO4WcPtW+IijHoCgGTsjWwindcQU/nsfLxcs6wLWIWBXX2ldsoiiudTXvFfhDHtriTzpt7hvkqqpv8E=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(23010399003)(1800799024)(376014)(22082099003)(18002099003)(56012099006)(4143699003)(11063799006)(261028144727099003)(261022105027099003)(10067099003)(261026121527099003)(261009223027099003)(261026140227099003)(260925021911599003)(260925021311599003)(260925022911599003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?b2lrcUQxUjhybDVBUmh0cWRQdytaNHlRWkFJV2tPK3RRcHFpL3p5SGtkV0tU?=
 =?utf-8?B?ZjY0OVNFdVh2dUZLdEJVb3doZXFTbFY3R1gxV1hVcFU5V1oweUZaRWZuVFZt?=
 =?utf-8?B?S1dWelMrNklxbWVMZUlCY096eWtmMGtpeUVkR3FVbHRzNjQwVkVRSCs5Q3NC?=
 =?utf-8?B?U25vaDZEdVBCVndZU2hKWXJjT0hmQTNrUHByVjNHUzM2bGxHVHZKeWpNaG03?=
 =?utf-8?B?WFE0NHpPVksrcU5VM1dOQ0pYL2hvdTVkTG9ja21taVNsRUl3OHgvWmx6aDAx?=
 =?utf-8?B?bWQwcjhHbjM0Z0YvT0hTR2c5R2EzQTZYVVFvR3o1Z1dZVzFIbTl0ek5MZ29N?=
 =?utf-8?B?TjM3VlRwRjQ0TFU0ZmwySkJ6YzBvdDJDV3NqNnFCeEttR2tmQjFHOEFpVEJQ?=
 =?utf-8?B?SHZIUStFZGFYQjRyNWJPaHV4RndhNHJ5MG5wamFLNVZFdjF4VFYxL2d1T1Z6?=
 =?utf-8?B?VWliNFpKUWYraEZyb3FsZFJTc041WGlLMXZaK0NYdkpldS93WHVKbnM0OVFJ?=
 =?utf-8?B?NTVHdkFwT3NlTFQ3d2E0Z3B2YmZpZnFEZDZ6Tlo0MTRiNWI1bFZMQnd0RHk5?=
 =?utf-8?B?OG8ydGZUUkd1WnAySlVocTNld0dibVREYzd5bFNlbTBhTThKTmFsbitIN0RK?=
 =?utf-8?B?anVQQnNUQU11MjdoNjBxc0pKY1JzT2lFeUIvdVpMc0ZSWVlzcm4yZUxLYnlT?=
 =?utf-8?B?VkZCc0hLTGJKVWZ1b0EwTHAzdXZEaVhmclZOV0Z4R0tIMG1pclN2aStUd3ZY?=
 =?utf-8?B?S0hqaDFoSHpWQm9MWndMKzh0THhFZWNvZHJyc2hnaWlsTUdjMzlBZmVYU0pp?=
 =?utf-8?B?MmF3Yi93RWt3NmhBVEc4eFliS3BoMnhERTlkSEFLRlFLeTJIcmR1NXhCVzBw?=
 =?utf-8?B?aDFiQjhRNWFDaHZJbGM5R2hZNVR4bGVHTmVtQWZMV1laVnB2d2w4dUFVU04x?=
 =?utf-8?B?Mk1pM0NtWVlURkM3Y0NNNjN0SXdEMDZFQ2F4cGVCeDhwZXZ6eTd1T05tdXhr?=
 =?utf-8?B?Rnl4UEFRdmpuM1BEQy9VTzZEZ0JESzUvUkpFTCs2SlRzekdYVHdreEcvSXBI?=
 =?utf-8?B?UFNWd0VLMEpTZFR6VUVqbXZ2Nm5PaERzK3puOHZGekYwUHRHM3ZwSllsaGlB?=
 =?utf-8?B?dW5pWG9DYUxmTWZicnBCSTF4ZVJYbnE4V3FuSFVvUVRlUG1nKytiTlJkUEoz?=
 =?utf-8?B?NzRZc1JhTmZBOVVFKzIyemx3UnEvOWN5OHV6MUdXbUZUSldCelBWdGZhL0dY?=
 =?utf-8?B?T2JVemZKaFFJRHdrUFJDbmpCTmUxMTlHSWUxRWZUNzVQbmxoWUtpWXFydXh3?=
 =?utf-8?B?NmM0VllxM241VERlOGNZaDdtMDhTNXI5OGZWS1QyN2lmdUNCOE1NaGhiaXlV?=
 =?utf-8?B?dm9UdVBLekVyOXNqQ1pHbG40MHhBd2t6MThTUE5RRktrbmUxb1VKbG9zQmtQ?=
 =?utf-8?B?VERNMk9KTmpwaWJHU2VGenM2Si9oRmJzTGh2R3RuRzF3NWIzUC9aUGNERlM1?=
 =?utf-8?B?b1B6dUJQVU5KSnMyN0g0ckJMTUFsRGg2ZVh6RkFxT01ybEZMWnlzeUJFaWl4?=
 =?utf-8?B?RjJ1QlVsaXBOaVo4ZTA2WGJIS1lHRXhQNHZka0NZK3JVTXhtVWVoTE9aSGZO?=
 =?utf-8?B?S3A4dEsrRnFTNTVlWXJ6b2RpNTdGbzRqOFFxWHphVDZwVDhMRHVxZ2F3STBa?=
 =?utf-8?B?R2ViWk5kMi9FS1dGMGRkbk96KzR4TkM4VGRWVGhMSXI0UTJHODNxUlZVZ3Y2?=
 =?utf-8?B?MFNWdHhqL0RlM292ZmN3SU1iOWxGeU9BUDFHZEVNWXVubnR3dDVpQVVxOTVQ?=
 =?utf-8?B?UXdYQ0wrZnRlWDVBTHBJNXpER3czWHZPSkR2M3k2UVBmTmNpdmNpVHY3SVFG?=
 =?utf-8?B?Q2F5RWVUTjU3MEJNVDZrZXkwZHdiU2JzN1NjWnNzWDJPYTR4dDd1aGhRQjZn?=
 =?utf-8?B?RENGR0tVTm1LU0RKNHAvMjhMdTlUNzBvQUN3YWdjdW1qdkl2bHFtSHphS2ZV?=
 =?utf-8?B?b3pGVkpqWHB6V2pFSUxId0VVK01EcVQ0ZGFlUG5UTWVSRUE4R1o0UzNubldC?=
 =?utf-8?B?OStwZEcyM1BTTFJ3Z2dhanR0dmtSMFh5ekpiaENtL3luNDRtTFpFNmRNcHRp?=
 =?utf-8?B?dEFSdW9hR0ExSFY0VW1pZmRzTmM3TFhGZ0dTMnJQRHY0N01ZN09MNjNOKzdr?=
 =?utf-8?B?UnJiQnR3VzZZN1IwbWNhYzFpSGJiazMwMU53cXIvYm84U2hyczd1b28vdXF2?=
 =?utf-8?B?MFhVSUFlK0J1VWJMRG9yZkRJRkVheGFLZVBHdXYxbWh0RlBZaXRSaHUxbEtW?=
 =?utf-8?B?NWk4U3RrRzFBS0ZNNjRCMFBQMXY5eXRrVDVxOSs2YkYwbjRENUZNdz09?=
X-Exchange-RoutingPolicyChecked: tI/EuAeUSlCa8+EOkjk/C3Rzz9bzJZVfLrPKuyapZWsFYRHe4V0QTgvOb6K3zFiZ+0ZZniD1pST4VxZd7mYwjV7nGq5igK74iTskz5ZkFY89gviCdf3qoC1ATfMz8hvH77ol+Gse+KKs8iMNy8+WmCS3/cI+b4FcUsW4b/LJS6Ak3gQcBFZfGzdBMXGKVmrZSHOAQcnVY92acyyiFyNCzpmH2tQ9dvNUeFw2zi4anCy925vu04IhPEG+9gEBOuC8bh8C33t/TQfT0VrGGnxmdxj8RNH1dOiKV3M6aJGDsm7jpo5u53kBXSmCZFzD8A1zklt9Y/A2frLasyE2w7W88g==
X-MS-Exchange-CrossTenant-Network-Message-Id: 673e92bb-6f85-4a58-8046-08df3595fdd8
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2026 08:24:03.8795 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X/hcor7haddKnu204s1iWlrhxNkxJq/NjdweFEiEH1JbzXf/ilYqsBAXngVVWgU9wTpmcLemnkOcUtd7k7CQtw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB8200
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
X-Spam-Status: No, score=-7.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Andi

On 28-10-2026 21:45, Andi Shyti wrote:
> Hi Riana,
>
> ...
>
>>   static void hw_error_work(struct work_struct *work)
>>   {
>>   	struct xe_tile *tile = container_of(work, typeof(*tile), hw_error_work.work);
>>   	struct xe_device *xe = tile_to_xe(tile);
>>   
>>   	guard(xe_pm_runtime)(xe);
>> +
>> +	if (xe->info.has_sysctrl && XE_DEVICE_WA(xe, 14028434957)) {
>> +		/* If the device is in reset in AER path, skip processing hardware errors */
>> +		if (xe_device_is_in_reset(xe))
>> +			return;
>> +
>> +		xe_ras_process_errors(xe);
> also here the return value is completely ignored: we need to
> handle the action if we, e.g., receive a
> XE_RAS_RECOVERY_ACTION_RESET.

We are re-using the same function as AER handling as the firmware query 
is common for both.
For non-fatal errors received via irq, we do not expect a reset. 
Handling of reset is not required in
this path. Will add a comment.

Thanks
Riana

>
> Andi
>
>> +		return;
>> +	}
