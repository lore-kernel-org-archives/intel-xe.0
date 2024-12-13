Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3364E77180
	for <intel-xe@archiver.kernel.org>; Fri, 13 Dec 2024 17:39:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B99110F0B7;
	Fri, 13 Dec 2024 17:39:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="lemcy2OW";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7650910F0B7
 for <intel-xe@lists.freedesktop.org>; Fri, 13 Dec 2024 17:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1734111553; x=1765647553;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=xg6arUcxkuiiCXWKIr7Tq0uMXrGdcBDURt+KJRpns+U=;
 b=lemcy2OW7jB/dk5izAu9tIgnV6dcRmdVxpuQghVx5gLgZ+I/rfZKkvMF
 c/PcxKJQUFK1Fkdl3AFWEwxUKUBUNJEg+zM8V8VmbqbiafsnrjvqdNd7b
 o5TanKLKr4B+HSC7zQJV7bj7OJ35R2tl8XE9dbhYghhjixSHjScqdzaG+
 jBqKAer1oFk3/m/iDrzjDNjiDBZydYQPX2ihepxZ6bu2jM1cIkNgltsjz
 wlVpn+xnnKAot5RbRy8R3NwF06XBeWm0zEyMfwt2MPZD8pKCuL5M4IC+G
 GT0prMEeVlMw0QLbW1ZG2nNxj036j4yJBO8O+og8+y8VzN+8evifRSooI w==;
X-CSE-ConnectionGUID: ZmAiXGHXTwWQzSXrYHsZ8g==
X-CSE-MsgGUID: kE3CU25fTBy8ok0fh52dTw==
X-IronPort-AV: E=McAfee;i="6700,10204,11285"; a="34473863"
X-IronPort-AV: E=Sophos;i="6.12,231,1728975600"; d="scan'208";a="34473863"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Dec 2024 09:39:11 -0800
X-CSE-ConnectionGUID: /uOo9GARTJmGareDbQCsnA==
X-CSE-MsgGUID: EV5ipc6RS9C4BL4UCH57uw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,224,1728975600"; d="scan'208";a="127595017"
Received: from orsmsx601.amr.corp.intel.com ([10.22.229.14])
 by fmviesa001.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Dec 2024 09:39:11 -0800
Received: from orsmsx601.amr.corp.intel.com (10.22.229.14) by
 ORSMSX601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44; Fri, 13 Dec 2024 09:39:10 -0800
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx601.amr.corp.intel.com (10.22.229.14) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.44 via Frontend Transport; Fri, 13 Dec 2024 09:39:10 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.46) by
 edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Fri, 13 Dec 2024 09:39:09 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MD9QX909ZCp7DIO47kHm3PWyJKZAbNzITdbMjvSRBnmrMycd5CTw82yUcg+N+5cHyeIWnEyR8u3CQqTr5HALyIvAssphZyPuWbgNqrHTQNGEBH+71GfbFwZ5ipLhi29XpiqntJeY5HcC4vzkX8zog8ldIrCpKYWSJ+Fmc2yJsWwFEIewyIOHner6KlqDJSmMzDrIHys0OoR1QfOE/lyIlmy//TyasS2OMd/+hj2rtsmQ25dCUWCjQ3iFQds+94rD3lglDvHEgmQD2V8GWJycIvJXJYnpTSQlUBYSkLlN9N/Q1iAeqZQeEpYL4gDT5ztqTF4K3dDlC/39tALgM+0jJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VCOZrg+9LGmtOnMeDtokIuvTAGjKrZbOPv1gOaBR82o=;
 b=bdtOkrndlubzYFSsa4n1T4ayiRsZH1qy46h/Hpv8Ef+lI1lV6PXXsudZszMyxL650t135qkTWLqVuBG0tomzQewoRp14Uo12pAzISoL26DU5KdsGr5Uk5FPAOsYPTK9UuDMOrbP+ZQ+8ihlaHjrNEJaQzl2IJ3RvMXfQY0tKzPRWldOcGlED+mhbYdO152xH3foxCvb6WCJdPQjIXZEUE00oUX1bTQUpTBCzVbO6oeDcHLPYIUFGanjAjlnUqC67dIhFaHS46wwp55et+ShgRm2btdLJIVwvCxF1aBYNo2tHuQ+EmHZsMOpbJR3OWooyQLyjqWRM76sKeCJf2j8DcA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CH3PR11MB8441.namprd11.prod.outlook.com (2603:10b6:610:1bc::12)
 by CY8PR11MB7107.namprd11.prod.outlook.com (2603:10b6:930:51::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8207.18; Fri, 13 Dec
 2024 17:38:26 +0000
Received: from CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550]) by CH3PR11MB8441.namprd11.prod.outlook.com
 ([fe80::bc66:f083:da56:8550%4]) with mapi id 15.20.8251.008; Fri, 13 Dec 2024
 17:38:26 +0000
Message-ID: <1b38e47f-15a7-4267-8b3d-0ffa9219710e@intel.com>
Date: Fri, 13 Dec 2024 09:38:23 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Revert "drm/xe/devcoredump: Add ASCII85 dump helper
 function"
To: "Souza, Jose" <jose.souza@intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Vivi, 
 Rodrigo" <rodrigo.vivi@intel.com>, "Filipchuk, Julia"
 <julia.filipchuk@intel.com>, "thomas.hellstrom@linux.intel.com"
 <thomas.hellstrom@linux.intel.com>
References: <20241213141252.1488109-1-rodrigo.vivi@intel.com>
 <t6j573cbepbjwiclv5ulewcapwqyf7np4bvdut6gjario6wmeq@sk3cxg6mnos7>
 <a49a74a0b2ac363691f26dddde60aae60461ccbb.camel@intel.com>
 <7cd068ff3630f40e31cd4d971ad794986b017ab5.camel@intel.com>
 <26263eveox7cc3dqfqezodcunjamqgd7wrotzwmbci2o2ia42v@kkc3kpaizsef>
 <11116b4e7978ad7b5dc91d25c1d0232c809912c6.camel@intel.com>
 <w6zmdulew6aqkrkmjme7bdjp6jkllhswpazppd3t5gqnpysg4j@alphmd6gcxcr>
 <74c5a108-c5aa-49e3-b841-ff7ca838fae0@intel.com>
 <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
Content-Language: en-GB
From: John Harrison <john.c.harrison@intel.com>
In-Reply-To: <29a8ead7e28a72f7d9498d1701932836d7c14981.camel@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MW4PR03CA0012.namprd03.prod.outlook.com
 (2603:10b6:303:8f::17) To CH3PR11MB8441.namprd11.prod.outlook.com
 (2603:10b6:610:1bc::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR11MB8441:EE_|CY8PR11MB7107:EE_
X-MS-Office365-Filtering-Correlation-Id: 62a74fb1-6a17-4fdf-a0ef-08dd1b9cf2bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MzlMSldZUnRnNmFBVE9wcnVBNE1QNVF3c2s0S2NGNjRlUWRSZ3VMaStUWDV2?=
 =?utf-8?B?NnZqSG9aNzJabStRWTlRT1NJemsrUWh1dzNIMmpNU3ZQY2tOM3krNE5Qa01p?=
 =?utf-8?B?Nmc5WUQ1cHBCeHBpakpGVFJzYzhIVkhuaVBwMXJXc2oraFZGY0tUNGlDMTNz?=
 =?utf-8?B?ZCtTeXZhUklrM0orTHdsN0wzR3Jxbld5b3dma3h6cklaaGVTdFhXWWZUK09w?=
 =?utf-8?B?VHpWRFZqL2lQUmhlMTZSOXpRSUFDZVRDRC9YSThtU0JKbzRxcFhWeVVzUFpq?=
 =?utf-8?B?cmJPUFAwZlpvVkE4MXlEOHV3UEN5SFRncStLYU1vOUFRRDNUSE1MQ0dTK3Vu?=
 =?utf-8?B?UkMxVDRJN0s2Z1F0NmxsL0hIRURWb0J6RElXWHg1b0dVU0RkamM0UGl5UHZo?=
 =?utf-8?B?U2Q3cnkrL3VmbnFjQXByY3IzTTFaVFhIZnBycC9ncnhiV2hFVnl0YWowZWhV?=
 =?utf-8?B?ZVNYY29aMkxYODg4NTBiYUpCSnpIbUN3UXhrdkJDL245d0JMWU5VSGVjRkd3?=
 =?utf-8?B?dUR2Wm1IYno5YVpPWVZjL1ZTM1dnRHprQjFXS2o4VFIvVktCalVKOENPL0ZM?=
 =?utf-8?B?N3o4dnBiTVhoelJ6cm14TVBQa2xPNEFaM3RDYzdHQUVWTFhVNkx5VThJdW01?=
 =?utf-8?B?YWxKY1JmaXRydmJPNmZyek9INkhYanp4b1VYR1ZHUjB1N0ZvcnpHcVNzVm1J?=
 =?utf-8?B?WGFUZlZ4anR3b3lqeTZuNmFMU0QxbG1JQUdMQXVqamt5MjAwNDVjL3BaOEZX?=
 =?utf-8?B?cGZrNk1zN290ZDh1UlFTL1hpNUNSR2h4YXVseVpuV2V2MWg2ZzMralJsbEt3?=
 =?utf-8?B?OW9WSlMrTzkwSCtOb0pkdDQ3NTVKNHorK0xpbm9CMys3aVlGd0tsMnpucUt5?=
 =?utf-8?B?MmpEcmVBZUp6MXljdDlIZlcvdldvaFBKVXJLVHJrSUtLem5KbHJzTjVpWWtV?=
 =?utf-8?B?bVZ1TUFoMEx6alYyS2VZUEVQR2IrNUlWeG01ZmRMdjlLcFpPZVlRMjYybUdI?=
 =?utf-8?B?Yk8yYVU0dFdPWGljUUpFT1FEMUtkZExhWFErR1o4eVZMZXJVQS9kL21EVGpB?=
 =?utf-8?B?MzZodkUxOG1UTjExMWJia1l1RGlyWHdOOUw4VHcvME9ZenVaSGp4ZlRNb0ZC?=
 =?utf-8?B?OVN1Y3BCM2xrTHlMSkhDdWpWbmVSWTJQNVgvdzdKRWpnWG8yTGJuTyt0eDdU?=
 =?utf-8?B?UW5HNnA4SXpjU3RSdk5WQVgzSDdlbmNjN3Z3K3JYMlpFMTIzMnNSN1JZUGtx?=
 =?utf-8?B?ZHBzUTQzRGdSR1puT3BpdkxUYXc1Z2hqbE9SWk4xQXZuNmRBQm85Sjc0bXFE?=
 =?utf-8?B?a2RaNS8vYmFwS3puMUhqSzdSRkxyY2J6eFl0VHdXMlVXSkxJRGpDOWx1ZnJx?=
 =?utf-8?B?bTZhc3doK1h5R29nRHBXOUVvZFhGTlB2MXJ5MmRuajFkMDh2dzZ6U3IyV00v?=
 =?utf-8?B?bkVKN3NrUCtrbGNqakUwOWU2OVR6ZGdlWTBjSW1QdForNjhTbVgrTnJtVlNz?=
 =?utf-8?B?eGxRUGZlTUdpUFpKTUw1MUtWU05qa1R3V0s2MGxRdlg2RE1DLzJyeWhaQmFv?=
 =?utf-8?B?T29BYlN2SXkxOHdMMUkwd3RDMmFWU1BtNmxTTVo0THo4c3N3WndDUlIweEF1?=
 =?utf-8?B?V2pVYU9oSzhGd2RVZElPdllmM0ZJbXZSWmE1SjY0c1hxSmxpTStRUkphd05r?=
 =?utf-8?B?REhWUDlzUnlMSlpTckU2dWZhSTBIWDY5U2tacDhMQ3BjdHdFMU96V3A2cktD?=
 =?utf-8?B?cUJ5Qy9xbjdhcXN5MVc0RXFwemVLVkhoMmwzaHRBR0dSM3grTUE5RmRpZ3BJ?=
 =?utf-8?B?cEdmaUVONk02RkFxQ2l1dz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR11MB8441.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?RHhqdXJFU2RuR1dqdFRiT1grTmpRK0ZkZW1sU3M4Q2Q3RjBMQjBhaDZkalRC?=
 =?utf-8?B?MFF3WVhaa1RVUVd3UWNGU0NHVDZsRUp0M0VXK3prQk82bzRyK0h6QTk5ekRq?=
 =?utf-8?B?YlZueHhmclBVWnJTeVA2VEtWWXFmeHlWOURLbTNqTHdIM0dEVEY3Znk1OGlu?=
 =?utf-8?B?TlpWai9WNXd4ZC9BTkpaaHFCejNxQlJ5K2tIelNOSnRzNHNUQ3owblZsdGhs?=
 =?utf-8?B?UjIreVYwTFdHOEt0M0haUFBWOXJtL2p2TEhzQk1JZldhVy9uelgzVWx1NGpX?=
 =?utf-8?B?R2J2czEvd2tTUm1OVE55Rk5IRm96b0FCdjhHeWhIZWJsYkFyazZidkxHdFN4?=
 =?utf-8?B?Zlk3WjQ5c1AwZGlTWWRvc3VLV3JQd0xLRHA4VEc0clBRMndHLzJpTEtKOS90?=
 =?utf-8?B?V2xzUS9QYzcxQytOZ0FwRUI4NUxXUzZZQWIwTG4xczZoeWF5SlVZaXF5TTln?=
 =?utf-8?B?NmlTeVljWFh5VVVlMk94S0VtMkVib0VPMWxnWGJKMlA4N2NrbWhnaUtTaXB4?=
 =?utf-8?B?a0h4WWx4b3JOWnB6cFdFN0dFcjVRYitnMjF2SDZ3UXBKWnJaZHZiak1PYkEy?=
 =?utf-8?B?MzFEWS9nTWdPYjM4WURXZHcrOE5BZlV5NnhWRm5kQ1IzbWhzOVBuRUtySndY?=
 =?utf-8?B?K3lGYjdiZ3dEOHIyVXV3NjVoTjVSL2xsRUZJd2NLZVVReW1seE83a2dXSXlK?=
 =?utf-8?B?UGZ1RWVLb3RPYzkrWmdxWGIxOERVam51UUtiL05SaGRZS2ZXRUdlZ2g0ajFJ?=
 =?utf-8?B?TTZ3TysrQUdGM2xOMFRqSE9rVzhJZUllT1ZENVFpaS9RNHpQRXNBWUlEa3ZT?=
 =?utf-8?B?WlljeG5QUWNySWx5MUNBUC9HMjM3U2liYzF4cVpXbUF0aG9OY2w5OXY0Y1F4?=
 =?utf-8?B?cEY3Z1FTd2lxQldLc2d3UnU1V1g2OGNCN1lFd3RaOGIwVCtqM3NnRVB0QjBP?=
 =?utf-8?B?MHRSQk9CS0lSYjh5VUYxbXNXYlExMEVzeldqUlc0ZHRaWVpjbHhDOXdyNENH?=
 =?utf-8?B?S2dPVFJCcVF1TklxRXdxbU9HcmNlOHN2c012dnpURnNhbllHaXV4VENjUUVl?=
 =?utf-8?B?RVJDdDJob09KMHovWHFiV3dLYVJiTGF6UU1iaGFTSFp5aG04Z1lURXIrN0gx?=
 =?utf-8?B?ZUt4cUJCUEVySXpCdmp3Z3FrbWpSTUh2NjcvL0FydHZsNFNCQ04yMmRHRC95?=
 =?utf-8?B?NWxTd08zOTNzcmNLRGZBMGdzbnhGTUxLY0dLQ2FPL3dQRnM1cVFVMkwycFpi?=
 =?utf-8?B?eWpsNUh6UEVUK1YrQ290djhUU0FkYkN5VFRHSDJzUC9NMnlFcUJEaFVlY1Rs?=
 =?utf-8?B?R1BqR3hoRlBqVXhLTzREVFVzU2FEdVdjRTlkay9UZHhsZnJ2NUhab0EwWnE1?=
 =?utf-8?B?ZHRwRTNTdi9DYmxIbnNqL0JmVUtLMW9kZTZIZUYxVldlN0V1Z1cwS2F3NnRF?=
 =?utf-8?B?U2VuMklEVGR3RWR2Y2ZNVjJONTF6N25ITnhsSTdtVWFDTGYxT0VpWkpkZjhD?=
 =?utf-8?B?c2lyMkQyaFAyWEZudGlKa0duek1CZHJLN2pMd08yRjZoV2FmVWxycmI1VUx4?=
 =?utf-8?B?MnRTaFUxdHFWMThvNzFyZitRWkd1alNqSW1WZ1ZyYVQzK0dqSWg4Rnh6SThI?=
 =?utf-8?B?LytZTWxlWk9WaVZTc1BxdWhvNnBOMGdlSG50bUFrRHhldjZEbUgrblh0TEhG?=
 =?utf-8?B?NncwektwMVh0dHBOUUkrT3ZRQ1h6N25TNEpPN1ZweUIwcWhJVkhnczBoOFRI?=
 =?utf-8?B?cWg4TlRBR09ZbkdleVJCZDUvbFBYREpSc2l0SEh4UzgzNFBJc094RWxaK0Vo?=
 =?utf-8?B?VHI1VXIzTzI4NVBQbyswaE1xTllyWSsySEMvZUJjbGx5MVVnckRHTzhvQldN?=
 =?utf-8?B?S2svNUVWM2ZWeFlRUGxzeTQ5WHkzNHBJbmw0UkNtSWk5c291MEZuSDJrRGh0?=
 =?utf-8?B?dDlpMm1kWDl5MHdWMnpwTUE1Umo1dHpMSXdyQzJGRmI4VXJtLzBHMlNJdG1l?=
 =?utf-8?B?NjFPT1VVbFc1UTlWclBhVmtVM1p6MkxyQ1dSMmdmcjJUQWhlMnUzdFVnRlJa?=
 =?utf-8?B?Qjh5MU9sSjRwTDZFQk9FTkxiMEhrc0dwN1Q5WW1VZGVYeForWXJBcDNnVllz?=
 =?utf-8?B?MDF0MVltaXQ1TmtWSFh4YlJ3WXEzOGpaWW5tQWxwMHJFZTV2bmt6R085dHFr?=
 =?utf-8?B?VFE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 62a74fb1-6a17-4fdf-a0ef-08dd1b9cf2bb
X-MS-Exchange-CrossTenant-AuthSource: CH3PR11MB8441.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2024 17:38:25.9696 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SK0ETCewORUrovg3A152hrZLsDWJqyOzE0ciOI4sHRvUa9gapG+scXoTlAvvjYmNoT4WL5gbcE3GVTaNUekBXhS+kcx2xwcwPLphtjNoZjg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR11MB7107
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

On 12/13/2024 09:25, Souza, Jose wrote:
> On Fri, 2024-12-13 at 08:56 -0800, John Harrison wrote:
>> On 12/13/2024 08:48, Lucas De Marchi wrote:
>>> On Fri, Dec 13, 2024 at 04:28:58PM +0000, Jose Souza wrote:
>>>> On Fri, 2024-12-13 at 09:50 -0600, Lucas De Marchi wrote:
>>>>> On Fri, Dec 13, 2024 at 03:24:59PM +0000, Jose Souza wrote:
>>>>>> On Fri, 2024-12-13 at 07:10 -0800, José Roberto de Souza wrote:
>>>>>>> On Fri, 2024-12-13 at 08:38 -0600, Lucas De Marchi wrote:
>>>>>>>> On Fri, Dec 13, 2024 at 09:12:52AM -0500, Rodrigo Vivi wrote:
>>>>>>>>> We do not break userspace.
>>>>>>> There is other patch that also breaks Mesa parser:
>>>>>>>
>>>>>>> drm/xe/devcoredump: Improve section headings and add tile info
>>>>>>>
>>>>>>>>> This reverts commit ec1455ce7e35a31289d2dbc1070b980538698921.
>>>>>>>> But we have users calling this function.... the revert is not
>>>>> so simple.
>>>>>>>> I think we need to revert the functionality rather than
>>>>> reverting all
>>>>>>>> the patches, otherwise it will cause a lot of headaches.
>>>>>>>>
>>>>>>>> I propose we go with:
>>>>>>>>
>>>>>>>> a) drop the \n that broke mesa and merge that with cc stable.
>>>>>>>>
>>>>>>>> b) move back the entry to the previous section that broke mesa
>>>>> and cc
>>>>>>>>       stable.
>>>>>>>>
>>>>>>>>       José, would it be ok to merge a patch in mesa and port that
>>>>>>>>       to mesa stable that simply looks at 2 possible sections?
>>>>> Or even
>>>>>>>>       drop the section checks... ?
>>>>>> But if Xe KMD is reverting the patch that changed the hwctx
>>>>> section why would Mesa need to also parse the new(future to be
>>>>> reverted) section?
>>>>>
>>>>> first is to undo the damage, with 0 changes in mesa. We do that
>>>>> first and
>>>>> *then* we agree on what's possible to do to accomodate the 2 parsers we
>>>>> have.
>>>>>
>>>>> If we can get something in mesa to work that is backward compatible
>>>>> (i.e. the
>>>>> changed parser is able to parse both before and after the kernel
>>>>> change),
>>>>> then it could be considered to a mesa stable and the kernel side
>>>>> changed.
>>>> Okay, reasonable plan. But the ascii85 encoder with \n will not be
>>>> brought back right?
>>> maybe let's agree on how to possibly bring it back? I suggested using a
>>> space as continuation line char. This way you can just check the last
>>> char
>>> returned by getline() you are calling and see if you can go ahead and
>>> proceed or if you still need to get more data. Neither space nor newline
>>> are part of the ascii85 character set, so it's safe and you can handle
>>> continuation in one place in your loop.
>>>
>>> if you are just ignoring any ascii85, then I believe it's even simpler:
>>> you check sections and keys with a space since both keys and section
>>> titles contain space, which is not part of the ascii85 char set.
>>>
>>> Lucas De Marchi
>> Yes, I would strongly prefer to use line wrapped ASCII85 data for all
>> blobs in the devcoredump. Including things like batch buffers and other
>> VM entries that the mesa tool is presumably wanting to decode.
>>
>> If adding a <space> character to the end of each line is an acceptable
>> fix then I have no problems with that. But not line wrapping at all
>> means having to carry that change as a non-upstream patch in either the
>> internal tree or in individual developer's local trees. Either that or
>> we just cannot debug a lot of hard to repro problems.
> Can't Xe KMD use the line wrapped version of ASCII85 when printing to dmesg and keep the regular encoder when devcoredump file is read?
Apparently not. Even when not deliberately line wrapping the output, I 
am still seeing it being wrapped when dumping very large buffers such as 
the GuC log. It looks like something in a lower layer is also forcing 
line wrapping of super long lines. So either we can't add full size GuC 
logs to the devcoredump or we need to support line wrapped data in the 
mesa tool.

John.

>
>> John.
>>

