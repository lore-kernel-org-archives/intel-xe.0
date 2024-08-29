Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C430C83011
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD4310E796;
	Thu, 29 Aug 2024 22:10:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Q6MSnRYd";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520E910E796
 for <intel-xe@lists.freedesktop.org>; Thu, 29 Aug 2024 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1724969420; x=1756505420;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DPTXxSfPVVkawhaygGgL7hf3HZP6bMLBwa/UIQ08wPo=;
 b=Q6MSnRYd8TFEcsJelQg4s9qy8tgeJQdSW68oqC8ysMrloiolbDRKw6Az
 TeVpKhGHQurvHgyN5Aht5d4IhWwZdeN2nuGz9juCmb+7QE9wyEH8yaRBd
 G1ZEci9l2vnBR1RyFPWSKQytU6fY+O25XkV6sLIxiyhaEIJpprAhWNklH
 cnSiVzLM604oY3Cz15Vx3JSmhiPYWY6uwItM7A1ePI6YcpEb5bnJraEb1
 FOJibsBh5kYrwkNceAN+tiqbqrynKvhPHxfn18bJAjOAiNdAlG5FcCuuQ
 m6Aidq3VdExcBitU4VWo1Kz5RhayJf7py2bxDi5Mot9rw0t/e6CgSLrzp w==;
X-CSE-ConnectionGUID: bHWlZRfITASo5cJCz+5Utw==
X-CSE-MsgGUID: wwxVDrVeTgWLGqdO/m7jfQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11179"; a="26491024"
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="26491024"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
 by fmvoesa107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Aug 2024 15:10:20 -0700
X-CSE-ConnectionGUID: yzWEj2+1SY+H1uzlpZFQww==
X-CSE-MsgGUID: xCMs16kDQQiryZed1j+n3g==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,186,1719903600"; d="scan'208";a="63768722"
Received: from fmsmsx601.amr.corp.intel.com ([10.18.126.81])
 by fmviesa009.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 29 Aug 2024 15:10:20 -0700
Received: from fmsmsx612.amr.corp.intel.com (10.18.126.92) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:10:19 -0700
Received: from fmsmsx601.amr.corp.intel.com (10.18.126.81) by
 fmsmsx612.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Thu, 29 Aug 2024 15:10:19 -0700
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx601.amr.corp.intel.com (10.18.126.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Thu, 29 Aug 2024 15:10:19 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (104.47.58.168)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Thu, 29 Aug 2024 15:10:19 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NmG+m4c3nWBAa0DSCuxMokoIoG1hnEfNNEdkJlFdpTkudVfy/ZkNwO8V/OK1xHeHOxU8raa4vWCNZNgCsqUNR9D6HtUWn/OKkE6HJPJQeWjn3PojeFGNlslheUy2aw5zcj1lcl8xIw32QIs/xjnI4QMQ1iwp/VZFvaWI4fF65Oip/iAuMQy4U00iNW+zsnSNBNRG5pwhyab79zBD+LKHVEDzoYy6fKrUq5uxfLTtavAeUhQEZzR3iXn82W/niyvzfrveUFkw1jfKppy4tyWlImw17gqOpNPMegbWfJfDq1V7nbWhMQ5mGysZ6BYlDI9THEfcy91V8NqAPmTr8HmuCQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pg5sQ8Nj9fOgivnN6NXNthqjXnfS6tUSpitQLsSRylU=;
 b=qwcKiAgkuNWS9wSwraKAnrNeHDLQOO1mVvVlNwfjrywzZN4hEElMZ5pQgaM8eopxkJ2jvlLsjhHLfw0RcjYBSAunWqmnKycrORe7zK9xqBfpBVLX9i9RQQHrcEjgVHxDGTfywytJ16lc1w/GGUPewYxAAXoi/u2k+NQY/Np99kcElFrDZJkAsssTpQGSK4YrPcBJIxetjqsM2uD4dlKrMx7QL7N9oqB3TbJfFy4Y5Ttr2RCC0e1X3s2TMXlRcLsTIjo3ILEsNrDDkeVlvE8VSynUjRX3qHsRKo48d553xWR+pD+abeKz6Lrgc8RS5jQxtjGaVjJMq5pieAagpqA6hA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB7757.namprd11.prod.outlook.com (2603:10b6:8:103::22)
 by CO1PR11MB4978.namprd11.prod.outlook.com (2603:10b6:303:91::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.20; Thu, 29 Aug
 2024 22:10:16 +0000
Received: from DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1]) by DM4PR11MB7757.namprd11.prod.outlook.com
 ([fe80::60c9:10e5:60f0:13a1%5]) with mapi id 15.20.7875.019; Thu, 29 Aug 2024
 22:10:16 +0000
Message-ID: <602bffcd-d66f-4b49-b3b4-abb934b00f3a@intel.com>
Date: Thu, 29 Aug 2024 15:10:11 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/4] drm/xe/pmu: Enable PMU interface
To: Lucas De Marchi <lucas.demarchi@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Aravind Iddamsetty
 <aravind.iddamsetty@linux.intel.com>, Tvrtko Ursulin
 <tvrtko.ursulin@intel.com>, Bommu Krishnaiah <krishnaiah.bommu@intel.com>,
 Riana Tauro <riana.tauro@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20240827164107.47034-1-vinay.belgaumkar@intel.com>
 <20240827164107.47034-2-vinay.belgaumkar@intel.com>
 <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
Content-Language: en-US
From: "Belgaumkar, Vinay" <vinay.belgaumkar@intel.com>
In-Reply-To: <o42m66pseq7yxitt27whcwjntvtuoxndlxcvld2vak5i6ejhtv@ny3ilfuxvwyz>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BY5PR03CA0026.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::36) To DM4PR11MB7757.namprd11.prod.outlook.com
 (2603:10b6:8:103::22)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB7757:EE_|CO1PR11MB4978:EE_
X-MS-Office365-Filtering-Correlation-Id: 93edd0ea-d3fe-43fa-307a-08dcc8775cf6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MWdVdS9YbTZJSWY4S2NaT1ExaXRRWkU3d1d0TkFrdEdVRkhwamEweCtWMWpO?=
 =?utf-8?B?bElNcmZRZjgrL3pQcU1BUHdCb3Y4ZnY1YzJlRFRqbUpLVS9ta2JvYnpHY01E?=
 =?utf-8?B?cUd6YTdjbkNPS2g1U0EzVitIU0F6cmFTK083eDlVa3dLMXdYTHlNMVQzaFNV?=
 =?utf-8?B?TjJma0NSWWRya1ZCMlgxRStLMXJOL0NkYkZvNXo2WVRnMWtncnA5Q0tHQnZF?=
 =?utf-8?B?VXArdGdVQ1RFTXFUUEtCbFZ2blk5OEhCakI4aFNJcndnanNZRlIvOXVQSmNF?=
 =?utf-8?B?WEZlWHFSdXcxUDV3aCtGT1pGUWs1cjU4U25NdGh4bVNhbGhFL3ROSy9icGI1?=
 =?utf-8?B?UllvN1hyZTFXSzRlMzU1bUhDMVpsQzgxYVFYb0N5U0g0THhtc1VKWnNWRERr?=
 =?utf-8?B?akNVV0dIS1pkdWtXQ1pkZGFZT05QamxoWGFtb0RKOG9YamJlTnVDV2hJYm9h?=
 =?utf-8?B?ZjIwZkcvaTB6bmg1WHQrNWlqaXdLZU9Td1A0OTlOdTlBMUNQWGpYcFVIRmNw?=
 =?utf-8?B?QTFveGxVWXJob2xoM1JueWxCVldNWXkvbzdDOUhRam90bWs3VVJ0bGptT3lR?=
 =?utf-8?B?VStiWnJCSVlITXJYaXBNZEV3R3R6L1Q5NW5KbUtWUlVvRXFpdVh4bFdGU21W?=
 =?utf-8?B?MGhkUWZ0QVk4aWkybGQzY09raW5UbU5GNCtZSk5tYW56MEc3amgyTnExcVJx?=
 =?utf-8?B?aW52bXNYMldOeDlxNjBwclpWd2IwYkZmVGZZWmZ3cG9VdVdRSzdpUDNXTEh6?=
 =?utf-8?B?YVVsa1JPcmU3RzBDU2V4a1Z5MEdMb3Y2dnQ1bGRuWXVNZGFSeTgvRTlmTUV1?=
 =?utf-8?B?MGIrUTl3a2NvTXZvbSsvRGVCTG9nOGNBOGVDQno1dGVaU3N1SjZCRDJJQ1lq?=
 =?utf-8?B?cHllcVZEb2l0THRvQzIwTmh2ZWt0RVp4eXhVYXp5L1pDL1RrV2dkczVveW1X?=
 =?utf-8?B?VUVFU3BXMVIvOW1NaU5UQVpGT0hoZU5ZSmUrcUNFTTY2d2NOc1k0LzhDb1dy?=
 =?utf-8?B?Q3kvdVUxZ0RSMmV5Q2lvQS9janN3QXB4ZWorYlM2YzV4ZVhCdkJncTNPNWpP?=
 =?utf-8?B?eUMzY2FsZGxqbVZBNE1kbEhtVlNuZ2k4TndJVGxjMk8xWlROdU9SODFNMity?=
 =?utf-8?B?U0Z3cEJaS0ltZys1elZZQVlUWlVYdUYzUU5QWnFaOGJrVzZ1QUNWbWtWeUIy?=
 =?utf-8?B?bDdwd1JSenRvNkxTaTFvcE8vRjE4WHN6ZDhPbThvaVJKbkZTSVhmbzNnR2Fl?=
 =?utf-8?B?Nm5pOWtIdUV3RzhRMkNZdm1JQ3IwdVcyNWUwbHZxL3RrcVdvUlo3K3hXeUtH?=
 =?utf-8?B?SmNJWFJPRmM4U0pXeEhlb09lZVNFMitBL1RKOWVRTEk5YVczSnBnRnQvZ25j?=
 =?utf-8?B?a05zdjQzWGxlV3lqRVMwaFpXU2JQOElCK054bW94VWNObCtzM1o0VjREaUZj?=
 =?utf-8?B?WEdHYTRaWTExNXNZYWlPd0pqTkIvaFhrQ2dQbHBRMnp4RmMxUjJSUWpEQ014?=
 =?utf-8?B?SFIyZmdrQWFQWmEvTFF6blJXdVpFSEFJQmVQQ0lxdFgwTis1dno0ZlVsVTE4?=
 =?utf-8?B?cWRoOFZSZkZqL1pEaXh5Mlc1NmpsUlZkQ0FrZnZBditQcXkvNDlxZEp1UGRF?=
 =?utf-8?B?bTdEZ09DVWxna1QrMUhFNy9RQkxUbmFndXlvWHF4STQ3RVB1bG11ejlTWmlV?=
 =?utf-8?B?Y2ZQMmMrRHpxV1dLY3g3TmhOSDQ3eEsrN09PUnlRVXdJQ0FmV0lBd1dDZkIy?=
 =?utf-8?B?amovdVZCZElxMjgwalZJWTJ1YmtZWTJkWG1XUTlOd0tKSzdCeExjamk0NEFy?=
 =?utf-8?B?R29lZ1BnOVI3WlJqRUludz09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB7757.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WE1HYkl0RUFVM0NjdHZqZGxtSFNlcTlTcVEzWm5mZWZWbnBuZVRFa0gwYjdU?=
 =?utf-8?B?L3l3K3p2T3pPMUxNdmh0eGVGNTl6a2hlMFBFcUtDU1llR2JsUFNyODBac0Zi?=
 =?utf-8?B?WVBNNExEUDZHVldqclI4c1RUbWlwQVgzN0gzanRMTmtRWHM2OFRoaCtJemJW?=
 =?utf-8?B?SDBuc3F4M0dTMElnNFVPdVRtcklpQ3lhbzQxajh6NVBwVHJQbTJ6NUpQMDF3?=
 =?utf-8?B?SVdmWjVNZDI0ZjBrVFpiSU5jSWJ5VVR0aUo0bWhTVUhlTG5tdmJvZDU1dHJF?=
 =?utf-8?B?cUg4Y2ZkZ2NlQ1dHc1E5YWxiNUdRenVHWmVIRjZpWW9WTG0zQjNWZ3ZSZXNt?=
 =?utf-8?B?UUFCY0wvOFlPd2JGd1hSSFBrRFdUT0FreGpXby9STzRwa0NYNlpjSE1WTnlG?=
 =?utf-8?B?Yzk5RVl5eWNkcGRHTUprK3NpWkxGdTR2T09GR0Y5VWZXQjRnMDAwY2FVQ0Z3?=
 =?utf-8?B?SzNKWm9BOVJaUDU1TG83cWxzRHVLZ0ZKSi9KTmtWUXU4UGg3cEVObTVRNjBO?=
 =?utf-8?B?L1paMUZJYUN2eUxNeVpzcXFrRHpCb0NDMlhiZGxuQUFYR1dLMmhWOGpBSWNr?=
 =?utf-8?B?VUdYNytmTnJteWl1QnBCYTdKOGZRM2NGTUVQeUdvYlVwZWRHSlJrVjFvTVRt?=
 =?utf-8?B?ZEZURnp0Y0FpdVYvbzg4ZStBMXpWUzM5amN4RWZQNW5lZnRzQlRBY3grU0ZK?=
 =?utf-8?B?WTV6Z1lDQnNENlIwMndENldPeGRSbzlSanNRYWRzNHBTVE1oTGRMVkJGblRH?=
 =?utf-8?B?VTZ1K1YyWStpU1RzM0NrdEUrc3FSemp0WWFpUGdyRVBmSkNpMUpxT2FCeTJU?=
 =?utf-8?B?RTdGNU5kdFZBdVVjK2dOSlcrWGl6RlkrZ1FnRzBjYkZwUnZDb1VmV3Bra25w?=
 =?utf-8?B?Rk9MakpLa2FVWjkvMjMwYnlSamJIVWZSUDZWVzdmZWxRRUxVeUw0cjRhbzN5?=
 =?utf-8?B?Q1JTUDRxekhRajhhQTR3WTVqTmN1N214dTg0OVRCdUtaM0FteE1kYjBWSnh5?=
 =?utf-8?B?bWxNWjVWNjNucG5qL0M4VVdmZGNMUE9lOUJ1YitEL0VtZzhpZ3M2ZE45dVAr?=
 =?utf-8?B?Ukd2Y0oyQWZMU012bUJDNDIybVU1NnlqL05zYUZ3MGk4MlMxazdaM2NWR3JW?=
 =?utf-8?B?ODFTaFlobUN2RHlqVVpTeHlFYTRXVHppYWNzazl0MGY1K0RuOXdtdXFEOHdv?=
 =?utf-8?B?aGVhZkdRZGlVK0ZvVUR6d2VmV1ROcUtNM1BtVktGZTZrRjdjWk1hVnQ1ZlM2?=
 =?utf-8?B?UCtrL1Zac3RQV29qeHlQMitWZ1JDVlRiZCtlYVJxZnhTU29NTWJPSTZ0MTVa?=
 =?utf-8?B?akJ5UXJ4VDlCZDJwcnFBMHZCNVpVcUc2dlBUZFVyR0VDSmJuZmFsay9SZk1C?=
 =?utf-8?B?WkppM0dnelQrY01UZFdQcEZWc1Rtd0tMZGF1c1B5MURaT282V1c1eGlwTWpq?=
 =?utf-8?B?YTZUV3JzeGJRZmFBVkdsdXF5aGFnVjRBZWNEcER2UDRycHR0TnBVWkNDQzhO?=
 =?utf-8?B?QWkxZ1NJWG9jTFhzM05WTVVEeHRhWXRuekVYVWJRK2VaV2JLaWpQdXpsbFhE?=
 =?utf-8?B?a09icWswV0pVSnZ4ZU9LeWdUUE1ybW1OYTRyT3o4Mm5zZ09KV1FlNysvblJa?=
 =?utf-8?B?elZ6MURKR29JU09WMUtjKzNwVWhYM1IxbnFySlZsTUE2UTBBdnBSdmF1ZU1V?=
 =?utf-8?B?VEtHQkY4SGpvS0hJTjhKSStuT2syN1N1akowWVNzQXQrdzJnb1NSNm9kYnNw?=
 =?utf-8?B?VWhtUVBQVnI4T0h6Tmw0QUhENTliM2dKcE5OMVF3Z3ZKODRmd0NpNmFRbXor?=
 =?utf-8?B?V1h5VU1vTm8vclZBeEpsMjZncTFnc2I3anR2TytDYUZmK09CZ0JHcnZCcHB2?=
 =?utf-8?B?MEVtemFVL3dQUGJvZkVrVXpPRk8yYWZxWHc2NXRFQ0dOQkVmMW1iY1gyQXRM?=
 =?utf-8?B?TjkzUU40dnVycXdHTjJJQWxEU2g4TG4xVCtwbUx3MW1NN3FXK3B6VGdObWx1?=
 =?utf-8?B?K2lEc2xBaDdrQzk2d0NJanRRdmtMU2g5RnRDbGJpMlRWZEM1dGFFSWdiUDND?=
 =?utf-8?B?WWRhb3dMZ0pYcHlsSnE1UjNycFE3dytpVXVuckdRaHZNa2EyVHU0T0VBTDJp?=
 =?utf-8?B?SUZNMWZvbXNRUGMwQ3BoK1RiWHB1ZnBMdmpUZHJjTmV0V3M3UzR6VHNFZzBU?=
 =?utf-8?B?Ync9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 93edd0ea-d3fe-43fa-307a-08dcc8775cf6
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB7757.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Aug 2024 22:10:16.7319 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gSIqG3YnBv/jf90+DeEVo0GLMMhzw7dN7w/YEddIcS35nYFzDu/auwUWhUP2C55Gljqra+J+RPfeUhGoNg9cTlt2hexaZxv1rqQdS+bVrAU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1PR11MB4978
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


On 8/28/2024 12:33 PM, Lucas De Marchi wrote:
> On Tue, Aug 27, 2024 at 09:41:04AM GMT, Vinay Belgaumkar wrote:
>> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
>> index b6fbe4988f2e..de6f39db618c 100644
>> --- a/include/uapi/drm/xe_drm.h
>> +++ b/include/uapi/drm/xe_drm.h
>> @@ -1389,6 +1389,40 @@ struct drm_xe_wait_user_fence {
>>     __u64 reserved[2];
>> };
>>
>> +/**
>> + * DOC: XE PMU event config IDs
>> + *
>> + * Check 'man perf_event_open' to use the ID's XE_PMU_XXXX listed in 
>> xe_drm.h
>> + * in 'struct perf_event_attr' as part of perf_event_open syscall to 
>> read a
>> + * particular event.
>> + *
>> + * For example to open the XE_PMU_RENDER_GROUP_BUSY(0):
>> + *
>> + * .. code-block:: C
>> + *
>> + *    struct perf_event_attr attr;
>> + *    long long count;
>> + *    int cpu = 0;
>> + *    int fd;
>> + *
>> + *    memset(&attr, 0, sizeof(struct perf_event_attr));
>> + *    attr.type = type; // eg: 
>> /sys/bus/event_source/devices/xe_0000_56_00.0/type
>> + *    attr.read_format = PERF_FORMAT_TOTAL_TIME_ENABLED;
>> + *    attr.use_clockid = 1;
>> + *    attr.clockid = CLOCK_MONOTONIC;
>> + *    attr.config = XE_PMU_RENDER_GROUP_BUSY(0);
>> + *
>> + *    fd = syscall(__NR_perf_event_open, &attr, -1, cpu, -1, 0);
>> + */
>> +
>> +/*
>> + * Top bits of every counter are GT id.
>> + */
>> +#define __XE_PMU_GT_SHIFT (56)
>> +
>> +#define ___XE_PMU_OTHER(gt, x) \
>> +    (((__u64)(x)) | ((__u64)(gt) << __XE_PMU_GT_SHIFT))
>> +
>
> The perf uapi is self-describing and users should look up on sysfs what
> to use. Example for i915 since it's what I'm currently working on:
>
>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency
>     config=0x100000
>     $ cat /sys/bus/event_source/devices/i915/events/actual-frequency.unit
>     M
>
> `perf list` works fine and doesn't know anything about this xe-only
> header. Why would we add anything here rather than encourage other users
> to read from the generic interface?

Agree. perf list | grep rc6 is sufficient.

Thanks,

Vinay.

>
> Lucas De Marchi
