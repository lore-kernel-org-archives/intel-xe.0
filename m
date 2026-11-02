Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D2A9606A327
	for <intel-xe@archiver.kernel.org>; Mon,  2 Nov 2026 21:12:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=nNN/8u1r
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14FE710E6F3;
	Mon,  2 Nov 2026 21:12:28 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E6B010E6F3
 for <intel-xe@lists.freedesktop.org>; Mon,  2 Nov 2026 21:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1793653942; x=1825189942;
 h=message-id:date:subject:to:references:from:in-reply-to:
 content-transfer-encoding:mime-version;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=nNN/8u1rjqI0JnNBi+ReWs/qkgRckqh8U8E1znCdQClkS4mddZkMgsf0
 7aDfQElgWLhVcN2kxebHrZJ+ATnqrKIC9GbylwULZ+/VJn6B5cnNH4+i5
 ADz/huqlm1l6l3Q7eY2xrGpnEzjZcZLUJ9/jKh3uZWl45zzBc/wDV6XQD
 MCwiqSwE3TXa08cLCiLNlLiSXeDF00MmCMDqUtYxRio73knVHNLyEn/jF
 8RXGCkWTDyV+uPivqedq2Kf48+QlCaTSn/iSTTeyQPCfNAVUFgstqfY/n
 RHIo5hGcgp8bQDOvdbS/KJDNQbMPtFj8U4j9DDJXMJ461ROus/25Uo42r w==;
X-CSE-ConnectionGUID: AYC267KfQ1WbuZbhxRFy9Q==
X-CSE-MsgGUID: h8vQd069TWWc1U3bW5j1QA==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2261641"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2261641"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
 by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:12:21 -0800
X-CSE-ConnectionGUID: VRKl9a1eTlOvt3pLc9yhZg==
X-CSE-MsgGUID: OsWVoi96TmSAH/m1JJc6KQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6067012"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa007.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 02 Nov 2026 13:12:16 -0800
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:15 -0800
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56 via Frontend Transport; Mon, 2 Nov 2026 13:12:15 -0800
Received: from PH8PR06CU001.outbound.protection.outlook.com (40.107.209.20) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.56; Mon, 2 Nov 2026 13:12:14 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Pp5u8zantEv6aeQhfTyRbXdmiYoCexQfoLV4Kki5yX2qlTSZanbZWx/mpG8zpSmbjHZNFoqeNaYVHZpq5KumthZYMArQOiPRdXK9So/bMSPRtNl17bHqB9aXdd5J7CsW3PKLke3X5/srkq3f4Lf/xjDDwGjlG8oquihZPh7Xa7BZVCAIE6crKoUgMG58tf0uH/DdWYngT0FXsJndomCS2ivy0WPdcqZr+Bum9TwjQJHH2eyb2gKsKi7TR7q0iHuaztrv4vdDHGJI3pye/t59ImB+qzW8EXNh/kOTaNG/vWy2iGit6i3yy1ggPNTbI3jmWLMKo298C/2+ueBrJdiimA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oS96iBPTC4VUi3okiyBAxu2kltMZawW7sG3iXowil5c=;
 b=Qg0CUdUvL313aBZZYVMjW++SgpdUV6Tu47S+8kVXFLy4eD+fhnUAiUr3VmRbZuVeryo9CskKH1LFny2063ebZYr0eikv9FRuTv6erqooadw20l5EFpi1kAO0zFNcA+3qMuNbS9LD7sqFYZgZAg+N63uTWbf+5qyoQkMK97F5sfMcPcZmaE9nFMcd1CW9DhePBxsN4wCw/d7qPwOcSJYk8171xgRccNBsEnTBdfB3lwV2BPpPvqlfXdszHMdwRThhHBChbQ0d7hNuvTOVxH7OzGrGeC91zMUijpc7U7cpCJzLJZeYQ9mdtTMoK/jYVo0MGtw8Df1I1rx2ywEqCkt31g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB7821.namprd11.prod.outlook.com (2603:10b6:208:3f0::22)
 by DS0PR11MB7484.namprd11.prod.outlook.com (2603:10b6:8:14c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.569.12; Mon, 2 Nov
 2026 21:12:12 +0000
Received: from IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203]) by IA1PR11MB7821.namprd11.prod.outlook.com
 ([fe80::6518:db96:947d:6203%5]) with mapi id 15.21.0569.011; Mon, 2 Nov 2026
 21:12:12 +0000
Message-ID: <110fa6c2-30ed-4487-a6fd-2d842e5456af@intel.com>
Date: Mon, 2 Nov 2026 13:12:10 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] Revert "topic/xe-for-CI: Define GuC firmware for
 NVL-P"
To: <intel-xe@lists.freedesktop.org>
References: <20261102163840.2231293-6-daniele.ceraolospurio@intel.com>
 <20261102163840.2231293-7-daniele.ceraolospurio@intel.com>
Content-Language: en-US
From: Julia Filipchuk <julia.filipchuk@intel.com>
Organization: Intel
In-Reply-To: <20261102163840.2231293-7-daniele.ceraolospurio@intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MW4PR02CA0023.namprd02.prod.outlook.com
 (2603:10b6:303:16d::16) To IA1PR11MB7821.namprd11.prod.outlook.com
 (2603:10b6:208:3f0::22)
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB7821:EE_|DS0PR11MB7484:EE_
X-MS-Office365-Filtering-Correlation-Id: 280237f3-bc30-4ed5-b9af-08df3925f64e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|23010399003|366016|1800799024|376014|4143699003|11063799006|10067099003|56012099006|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: HVEYW4Ia3X1oR1ZMyDQJQBJTo7UI56EzzPQt+hSzBm/i7Rw9g1yc8dnopOBJ/HKMud3yTlJYJOwyq8Syauv3S9Yo7i/zA2UbK1Y7DYXZJ4ow2xtGuEr5qFDCfh9oVYoBepdia6Q5sBFUgWhW4n4d2GeuabKSb9/Iyv+1uhgq4MRpVoF73/xyVbbdI2JJeTjjXkCIBvsXFyMNW+4XXcts4w3XzEM9ONs7axU+l0JfUjCJ8lRzKjQ4cs3ltmSEdlteGiYapw3IpiKlhiFp7oFiF4s+WZRZery/EMxFN6a3/IuuNzaeyZ5FRTLBmoY7tMNdQwkdI1MDsz0z13JPLojqvgi1EJd7M8diDEAAqmeP8iRJBWk7A2LvL/p97909Q8G7rsNiM2ohYVUAqWV2VeJ8EP8Dnsz/SG/zcCm7CSosGEITTwUnrTxrpwHJALN2fec5DR8LhQic/RAX3ritG0POEw9U9U+NprjbGfG0BF+sko9z3poaotYehmdAVXcjK9QMGF/AfVMWSAfdgB4q2rBNTMWefDk/aXk0aHqtpdkziZXYehIFEYJnOkOYCqeUoY+vlUJGom3zU/ICIUiybOX1UhJhLYGS44XgRVMn53OmSYrXL+fKc7hSomVvJxvNtTqzc2pAXMLe5mrYi3nu1gjgTRBOZpKPf99U9/c1sBXR+Bo=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB7821.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(23010399003)(366016)(1800799024)(376014)(4143699003)(11063799006)(10067099003)(56012099006)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?MUFZdU84bDZ3aFVtMEtiVkFITlI4L1NtTllSUTd0MWE5dFFSVHZ4ZXFBY1cy?=
 =?utf-8?B?SDFXM3grWlRtbm1uNmpKalJISmQwMUptS29DM3VOV1FpMkMrdTRrelBCTnhw?=
 =?utf-8?B?MGEvMmV0RVByb0VuazRpNTUxWmJwdUdueGcrakd1NXNZU2pyQTVlTGdWeWU3?=
 =?utf-8?B?Wmo5N1pwYWJFSWxPVEJTYU9WeEF4WklWMnIzNjVNc3JVTFdEY0tMVGQveVF1?=
 =?utf-8?B?MElRV3F3V2V6SSs3T2dNVUdkYnJoaGRETnA1a2Vjc0dkNlNlQlhTcHpNOVNv?=
 =?utf-8?B?QXdVT2l1SW8wVWQra1dTTFRaaDBQZlN2b2JXNlcvWHExY3NmMGFPaUdwYXZt?=
 =?utf-8?B?VUdoOW91TTFiWWUxZlJ5Y2xMbVJRM2lHaEppdUlsQmdtMVY2d2pjK1dKYjhV?=
 =?utf-8?B?aXVRbUhJREkwLys3N3lsSlVWVG1jWU9PWjg0YnlMRWdZYitXSjBrczdrYmRR?=
 =?utf-8?B?dVhLSmdJRnFCMk01dEFZWVNGMElGQnlEZStmcEVHZW9CQ1VGYnNRd21XWjVz?=
 =?utf-8?B?Mys1S2Uwbkpsa21mZC9LUkRzeEtWaFk2dEFodmYzK3g0c2ltbUs1TVpsQWF5?=
 =?utf-8?B?a3JaNkpLMWRHSnNUbm9QcnhBbjZNVVJZL1p4Vkt4OURGRE5UQmZPc3d0ZG5D?=
 =?utf-8?B?TzRHdW9rWW5UWG1LdUNRM051RXVZbmE1V1dJRDN4Y012MGZvYzYxTzJtWENB?=
 =?utf-8?B?dFdQWiswaGMzY2V5eGhGaUVoMHFEL2VyUHBLQkJLWVVZNTR4U1BFZ1daMyt2?=
 =?utf-8?B?WmZnNzBOdXQraHFIVXp3QzNJZ1BxcEsyTXhVVHhyTkpPdSs4MXJKTnIrekJ0?=
 =?utf-8?B?WDREWCswT09JdDlZRTJEejZ1TTh2VTM3ZjY4SkdJMitlUlVGa0pIeXgwM3hh?=
 =?utf-8?B?UFJvNStrclkrOW5sUFVLb0JLcy8yRDQ0Y2VhVmxDQzMzcjJzeE5vak9DRGlp?=
 =?utf-8?B?ejB1MW5PQmJnc1ViYVVyS1Nra2hlek5yZmNnQlpleWxrVTgzYXNJTFVsaE1Z?=
 =?utf-8?B?K2p6aDYzMHJVVUoyS3FKd2Y2OGdqblhxUXpadGRtTG1xSytFN0VITzNjbFFG?=
 =?utf-8?B?b0lEMUhZb1UzSzcva0VpSXd6c1NNMSt1eXlqbGhRVkxyTWZKT1BSOUNZY2Qz?=
 =?utf-8?B?QVBZVnN6Y2FLemx0bU5CZElqVDdDTEV5SlQ3aWpycTltU1JOdVlycWVFamFv?=
 =?utf-8?B?blJmYXRsQXZlUE93aXRzbklyZUdMN1p6VEVNbEN2S2pIOE5kcVd2ZE1kLzFy?=
 =?utf-8?B?RHAxZm5DZ2FMd2RpU2JHWGFwV29QNjRCaDJSOUoveWhndy9mcGZ2MmtDTFpS?=
 =?utf-8?B?WDVMZmhDR1phcWVyZnh4OEtNTzZWNi9NTmMrb3N4Zm01Z3J6Z0ltNGlobmcw?=
 =?utf-8?B?SXhJbGxjQWhEVk1LcldYcFE1aGZoYUZaY1diUVd1dDJNVXZpa2VZL3UyUVQ3?=
 =?utf-8?B?SU40SVhtZ0orY3BPYlE5Q3BTRUx1Tmlhbkx4T0xwajV4TFdMekhvWkJiNWlW?=
 =?utf-8?B?Y1JWR2RFM2VHTkI0QlZLWmJzYnB3QmVkNlQwZzN6WjRDdHZQdGl0S0ZtdG96?=
 =?utf-8?B?UUJmeFVrY2RhVXN5V2VMVzlKNHBXVGRZejhteThucTB3cnhnK0RFOE5BSk96?=
 =?utf-8?B?TGFmcVNEM1NBM0RqZ0U5cGljcTNlRUh6UlV3WXVIbUdoRVJYZXhpZ2lJNGRi?=
 =?utf-8?B?eHZLeng3eGx4QVRIWWpIZXJTMVBOOWVCTU5YaEVMN1k0NTBMZGovUE5mYWUx?=
 =?utf-8?B?TG1ON3JxL0ZWLzE1Y0JQUkZuUlh0Y3d5L1FIZlZvTWExKzJuRWh0Y1VadWtZ?=
 =?utf-8?B?YTVFTnlUN3llSTZQN0JGU1pONWZ4V2lZRldqbkw1KzN4RmtJcjlVNG1mUTAr?=
 =?utf-8?B?TmxRZTN5N3FBbVZFZURLQzNhOWxyME1WU1VuYkhpQzV0dEliM01RSlZNSTJi?=
 =?utf-8?B?Q0xCMERkc0R6OTdJVncvQzNBd0hsZmE3Q24vMi9OMi9QNXJPbUhaUlRBa0NV?=
 =?utf-8?B?OUVuU2d4UlJDOFFCYTZaT0p6WjNLdjN3QTJ4YSt6dFlnWnFSTi9YTEJuR3Jl?=
 =?utf-8?B?WmVzbGcvSHR3NlJ2MFBZa1AwalZPdjk1dnRJYXhpMzZ6eFkwb0N4bEIzdFVR?=
 =?utf-8?B?SnFYWkNXS1lERzNNcFRyRmpjUXZzMmZ1S3JDbis3azZYeVpMK2pxVWVNOWJp?=
 =?utf-8?B?alEzbWZLeHQ4NnMzdzRRSEZoa2JZYzZKdTFvNkN2eFEvY2pGNitvT0FPOEN6?=
 =?utf-8?B?L2syd0xEck0wemRvYjN5QVIzM2NmRk9hcFNJM2tpLzNaYlNCWVpZcmd4M2R0?=
 =?utf-8?B?L2k2MFI5SWxuNXFMRlQ1eTY2ZTN1V09RWlRtYXhLZHpwMUxCWkUxaDZYUVUy?=
 =?utf-8?Q?MlXtSr6/lEx7VrSw=3D?=
X-Exchange-RoutingPolicyChecked: OHgQpmjxkSVcX/Az8ePcO9v0lsOinBaNopS8jZoZsVK5x8TaM1LmPAKHwX7vsmkRc/U+4anGGGXF/ROzMehsvQHCdO4rigi7OjQoqBsI/k7EChmNWvkI5MP+BJLqtDgAYZBrh49Hlue/845UUGvs8u8hiqQH7NhFjJZFi4zYtDGai+PPERv8HGmws0R8s6ArpzM3wf3H4uED+u+XX/qO05GUeg3btKruA0GL/EiPzBMc3b+8s1IjwY0a2TyPUJTUXvAVJ1KOxIivgOkvGKtoGFoBv9lBGhvLD6KnKshTA8fgoLkFY3m79p4H8dAsWDOViW9p+tWvBLzRkd+jErjebA==
X-MS-Exchange-CrossTenant-Network-Message-Id: 280237f3-bc30-4ed5-b9af-08df3925f64e
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB7821.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2026 21:12:12.0812 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dBuWEu6KrDsxg1PI09hkJ/w0bgMVSVb15SI2x6n7a00fh/BRsCmMGpKRbKAmaDbM+cbkyVVxlPLx3710HlsrFbaqzhcikqXfsrmgR6c0fIA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR11MB7484
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
X-Spam-Status: No, score=-12.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Acked-by: Julia Filipchuk <julia.filipchuk@intel.com>

