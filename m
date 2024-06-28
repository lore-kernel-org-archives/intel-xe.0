Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22DB1C2BD09
	for <intel-xe@archiver.kernel.org>; Fri, 28 Jun 2024 20:07:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84FC10E0AE;
	Fri, 28 Jun 2024 20:07:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="bOSDRw+R";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E83C10E0AE
 for <intel-xe@lists.freedesktop.org>; Fri, 28 Jun 2024 20:07:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1719605233; x=1751141233;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=H45EslHxejxPjevOlzJjD/idCGH1hmPuCAJtTzwUujk=;
 b=bOSDRw+Rf2rTm1Wi37D4WYcC06m2LIpqJTT9sEz5DjYYdsLfyRB9OXYz
 CsPBYGEk2+qRk2gACZ58zSEESt4Xp+yLPg4/cJCUKwohqjQR/U7bhTfaj
 z1JTsTrSv3lueM/QGA9qOznPjsgpUV5rv1IQvxa/2PmRoC8LFPwO4Kjxl
 pyduLh5LCwdVu0l1S9WVXBT93Gy3XKSkGzVvu4m2LvFRcV/RZnAR218Qv
 IyioREYDp0Slb4LAvmPGnGE+cA5caDNUwU6HRvecJOwiyz3K+WjtRepYs
 +jYWMKsDlDSQ0ZX6c5Pix5qM+PENE8IfIZ8pWxrupLtrlSSO47WmW02o4 g==;
X-CSE-ConnectionGUID: d6rsfF0aSeqfrfgpqu5CFQ==
X-CSE-MsgGUID: 7Y8JWvDqQM6P2TW+H0RW8w==
X-IronPort-AV: E=McAfee;i="6700,10204,11117"; a="16928469"
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="16928469"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 28 Jun 2024 13:07:12 -0700
X-CSE-ConnectionGUID: UX/n6EORSEyZvEizCNeU8g==
X-CSE-MsgGUID: 2eR5NrsaQMSwclrxgffZNQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,170,1716274800"; d="scan'208";a="44919041"
Received: from orsmsx603.amr.corp.intel.com ([10.22.229.16])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 28 Jun 2024 13:07:11 -0700
Received: from orsmsx612.amr.corp.intel.com (10.22.229.25) by
 ORSMSX603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:07:11 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX612.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 28 Jun 2024 13:07:11 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 28 Jun 2024 13:07:11 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.44) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 28 Jun 2024 13:07:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIsObmJYePbkDS6kdSwsq2A/PTxAaJ7liGROJSbsxh8N4s/SDWle37RpP/JxXd0wMITarOpCxiAafBohY/VWDIQEyLRvSU7VUOr0Ko/AYvc85jDofaQYzKY1FGjpUjWkYtbnt/QAvwi4nPvIlYBQj3vuIiyQDVBIPdys1PmCLczH177q+Lujz5wol58BJBvYC2vfiU/VRCO3LjXlcOKPB6cWZoqin3Fk6rOUvop7S6x/XhxVJ6qSsU4pnq/Bv1RrWiT4d1ki2w/deEDWGgndQvC5uPgbZBUtSqM6z4MYMyGF+WJDzYSnPRyq5q3BrTo+cgn0VpcjQSPVGqj5DO5sMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pnNuTgFVHSIJiaTwgwXcUpccM4ZXPB097qkQuGaL3gA=;
 b=kttaHTdl3sRI84ZFOIcfWs3P3eof1VKh+TMzpLb5BzkpjSXAk9A15X9umQ613ulZQT9r3nClI2RVcU/Q36VPdEAEBAaR+ubacHvq1UUbkCo24Iwm6d/1X+QMnnEIKfm6DK5Zvjywikr+G+1M6qn5jGQsLxVdwM+J2fFm4vqNqWcTCmECulo+ich8uihzFXDKCN4SKgxZcTQBJ8abG2cv2lnJMOuCyFljKEIJ3nhRSGrZtWkPxQ/3Z+0atI9Cgfz/1jZUe0lu17eLVnaJ469xsJFqaNxfY6e7woa8GE5vbnzrAtuc4TM+faOsT38BfJtR4/mK+/5G1AKJbDp8uCSXew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from IA1PR11MB8200.namprd11.prod.outlook.com (2603:10b6:208:454::6)
 by IA1PR11MB7318.namprd11.prod.outlook.com (2603:10b6:208:426::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.26; Fri, 28 Jun
 2024 20:07:00 +0000
Received: from IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e]) by IA1PR11MB8200.namprd11.prod.outlook.com
 ([fe80::b6d:5228:91bf:469e%6]) with mapi id 15.20.7719.022; Fri, 28 Jun 2024
 20:07:00 +0000
Message-ID: <fb510ccd-1d3c-4fef-b365-01765f8e672d@intel.com>
Date: Fri, 28 Jun 2024 16:06:59 -0400
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 1/5] drm/xe/guc: Prepare GuC register list and update
 ADS size for error capture
Content-Language: en-US
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>
References: <20240624215404.3213075-1-zhanjun.dong@intel.com>
 <20240624215404.3213075-2-zhanjun.dong@intel.com>
 <i6u5mewr37v7ujevqsevvjcdq3g56jmn4zyquv6qym42i2anvq@ve57hgm3xovu>
From: "Dong, Zhanjun" <zhanjun.dong@intel.com>
In-Reply-To: <i6u5mewr37v7ujevqsevvjcdq3g56jmn4zyquv6qym42i2anvq@ve57hgm3xovu>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR03CA0025.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::30) To IA1PR11MB8200.namprd11.prod.outlook.com
 (2603:10b6:208:454::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA1PR11MB8200:EE_|IA1PR11MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 126e3b25-ac1c-421a-5c61-08dc97adde86
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?NC95VDVMeC9lS1VmandPcmpEdHZKM1FleE5lYUVqSFZqRkdVSGkyZ0NDdnpO?=
 =?utf-8?B?enk5U3lyYXh2U2d4OW4yL2E5M3hqdzY5djZZMVVGSWEwSEt0dnd3VGVwQUZy?=
 =?utf-8?B?UHBmZDBOVDBobVd1ZFpJSHhCbFNzQnp0T3lBMUd0Q1NEakd5QUU2SVUzUG9a?=
 =?utf-8?B?alNFaFowWGZKVEFuY3pqRmw2RTVTdEl4ZzNiMEp4RmM4WGdIQkJKZ094d3RQ?=
 =?utf-8?B?cW4wVm11azJ4R0xxZEJ1N2tmN3V1ckJOYzA5aUZzSEFvcFhnb0hCbDA4cUpa?=
 =?utf-8?B?dW5yZldRSW5BRGd5V1BWRkl5KzZxK2FYTFlnQXdqaGpFTCsxNlpDNWZ3TzBm?=
 =?utf-8?B?QUFIcE5pYm1EaHdEUklnTm42bTRuWUVQVDJ4NHYrb09PMVp1dVllMUlOMUJK?=
 =?utf-8?B?NjhCSDN2UDFnZ1A3ZVB5azFVb1NoUGppL3NhTm5SUlNveTBMWkI4ZC9sOUlX?=
 =?utf-8?B?Z0tzMitmUnZOeUQ4QkF2MUZTZnU4M21keU54NjJwcVBuUW1kRFQveWtkUWpm?=
 =?utf-8?B?TngvVldlSW9XUHZHcFo0eVU5NWdvK0VSK0Rtd1RuVE9LekZFUVFJVUZNeEc4?=
 =?utf-8?B?MCtpNVNzeDJGSFhFNkttdXVpaG9MNG9JaGdrZDk2K3RYMjZobDlHdUJmKy9M?=
 =?utf-8?B?Ni93M1doeGZoNlZHSEVTVVd2WjJKZkRjT3JWczJ1SkNTOGFLYzAwRHN2Tk9x?=
 =?utf-8?B?a1FlbVd2WEZhazAxbGs5OThqcXYrZUJlR3hxVzFHTGpzSC9FZmZoUFhTMy9t?=
 =?utf-8?B?WnBYRDQ5Wnp5a2w4WVlrd3kramRBYTBIS1R6NXNkU25oV2JvWDhSNlBrTzVa?=
 =?utf-8?B?SGk1YVNDUVVhdDZBdkpkWTVRdDdlZGdSeUZqU0tDblhTSUxBcERPZzZOTkZl?=
 =?utf-8?B?ZUhmdlVGZldRVUhPZDFWRjFzTzloMmVxSGJvNWxZSC96Z0dlTVVrT05PTllT?=
 =?utf-8?B?bnFWUDN0cmRlNXI4ODR3UzVGVEt2NXRaTmM3RkVWRk4yK3FuZ3AwQzdMdnI4?=
 =?utf-8?B?WExJYWttMDl1ZzN1L2NSVkxmeEFRWTBmSkdvTUpHU1FSL29xRG9iMWYrRDJT?=
 =?utf-8?B?MkhrNUl6amtqZHZWVFpXejlyclV2ODJJV0Vtdlg3czZkRmtMN1B5T3FnY2lR?=
 =?utf-8?B?cEhMa1BGc3o4UDhiMXM0Y0hnWDVua0lPT295UThIQjdDeVhQOVVNaS9zSTZZ?=
 =?utf-8?B?a3FjZzBhaE1iMm90cHFhcUJlVzNKWDRFZ0ZQczJwZVdUYWM5Mit6dWozUE03?=
 =?utf-8?B?Z2o3SFJUNGZHQ1F6N09qNk1WbkhsdUxZelpVV01RZEQycksrVEVNZTJESlhs?=
 =?utf-8?B?NnNBL0VJQ0M5eUE1Tm05YkgzVXAwSXVFeWMxU2FBUjhnMVNocW1ZTThIbUFC?=
 =?utf-8?B?Z3V1d3dhU0owblJDS1BoMHBhVy9xc3RTZy8wNWdwcDZRWHV4Ulc2aStBY3BO?=
 =?utf-8?B?MEFsckhpanNJVEJ6VzJvVnQrSG9RNzM1TjFBd2daaDZpeFYya1BRWVVoMXl0?=
 =?utf-8?B?UmxRc256SUF4WmRtRUFYNy8xYWtTYkw3V0FOR1hSSnovSmQ0b00wNDdIMUpZ?=
 =?utf-8?B?eHpEVmpNOWhEMnphWDM5SGUxdStheGJseHovM1FreHNTTHYvMDcvTUZiWDdC?=
 =?utf-8?B?Y0kyd094bDhVdUp4dHBNQTZVR3FJU0Juc1VuQmVySUN5bXFGTThMZEVYc24y?=
 =?utf-8?B?RlN1YVNNM1VBdW02OUJtcDdyQ2UzMk1Nb0JnOVlVYUNvaTdxMkJEMXBhSENl?=
 =?utf-8?B?Rks5bm5OeXBrc1o2R0hTVmxzaUVyMkQza3h2WGttUCtOaVRybWh4S2N2RDZu?=
 =?utf-8?B?MTRZTnl3N0wvc0ErZ2l5UT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA1PR11MB8200.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?N2Y4M1UyU09zZy81VjUrb09NN1Ezdm9QT0ZIZG1HeDdLMC9mNStkQzdxOVA5?=
 =?utf-8?B?MFYxOVBWWEg1WElZL0JHSUlJam9ZY0M5Wjh3QTY4QUZCTHNZTUFxQ0xmMEFT?=
 =?utf-8?B?QzV0TXFEbmc2cWI0S2dpT0x2MGh1WG50MHY4WnREaDVZRldkT25nb2U2SEpT?=
 =?utf-8?B?MlVGRE5qQ3A4MkdWeFJRVG5IbDFiMlExblZBZjZ4ejZZMG1lVWVtVE9IeXEv?=
 =?utf-8?B?NXI1Sy9TTjA0SzRUY2FoV1dPdVd4c2lORTVHR3RSTmhnb0YvR0NMQjM1b1Rk?=
 =?utf-8?B?YTVjYUJlN2hCcDZ3VWs4TzVzOWdLQTRnd3JnSW01M2wvVEFrQy9ndTRwSEZR?=
 =?utf-8?B?eGYrMjVEVCswZHdIc1NpSU81NlF0QVBrSXJQTk5nK0U3M1FRK2Q0SVdnM3pm?=
 =?utf-8?B?a0VjbkVDRldlYnFFRGExbzdzbmZMZUFOUXM0c0FlQkZhcHIrdDlKcjhyQ29G?=
 =?utf-8?B?ZXNsMnpvTmhUUStNWGZ3OGxIVVNnSnFtdnNwVXZFZ3RGRkR5bkRtTjR2TU82?=
 =?utf-8?B?VzRTNUdITGZ5MU1iZ0JkSGo5Y1pJNnVoRkFGVFZ6a1pNNWF5cTVNRzUxVi9r?=
 =?utf-8?B?Q0tnYlgwUjE3ZDAyYXJYQm0vckdoSXpiZW0xdzg1amJlejdWU0paT2ZMVy8y?=
 =?utf-8?B?WjZmVDlsYjFNQlFoek9DYjk3VG5Oak1tVkQ1N1F5Szg2MFJBZWhpZ3pYY1Y4?=
 =?utf-8?B?VGxUczkwVmtEWFhaZUtDdWFsQlNVU3lURERPeUN6RlNkQzlNaGxYMStoTFpn?=
 =?utf-8?B?TzYxbm9rR3FwRWtpMjIyVm5FL2VQZFhrNDFLS1E2dkcxekhKM2kyY1ptTjZT?=
 =?utf-8?B?T1R2THZhclFnaFpnV0JNOG1KVTkwOTFGOUZlclNuV2taS3ExMEt2OTEyNllo?=
 =?utf-8?B?S2ZJblRsWStDVVNucUhGZDcrQ3J4TFI1NVcvbC9OOEF4Yy9wN2Q1YnBlMFJq?=
 =?utf-8?B?cEtaWDR6SVUzM0hYOWZ4ZHhYUTB3a1EvOTlPa21IaDE2eitaaUtXNTdaT2Y3?=
 =?utf-8?B?OS9hNURvb3dwSmY5YXdIRDNyNEsyOWlYTVQ5SDdseGk5N2JlR1VLbGc5RTFV?=
 =?utf-8?B?K3VMRmlzZDhBaXA3SXE2U0JWSVFQRW5XU0NtWTJIcDlYQlJlbWZSOTNtY0JP?=
 =?utf-8?B?a1IydUdwZWIrZDl6bjJhUlU5SE1YRzFBMGRVL2E3RnNGN05zZjE5MGVTSE5N?=
 =?utf-8?B?eUFJc0J2SnZ3bUM3ZEV5MTIrY0JuZE9IelFyQUtiYjIrK0JXRmNVUDRKUXFH?=
 =?utf-8?B?aThqZGROVjUvQ2RHTmFoc2lzT3V2ZURKbnd0eS9qMTFiZkpmOUdZaGE5Ui8y?=
 =?utf-8?B?SHVNZVJYZmhjTTJPMTZ0K0d4UVlEREFOeDBPcFNVOU9ubGFoNG5GR1g1MVFS?=
 =?utf-8?B?MzM3R2VSVDU2clBrMVlLN0FqMUlEbXBvTmoyeURDc3pCTDhnNitkMkFoQjVm?=
 =?utf-8?B?UkxRNkxxOVE2N05haW9DUFNydzQ4MmgxSEtHZVdKemp1ellYZzhXMzdGbWRw?=
 =?utf-8?B?QlVHUlRybnN0MmZEV3NBSzNkU1BjV0doV1VOd1VRZndUL2YvR1hVRGE1WHpp?=
 =?utf-8?B?TFV5ZUVGcjJIOFRrOTJOcHhYa3VYd21BUEFPV0tKa2thcGRpVnVvYi9HZFBo?=
 =?utf-8?B?L1VieHg2SXFJVFdubkFFNzVuTGFqc3g2RjBBVXVzRlFwNnBuelBma1hxNDlY?=
 =?utf-8?B?VXhrNzRnMUNLN3pzcng0VDZ6dE9qQS9DNHZyK05CWE1aY1pVRHJqQTQwT0tj?=
 =?utf-8?B?djlYc21ubEorMmwyL2pUazdYOXNXUWo0Tit1b3lJbDVLMG9FaTBMbUh4QmxJ?=
 =?utf-8?B?Y1lkbTNCSHdBWFY0aUd0OGpYZitYTEVNdTk5RjlwUmplVmt2NlRwckdPSW1h?=
 =?utf-8?B?NExKazRLU0ppNXlqdXBQb2E1TFNwNHE5eW9RS3BiRk52b0xWRTBiMzdiWXBE?=
 =?utf-8?B?NkJ5YmVWZXh0bHJWSkpqcEJSWmRLblNyVytPVlc5ODFWUEJhOVZyaXhoUVc0?=
 =?utf-8?B?V2RYNGVCS2NWUXdkd3EwOGFqZ2IwZzdOUW5YRjlNaXRKenRuS29aSWZ6Y05z?=
 =?utf-8?B?OEVpK2FkQ25VbXJqMnhwTFdWeDNWVkQ1TS8rekt2VWNwYXJQS3AvdHVCMFdK?=
 =?utf-8?Q?uEE5qE2g00tkDaOJHj/8ad5+O?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 126e3b25-ac1c-421a-5c61-08dc97adde86
X-MS-Exchange-CrossTenant-AuthSource: IA1PR11MB8200.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 20:06:59.9681 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hMb5KrYjD3UTzsBv2X9RC5rU1SInxYhkof7dDJfX8MgMVi+gIxG8mYyOKAdozSTDm/2vm3Oeetape+NyPPi9Vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR11MB7318
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

As guc double-load will be changed in the future, the comment will be 
removed to avoid misleading.

Regards,
Zhanjun Dong

On 2024-06-28 12:05 p.m., Lucas De Marchi wrote:
> On Mon, Jun 24, 2024 at 02:54:00PM GMT, Zhanjun Dong wrote:
>> @@ -398,6 +401,12 @@ int xe_guc_ads_init(struct xe_guc_ads *ads)
>>     struct xe_bo *bo;
>>
>>     ads->golden_lrc_size = calculate_golden_lrc_size(ads);
>> +    /*
>> +     * At time of ads init, hwconfig was not loaded, engine info like
>> +     * engine mask is not ready.
> 
> pass by comment: this never really mattered and was just artificially
> done due to delaying the engine_mask initialization. engine_mask comes
> from fuses and possible engines from platform, not from hwconfig.
> This is gone since commit d69c3d4b5382 ("drm/xe/ads: Use flexible-array")
> 
> For ADS initialization I believe we still want size 0 when loading guc
> for hwconfig and only calculate it when it's for real. This guc double-load
> is something we may get rid of in future.
> 
> Lucas De Marchi
