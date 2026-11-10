Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B37F4606A336
	for <intel-xe@archiver.kernel.org>; Tue, 10 Nov 2026 15:12:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=LACPs7uD
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E73410E14A;
	Tue, 10 Nov 2026 15:12:30 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF95B10E14A
 for <intel-xe@lists.freedesktop.org>; Tue, 10 Nov 2026 15:12:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1794323545; x=1825859545;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=oeilUtDpZ1tqiyGCJneZERfKzfABp7LApOj2vJCkqsk=;
 b=LACPs7uDNgDV0wHBnkhf9nGlFNzTyqJCTb30peubF7gSfQvYEBV5fCkK
 IP8WgXIksrDBQGrnXZ9XYlGTJ9ugQNsyiQ/LiVYPGtYHO5MRVUo/0jmUM
 jmj+PNNZNHS+g7xPVBBwJ1On0beG3/W0qoKSGbnzkphnj41AUstgtGlZf
 NEc2bF11hLy/6LdOUoOsscgdrojFT3q0u6w9miso5fk1HrJDr6z2o5QyU
 Qmh9HUeQTIpbSIoGzdhupL90kzDPLzLIgR2FHtoAZDkfrlMExtnCTN9g/
 OmIsDcS67jWlyY6YetKpTvLR/4pj3aTs+deATSs43QBsFWkTt4+t4mDsG w==;
X-CSE-ConnectionGUID: tMnDiXTnS8CtXzbIh5bKLg==
X-CSE-MsgGUID: Ig1XFqEaSUCPFDh2qX4XDQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11962"; a="2960828"
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; 
   d="scan'208";a="2960828"
Received: from fmviesa013.fm.intel.com ([10.60.135.153])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:12:25 -0800
X-CSE-ConnectionGUID: Kr0y8qPPSD6i8GnxfmVyjg==
X-CSE-MsgGUID: DI1HROlaQya5UZvL+LsdVQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,206,1787036400"; d="scan'208";a="10048906"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa013.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2026 07:12:24 -0800
Received: from FMSMSX901.amr.corp.intel.com (10.18.126.90) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:12:24 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Tue, 10 Nov 2026 07:12:24 -0800
Received: from CY7PR03CU001.outbound.protection.outlook.com (40.93.198.19) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Tue, 10 Nov 2026 07:12:23 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OadlPZHA6+smT4DVhY4hLEBZxcnH9kOpW2cF7hTbYFpyi/tT5A/F7MXe8uz/tLlB1FEKR4tFlQSK8MW6t2h0BOX4ZioWdTQD6COwOpnzV71Rqz92cHxxP0s91Xgya1Af4uyk38jyIIfBPy6+fAHFVRYyouSm5DQg3Hni3cNrHttGU/7CBxfpdcRUrSYLtOUBDp58CdglERvINnddYZpQhYm3yd5e/zqNKfr2YjMM1PxHAH5f01bQifxuC1xmOfvk0qiP7IMwRWmjG4xgnInFQk/i3gBJ4+sh9rTYBHcX5tFEIpf6ySYVAKBfBEBOs7KSDM/2Chnh3y/UDl5spaNAFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ylpngwxnNsqfZdHGVrs0NdDFxWvJPMAC7ns9CoImmcc=;
 b=oXBiJW9sploIDmyyZuGx6Vr94QtHCAj+eXmeLRFplfCA27fbbH+TOlCU3y+i1edi97orix32Fqk0m4WKA+q+uULsdRBXMk8WNsJ8sW0f/u5XjhdKN75qRx/LJsD79o1XU7l12zx5MFy2izoHoQpPL8DCt6CTxjqbj1rwT12dVwvcJIQPaluI4jCgKORFeDh7lURwDLpcAyKBHLVc79PzGQG1eu4H7qs8uSOfovB1kvzHWFbrbnf4xuCF7IiqPTWDnMyNtyh7o2yON6EMWrYXqgmY+VNDiOqdFiXUJNnrpyBgmwOEq19FJ/dvwbL5veLFS6/EP6hlvi90ZVM9BGLyGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from LV0PR11MB9792.namprd11.prod.outlook.com (2603:10b6:408:385::5)
 by CH9PR11MB9904.namprd11.prod.outlook.com (2603:10b6:610:343::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.615.8; Tue, 10 Nov
 2026 15:12:21 +0000
Received: from LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8]) by LV0PR11MB9792.namprd11.prod.outlook.com
 ([fe80::1b1f:d9a8:ce76:e9d8%5]) with mapi id 15.21.0615.007; Tue, 10 Nov 2026
 15:12:21 +0000
Message-ID: <08229e79-3a43-413a-95ee-c0baf3838045@intel.com>
Date: Tue, 10 Nov 2026 20:42:11 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 3/6] drm/xe/cper: Emit software CPER records
To: Mallesh Koujalagi <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>, <rodrigo.vivi@intel.com>,
 <matthew.brost@intel.com>, Aravind Iddamsetty <aravind.iddamsetty@intel.com>
CC: <anshuman.gupta@intel.com>, <vinay.belgaumkar@intel.com>,
 <riana.tauro@intel.com>, <karthik.poosa@intel.com>, <sk.anirban@intel.com>,
 <raag.jadav@intel.com>, <jani.nikula@linux.intel.com>
References: <20261105085348.1467925-8-mallesh.koujalagi@intel.com>
 <20261105085348.1467925-11-mallesh.koujalagi@intel.com>
Content-Language: en-US
From: "Nilawar, Badal" <badal.nilawar@intel.com>
In-Reply-To: <20261105085348.1467925-11-mallesh.koujalagi@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA5P287CA0157.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:1ba::15) To LV0PR11MB9792.namprd11.prod.outlook.com
 (2603:10b6:408:385::5)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV0PR11MB9792:EE_|CH9PR11MB9904:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d374ab-68ec-4624-d524-08df3f3d04ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|23010399003|376014|22082099003|18002099003|6133799003|10067099003|3023799007|4143699003|11063799006|261028144727099003|261009223027099003|261102123227099003|261026140227099003|261022105027099003|261022113327099003|261021121427099003|261026121527099003|56012099006;
X-Microsoft-Antispam-Message-Info: 6K8LvUWOd5AY6qEKl2H1p4K21UQ0qAlIObr/7qFLON32y8emy9Xe0+76ZnVx/HhDbvI83JJal+3NrLKofzRLcJi4zjK57/ALV4zoEFppBpiWXn07U4Hp558NPKOD5XMJNB+gs2T3cGcYx85sXhAe50YvPRxeLAZvaXQwkjlcuNo2TThqEDYJ0hHG/elFMKS6g8a2iJpyFQfqkzGFsmOZFgMBsHz7dmVsqESlNOQ/8FOppNt6wycym60Gf5lVtF2TXa8UNYGKbF8zn764RScDp3APG8l0/O0cIfDbXjg7oUtzDiwW9WStpylgnVaSBLuBzZdngnLOYITUqEFxadokmPmALChtrJ3r37qVa69+3+Su7CD8JnSJ5am50sp7NTviBPCtSKSA3zpOr+vnfk8DqmK5z0ZheANp0rT6/+iUE+ON0onLHu5Bwze/B1nsPv4b5XzZCulB7+u53UEoq05g3Zoj+n2UC1QXK1iFrLNaEreDyI72FV76mpwYXRsxYLgLNu+0uKXdDf0aHwUALy8t6YVJJtzu6lVtjCi9EmUAvk780Ol8+PyOQw72lb/1Yc2YS1pVvDRqy0eJX1DJeptU59i/lXVnyAuM2e63s4P1jVFz9pxWrHr4WvdMUBi1zmlDNa6nCu6a6GGUQExan02QOW1FQcL2LoDImitwrkZe/og=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV0PR11MB9792.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(23010399003)(376014)(22082099003)(18002099003)(6133799003)(10067099003)(3023799007)(4143699003)(11063799006)(261028144727099003)(261009223027099003)(261102123227099003)(261026140227099003)(261022105027099003)(261022113327099003)(261021121427099003)(261026121527099003)(56012099006);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2ZxbjhWZjNlM0I2LzBUMlVjSmlpK3c4UmNtdVNGUmg5cW1sTktSN0VEZGhX?=
 =?utf-8?B?ZEtWc3NaOVJiekVWN1Iwb0FhTnkzcHRGL29GT05nZ0hKU0xSbGxLd0RqVUMz?=
 =?utf-8?B?Y0hSMStod3QrS3N1VmF3MXByNFVJRzBseTRGOUZ1d3hwaDgvS2FER296RnV2?=
 =?utf-8?B?Y0xXYi9VOFBhYjFqdVhUUGF3K0ltTkJwMmhjYVlpUzA1dVhzUG91TSszSERs?=
 =?utf-8?B?NzZCNUtod0Y4WkdCaUcyd3NHYUliTGtGYzJOaEN3QVBXMFhtbnJxeE0zUS9m?=
 =?utf-8?B?TnJVbDNjc1FaRFRKTC80WHRCN0lNNjdRS0Z2WTZuTWJvS3hEdStrdmN3eTMx?=
 =?utf-8?B?WU1VSlJZSldNVUJOaEJBL212WjArU3ZVK2ZucWI5eHBqY0FZa3J2bks4U2Vj?=
 =?utf-8?B?SUQ2Uy85akdRd1NTSW11ai9TbU5KcWJVRWtnc3Boalo5bFY4REloR1QxL2Jk?=
 =?utf-8?B?bVdPUXlFVmNIZStWcHY0d2FNa3k3Y1prQ0VQa0tYa1NZTEREOVpIM0VRV2gy?=
 =?utf-8?B?QmVJYWtIRWVHelFUV255Z1pnV0dRQXFzUHlvVGU2UmhWN0tNWVZOM1FJMWs2?=
 =?utf-8?B?NmpFRDJDa25WUG9pcnlYRGVucldZOGtsTGVHQlZpZkM4SUVPNHpRaitMMEk4?=
 =?utf-8?B?ZWczeWVFb24yV3VNR1pQSGZ0OU9zR3NPTHZaNTNwWU50ZkZIQnU0ZXBaSDgw?=
 =?utf-8?B?RnRESXFkdlpTV2R5MThqMzNTWnlUMTBnemEvSWtIWDFIZkxBQkQ0cWpzU0NS?=
 =?utf-8?B?aGZPTjhwSjV2djhCTTA4L2x1bXFhbVQ1NnBiaEVBNlVmMDVuNjBtREEzNlR6?=
 =?utf-8?B?bjluQWluakY3S1lEQXJGbyttRXNSYnBCRHRDS2Z3Ym53bkI1RGU2UHZpMkFZ?=
 =?utf-8?B?d2JER1Q1SEhPNVVaK2Y5ZTE3ampqOWVDSjlsR2ZjRWcwTmdGbTZSOStRWVl1?=
 =?utf-8?B?ODQzUDAyVFF4NnRtTHdreXJrWFFId0JRNmFEcStaY1Z5alVGbXhzcUhzQUli?=
 =?utf-8?B?eTZnaWw0VGpMVlE1aFN2MjNnWkFSOG5ETUNOTjVVNlZUQXV6RTh1amdjSmor?=
 =?utf-8?B?R05tU0U2OVRpK0ZIRjZPQ0ZneFp5U0N1enBRN3ZsM01INUkwdUZxd3hZaWpS?=
 =?utf-8?B?aDhTNzFReSthelhFQnd5dXRxNndCcWM2Rk1uRTNKV2pLSThWNjMvNU1vSkYy?=
 =?utf-8?B?M2pTZUs4bjEzNC9BWkhzeWtDMWxLcnFWL1BsZ1pFaWFQNElEOTMvZU5ZdHpw?=
 =?utf-8?B?d2dFSkdtR0NXRWY5OHkxTEtwZ3VsOEcxRS96VHdmaGNudlBnaWJiL3pCLy90?=
 =?utf-8?B?VjEzdUxhOTNCSXlzOXNIOWlCbWdIaS9LZHBBRnZlR1hKcHYrUklqd2FNdFli?=
 =?utf-8?B?dFIxTUN0Z0wrSUFzT1lKaWdicUFlM25UNU1IMjJUdWhZRlRPZ29tTk5PdUs1?=
 =?utf-8?B?R3QxRk9WbEE5NzFMTlBBTTExM0JZL1RvWk50Nm0rNFg0NEk3Wk9rTE1XWEw1?=
 =?utf-8?B?ZC9heEl6K2c0YU9YRlRJS2Q2cXhYck42clY2T0dHaS9xYkx5akRsaTc4VWh5?=
 =?utf-8?B?VW1xVFZjaC9xZ09TMy9QU2llTXZna1NLOFNOaGZsQU9MZzBOZVMyVWt4Y0I0?=
 =?utf-8?B?dDBqVUdlOGl5VjBralN0N3BkWWdMR1huQ2JTdTdNM1JiTE5IZEFUakVXTjJw?=
 =?utf-8?B?WXZLdXAxSjIwREo2TjY4clNxQ3BiaGkreThHcUJTN09aK0ZNdWtzYWdydVdK?=
 =?utf-8?B?dXhYMElxbTZtTHJWczBVWkZLbU5UYXovWmlTckJPaHRsOTRqOW5UUjROeENa?=
 =?utf-8?B?NTE3UjM4bTBienhLVndHeWxHdC9iYXhyaCt5b0JiN0IzNHFJTER4ZEFTZGFU?=
 =?utf-8?B?dHFocWlRcTlVVWhSdFlIMGt6NnJGUzVGczliWkl4SmEyVVMzYkFzcnpCRnNW?=
 =?utf-8?B?ZVltMFdiZkRtdWNpd3hCSkdLTTFoVTIzWlVObklUQ1FPbW0wUEhjRW9GUkNu?=
 =?utf-8?B?Q3hqVEh2dHB0QXVna3ZDRmYydDdHTXBteXJjN2lZaHl4NUZVbGRMTUZnRlNN?=
 =?utf-8?B?bytkc0dRSllua1BoY0Ira01LNlZqenFpdjQ0U1pucWJnVlp5VE1ER3RtOU5K?=
 =?utf-8?B?TkU0ZDVBRW5MQWdtakJ3RXMweTAyK3dMWFZ2UXFqTjF6Tm5tRDMvNlRXcHNR?=
 =?utf-8?B?SmhiQndmdHg4RVpYdUY4SVhTRlNvZHlHNzZwV1hUSUFSczN3MEY2aDRxTWZm?=
 =?utf-8?B?T2Z4RFk5YkFLdXN3eEtmcVRpWUk2eWlHVGN6RFYzOHgxV0tJalBEeERuK1NI?=
 =?utf-8?B?R1psMFdiek5iNDFjSUlXN0lkenRNUVpwUlpGVHQ2MHdQUTZlNlRoUT09?=
X-Exchange-RoutingPolicyChecked: oQzPJKbiZg0GW1l808m2FxHfEkfOiO71zUQ74yEXViprlyMnrPpYhBhgPFjQoKPRvgRU+fITTnhfpTPLCzbgcGVvbhF3R0kZx5ssm9qhIroLlNqVnX9zeT7k9XXwmRkGK2AiJ7/rh8r2dGaDo64xI1EDy0OR2J44lYqcbS0ufxd7nUn75OLgqOXCKqOvW3F37BCvKbjJ5siVAwm/VKIcAZ/D8A12ogIsTJSyQnDhjmB9uOInFN5EnQHNBufoAvmQnC0FQmV2vbvAM63zsdNC2i7n2zzR+UadmV1yQYc0gBsV3Hg984vPk9qhysVgTZD2yHC/GjSr/eJjaa/Bo8F8EQ==
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d374ab-68ec-4624-d524-08df3f3d04ba
X-MS-Exchange-CrossTenant-AuthSource: LV0PR11MB9792.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2026 15:12:21.5805 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PsBGn5oW2MxlN4C2jeSRc27MMqoPepjBfQ9s7IqB/XXEWZtkIBNXaaS11aVoDmxpBueklY4dMSc/pkGo7c6/xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH9PR11MB9904
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


On 05-11-2026 14:23, Mallesh Koujalagi wrote:
> Emit CPER records for software SIGIDs and attach the
> formatted log message as record data.
>
> Cc: Badal Nilawar <badal.nilawar@intel.com>
> Signed-off-by: Mallesh Koujalagi <mallesh.koujalagi@intel.com>
> ---
>   drivers/gpu/drm/xe/xe_cper.c       | 12 ++++++++++++
>   drivers/gpu/drm/xe/xe_cper_types.h |  4 ++++
>   2 files changed, 16 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/xe_cper.c b/drivers/gpu/drm/xe/xe_cper.c
> index 10aa10bbf282..9510dcd1754c 100644
> --- a/drivers/gpu/drm/xe/xe_cper.c
> +++ b/drivers/gpu/drm/xe/xe_cper.c
> @@ -248,6 +248,13 @@ static void cper_emit_hw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	xe_cper_emit_counter(xe, cper_sev, sigid, counter, &response);
>   }
>   
> +#define XE_CPER_SW_MSG_MAX	256
> +
> +static size_t cper_format_sw_msg(struct va_format *vaf, char *buf, size_t size)
> +{
> +	return scnprintf(buf, size, "%pV", vaf) + 1;
> +}
> +
>   static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid sigid,
>   			     u32 component, u32 location, const void *data,
>   			     struct va_format *vaf)
> @@ -256,6 +263,8 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	struct xe_cper_intel_hdr ihdr = {};
>   	struct xe_cper_driver_error_class *driver = &error_class.driver;
>   	u64 timestamp = ktime_get_boottime_ns();
> +	char msg[XE_CPER_SW_MSG_MAX];
> +	size_t msg_len;
>   
>   	driver->error_type = cper_sev;
>   	driver->error_component = component;
> @@ -263,7 +272,10 @@ static void cper_emit_sw_err(struct xe_device *xe, int cper_sev, enum xe_sigid s
>   	if (IS_ERR(data))
>   		driver->cause = -PTR_ERR(data);
>   
> +	msg_len = cper_format_sw_msg(vaf, msg, sizeof(msg));
> +
>   	cper_init_intel_hdr(xe, &error_class, timestamp, sigid, 1, &ihdr);
> +	cper_record_emit(xe, cper_sev, &INTEL_CPER_NOTIFY_DRV_ERROR, &ihdr, msg, msg_len);

xe_cper_driver_error_class already contains the necessary information. 
Why does <msg> need to be passed to CPER record?

Thanks,
Badal

>   }
>   
>   /**
> diff --git a/drivers/gpu/drm/xe/xe_cper_types.h b/drivers/gpu/drm/xe/xe_cper_types.h
> index d8581992dc45..268995a537c4 100644
> --- a/drivers/gpu/drm/xe/xe_cper_types.h
> +++ b/drivers/gpu/drm/xe/xe_cper_types.h
> @@ -40,6 +40,10 @@
>   	GUID_INIT(0x4ae12aef, 0x8745, 0x5fc7, \
>   		  0xb9, 0x96, 0x71, 0xee, 0xbb, 0x51, 0xf2, 0x23)
>   
> +#define INTEL_CPER_NOTIFY_DRV_ERROR \
> +	GUID_INIT(0xcef7e934, 0x51e7, 0x535f, \
> +		  0xa6, 0x78, 0x5a, 0x4c, 0xcc, 0xb6, 0x96, 0x09)
> +
>   /* Section Types */
>   #define INTEL_CPER_SECTION_ACCEL_GENERIC \
>   	GUID_INIT(0xea9d8f84, 0x4258, 0x5227, \
