Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78E36CA0EE8
	for <intel-xe@archiver.kernel.org>; Wed, 17 Sep 2025 10:24:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2EB6D10E654;
	Wed, 17 Sep 2025 10:24:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="chm3p6G0";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2652F10E654
 for <intel-xe@lists.freedesktop.org>; Wed, 17 Sep 2025 10:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1758104672; x=1789640672;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=0/ckhgmlvzi3OB7NnXsOFBfIg7j1L71JMYYU35hEMcA=;
 b=chm3p6G0WfzIOHcRbzTZLKa9EBFZCaYfQT5Ce4f9CdJdMAuOIHq2VCke
 DanmlfED0GKQZKnxNMpxxF8mAUfmzCXlk0kdbBCTU+Az4PbOCf4VZzGKD
 3kbY/ff/4ZW6F99KQ9o+qhQ1ErySmbsXS2fgMrA5kac+ustk4rMmqN5A7
 0h4/YqOaLC2ITTFjow8sVce/9d5TlRozoogObG4KdWQll6Ja0uz/EnkkL
 PqGE9c0OMUvUTnvaubG5HyF+jHsBDLX6qH8gpyHVacS/886+vEGQScVWp
 FxMTpYkMztvyPRts41Ng4T8rZ/b6Ij5gA1BM2VuWQcPRlWZNmthRcVN+T g==;
X-CSE-ConnectionGUID: PRMteD43T8WfwUqrNU8Vxw==
X-CSE-MsgGUID: eKoLph5lSiaGcREAXG3Wog==
X-IronPort-AV: E=McAfee;i="6800,10657,11555"; a="70656632"
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="70656632"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
 by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:24:31 -0700
X-CSE-ConnectionGUID: 17TJ/LGgTUuEK6CY0T9hKQ==
X-CSE-MsgGUID: baBjka4PT5+IhMBGgpvMGw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,271,1751266800"; d="scan'208";a="175129537"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by fmviesa006.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Sep 2025 03:24:31 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 03:24:30 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17 via Frontend Transport; Wed, 17 Sep 2025 03:24:30 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.43) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.17; Wed, 17 Sep 2025 03:24:30 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TqWvScyK3Aqqv9ey1/a17ZSmKaljmC0fq6fDGJ1JD810xWkTmDXgMXHRTbx0Et/Pf9SSN0YF6vCi15flbHkGlcOFwq7nVfpYlLU1Hzf4sNHILHRjY4Xbv/4nYIMJeI1G/3K/AU9fsMylYlRS7e+zVMSWC++Z7BdTsrbsk87ekbYRkCN5pInBQN4213KNuXuMIrFow2HjYvYrElkm1+kVa3cbeuCNX/Ho6FnjwY6V9Jc0pJK4jKt+3tqlJc5+STxZ8+6S6SkaSeJbCwsheewqWm2qHGqVIBfMrSTa4yf2s7Ss9WgzCXrsM4klNQiPw8vzWdwUw0P8T6Q0Ub0+H+eC7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bwW/DT47C2gR8K/7xa17Wy3OVmTXz6cjOp/KOyYZoFg=;
 b=IqhAq2DAKadeD90wN3fdv6tVlXX8K6Bf4rehFEIrPq4sMNvghE35IylOGjoe0gwDjKqjdeqEb/dbn7Xom+Zi2UkO+En2eOvjHCLjUpBVvT3KgCoFKVvpT7RdmlMkQxkP6tnt522NOE7iHdoX4cMDkguUEJAUTm2vjpxoSTXbTnIZGaQi2QIUjbkwAENQaUOY+iEo8jEvDZHp5SnStEeVuLWK4yXEZV2dEheAkrWk/3ZRDD7wSutzNhDZ3sZq7CA8obT+uZiYLmJyy7HPLXEgzJ5TrwpDpMEXLAMCFusafGesMJPJBuSctp60WLH/VZDtvJgUIekYf+q9hy3jjIIULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MN0PR11MB6011.namprd11.prod.outlook.com (2603:10b6:208:372::6)
 by LV8PR11MB8677.namprd11.prod.outlook.com (2603:10b6:408:1fa::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9115.19; Wed, 17 Sep
 2025 10:24:27 +0000
Received: from MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267]) by MN0PR11MB6011.namprd11.prod.outlook.com
 ([fe80::bbbc:5368:4433:4267%5]) with mapi id 15.20.9115.020; Wed, 17 Sep 2025
 10:24:27 +0000
Message-ID: <be9d95e9-e02c-452f-a547-f0d3a1ae050e@intel.com>
Date: Wed, 17 Sep 2025 12:24:24 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] drm/xe/sysfs: Simplify sysfs registration
To: Raag Jadav <raag.jadav@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Lucas De Marchi
 <lucas.demarchi@intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>
References: <20250916170029.3313-1-michal.wajdeczko@intel.com>
 <20250916170029.3313-3-michal.wajdeczko@intel.com>
 <aMpS02yLhBs5igpM@black.igk.intel.com>
Content-Language: en-US
From: Michal Wajdeczko <michal.wajdeczko@intel.com>
In-Reply-To: <aMpS02yLhBs5igpM@black.igk.intel.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA1P291CA0015.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:19::13) To MN0PR11MB6011.namprd11.prod.outlook.com
 (2603:10b6:208:372::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN0PR11MB6011:EE_|LV8PR11MB8677:EE_
X-MS-Office365-Filtering-Correlation-Id: 7639483c-301f-4d5e-5763-08ddf5d46192
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y0ZEOVFDOGwvL1ZJL05jbHhTMlFxTFpaMGZZRVc4MjRTTzhXZ3JqbnA3R3Zt?=
 =?utf-8?B?NWV1eDdFRlhZa045blk2VUtIUkhVM1psaHBCTnFWZDFaNEswY0JWTkpOcUg5?=
 =?utf-8?B?YWlKaFNJeFRFU0hlZUFRSjVlU25OeTE1L0M1S0JNOFFWNEE5Q3dKK0NEQjY2?=
 =?utf-8?B?V3lkbEhIRmc2enBZR0tTSk1jQzJYcGtvbGxUQmRMZGZuV1o2ZkJva2NXbGFw?=
 =?utf-8?B?c1JTc3Rwc3A3eHVNRTd4RzhhTWdFL2gwWWl6QWQ3Tzl5SGtPVkFXSzA0aUFM?=
 =?utf-8?B?UVFZakdLRjFiMnVJK25pRnlFRlVmcWV0dG9uYkcyQ2hvenJjWkdsR1RZMHI0?=
 =?utf-8?B?MGFKei92NG4yN0JSM0JjOEJQUkVhWE0zTmR5VDBPbnN3UzR4ZElyak9GS2Zt?=
 =?utf-8?B?QWQ4SEZGWUFCNHR6M25NOUhVZ01DL1lmR3BWZE9UWGhydUNYTjZ6bkpkWWxa?=
 =?utf-8?B?VnhsSWpId1ZST1JwajJsbWhOeUpva2FIellVS0wrbUNrNVJyd3lsTVAvS21R?=
 =?utf-8?B?dzR2bEZBbHFJd3dJL2MvMUIxU0pWdVBHSGNoWW9yUkw2Mml3VnN5T3QxQmVh?=
 =?utf-8?B?K3lMa1JkekI3N0ZsWFhzSXh3bUdkZEFFbEk4WlRvMEdtRk4zZG8xcW1tcjRi?=
 =?utf-8?B?N29pVGF6dlZsMGtwQlY4SWJqdE9nWHZFdzZuM3YweFlJcWJqanJna1lTU2V4?=
 =?utf-8?B?SGd3RmVhcDM0MVA2ZW1BcnpPTWlBUHlJU3B6VHhQc3cxcXN2UFZIZU9tY1hp?=
 =?utf-8?B?N3Q5TVhxR0t4MWNHZU1jZ3E5aHo3NkdJeHNCZVJhVXZKc2NBUjB6ZUd1MlhG?=
 =?utf-8?B?TUp1VEZVWjNRZVNZYVE3SXhBNHBvQ0FLM1hnWm51YlhVZ2tDNGlya1RKWHln?=
 =?utf-8?B?MHl4bVliWDNueFR6YlQ5bXI4TmFVWC9KNVloSlFROFRpY0lXRTluclhydWJX?=
 =?utf-8?B?aU9wOHNTaXpHcm9IRkQ5RGRheCs3dmhnMlpJcWdDa1ovKzQ2ckdaakVNbk9H?=
 =?utf-8?B?Z1FJcGowUlUrWENpQlhvaUJXRzJhTmVhaVFIZ01NRml4aGduVzRnaWxmNUMz?=
 =?utf-8?B?cVlSQjdVSTVIdWNHQktMVGZJbDg4S0Z1Rm9na3hjR1FWT3R3SlgzdzFiQk1U?=
 =?utf-8?B?WS8rMnd3bXdQb3lURFBFRXp5dzIvUFZGVitBdUluQm10aVpvdXluczN4UVMw?=
 =?utf-8?B?OGluVlAyNXpuZnJYQ2NyUkwzZlVOTkFqcW1yMnZMUnZ6Tk02RzBBbGd2bXlJ?=
 =?utf-8?B?elcyS1I4OVZQbDFIR0VGa2VaanNyeW96bWZTcTNsMEJKZVYvNElSbkhxN3k3?=
 =?utf-8?B?bGRhMzROZnBQS2laR3ptSThxOEJPbXAyYVlnTFEvNlRJMS84ZXZsT1h0bU1a?=
 =?utf-8?B?aHBlMlo5M2VSRWdISGdoYTVpTHBBUkFLWkNjT3RaQ05qUmdjQ2c1YzNuc1dD?=
 =?utf-8?B?ck1oWXpDd2NpQzR0RVVYd1oySHg4M25VM1BLS1ZjbnRMTHZqZi9ZbER5OG94?=
 =?utf-8?B?OStKYUJvRFJ4Z3ZMbW1Yd0ozZEU0UDUxQldsZm4zM04yV2NkUnhOdmJlaVEw?=
 =?utf-8?B?c3BQMTVMQWFraEVhZmRnc1NMRnpxMEhlK3FQN2VmTHNRMzBtN21DOXRRbEpT?=
 =?utf-8?B?Sk9sUWVycFkrbVNzd1hiMmZvZEp6emlBSU1BVGlWNU1sY0ZBeWhUcC9oMlcy?=
 =?utf-8?B?ZDY2ZTlZZEp3OGtjamlmMUM3VlFNWkNtQTFlRnhkSk15NlhDQ2JOMytENnNL?=
 =?utf-8?B?YnA2UjBHNUJ4TkU2UTd6ekRidEMyUFl5MUNZTjA0emdaRUZ3cEhoUERUR0ov?=
 =?utf-8?B?Y0QvMVYrUTRCQVVWWmdnSVBrdk5ibDBBM29jaHFPaHFNMEpvTkRwSDhoOGFR?=
 =?utf-8?B?dTFVVTJZckxnNFJGeFBhVkZEWkpiNEVTQUJ5WCthemNRdGZRcTZ2UDN1ZWly?=
 =?utf-8?Q?WY8tSVTxXIc=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MN0PR11MB6011.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q1IxSjMzYmFKVmlmVUpRUFMyTXVnUG9Ub0tDOTdDcHdIbDBNTVJabDhYVGxa?=
 =?utf-8?B?azVJd2EvZ0tQejRhb3JuNzJKeGNSUnhXcHRia0hvZUZneHdCK1dBZ1J3WTJV?=
 =?utf-8?B?cmRzd2pxNFJNUExmQzRKem1Id3krbnRORkloTGQyK0JGS1BhK3pTempkdmRw?=
 =?utf-8?B?U2V1NEpOZDVEWTNLd2UyZW1lOUh1VTl6a0YvQkFPblQ2LzNML1pMdXZFQzNO?=
 =?utf-8?B?RXNrayt4TG1tZ1M4dDdmTTdLRGV0c25VcHA2Y1pwTjlJS0g2RGVnZGZCWm1m?=
 =?utf-8?B?WnV6K3BHeFhCTWJVdThIcEl1dVR4ajJGait4azJlY280cmFIM2RwNVhaTVFk?=
 =?utf-8?B?Lzh3MGhtUVVaSFB2VVJwdUFLdjl2SlJtaklpYXlTM1BtVHJjQWxwcE81Z0RU?=
 =?utf-8?B?OUpNcHVGeDhXV1pNUzBvT3RuL0pjbXBSV1F5VVJkVWd4ZkRMZ0dhcm1UK2VR?=
 =?utf-8?B?Ylp2dDZ5Qjc0UGZoVUE4Rm5aUzdMbzlSS0ZSNTNscHorY1pXaUdtVXhBS3NM?=
 =?utf-8?B?Q09uSzdxUDBBRVdVNjdVOWo2OGRSTWtabnJPOUZSelFjZmV2V3lDM2ZvTFFh?=
 =?utf-8?B?QlBPOHN0UjV2LzZsem16SXFQQVVLNVpWQkpzVElEQVZvSFRuMkVXY2F1K3JH?=
 =?utf-8?B?Y05BZEg5RVVST1BIYnhtSy9KZlgxVC9HMDVaYzhzVU9BbWdDQ3FvYzhGOWhO?=
 =?utf-8?B?amNaSmNNb2oxRXJYeis4QVlRS2xQaURkWFIyUWdDOE1weVFLbXJ1M1ZTM0Ev?=
 =?utf-8?B?bmFrY0pUODFpeXJzWjAvUEhHdEFhMi9lem12Nmh0V1NmMkpjMGx6eFE0UFJu?=
 =?utf-8?B?eGp0cHRTNzg2cS9lZ0lVS1pISEEwMU96bCtzYjg2eCtVNHA5WmRvNCtqRjBK?=
 =?utf-8?B?WngzYmQzcWp5Sm54VjZ3WHJpOW5mRDRkK044elExblpBc09nTXJ4ZHpzYThB?=
 =?utf-8?B?OWM1OHAxVitZeHJ3aS9kQ3RFOTg4SnBxcjVaVmNUNGFuUGljc2I5Vm9yeUtw?=
 =?utf-8?B?RTJVdzhlTkpYcW9IWWRsWGJyZmppNzkyWWxHaUp6UmJ1bC9uclBNOTgrU0gy?=
 =?utf-8?B?dWs2ellzTU5VcFZSMjZkV2RHazVWajQrVDhjM0FESWxCS1Bnb2ZHK1RURGQ3?=
 =?utf-8?B?VGNjRzRjMUtOcGpoOEx3eStpVXk5eW9FNmFVOUphb0orL1FEZ1djMHRFMEpZ?=
 =?utf-8?B?ZU9iOWZxVStqYXI2TWdwbm5tajdUYk43M05VcXdsNUdJQ3NHWXQxbzBOeEdJ?=
 =?utf-8?B?RFlxa1FocFBNV3ViYk5FMUpOV0l0NnNiTlpMTzE2ckxueUNVRW1UcU8wZXlT?=
 =?utf-8?B?M3BOSzRDSjNUOEdpajR2NGdvNXlpeDFWWUFZamFuVWJ4QkJoWjI1UFdBa3h5?=
 =?utf-8?B?cnBLZlhtNDZoZlFoa0JFZjB6ditIVFhOVXJlcHBud2hic2FFdTI3R0VUR1hC?=
 =?utf-8?B?MTN1ZVVacVVMMGJtVGh6V25RYlNsYWRNcExVSGJvL01adWdZTjgyUnNiTXh2?=
 =?utf-8?B?eWRkSUtHKzZLUlpLRzZTOE9WWkc4Z3lxbVRBVXNqSkpTL0g5aHR6d0g4Z04z?=
 =?utf-8?B?Z2dJQ2RzRzhZNUJnUTJNNFdvajhhcU5uYlRaQ3FJNTJISjdGazI1VmN3MWly?=
 =?utf-8?B?M1VyZWZmMThGN3hvZUhWdUZCZFRyTk5PeFJjZTJzd1JIWFFaQlNLS2ZqcUdD?=
 =?utf-8?B?WDIzZ2hOcU42NnErckZGa3VKRXNmYy8rbXVCQzhnV0YzS3h0Qk9PWnFHbUJh?=
 =?utf-8?B?Nk5qbDRTZFQ1clM2YjhNazBOUys3bE1xQlErRzFyUi9JMkF4Y2dLdUlnYWpw?=
 =?utf-8?B?MDBYMmhqVGN6Vk9NTzFsamN0RVBPTXRhWUkrMkhSVnFuaDczTnRTR0VycFlU?=
 =?utf-8?B?VnR3NTRXbVduVklybG5Fd3hUUUpjQnVOUktwb00rNHRwQVltRXZjR2lKcEdS?=
 =?utf-8?B?NEh1Y01qdzJoVU5IeVpGcXQxTWNieVYyQ1FsUWFpWnRwSTdxYmZUZzVmRDdG?=
 =?utf-8?B?dWF4dzZEYmhhQmtEZnpGRTZwU1RZeTIrQ2VCaVJ4bHN4Yk1WRGpWdUM0WEln?=
 =?utf-8?B?VVpUbVJTYVZIUVZnZlFsc0hDR0FUZmxneFhHeHVXbWJBL1B1TnlDQ0FEQ0Mv?=
 =?utf-8?B?TG91Nm9INU4xMkJXTjlSQlE0cTZkNGV6UWt4STR0Um0yYXBrN05jM3NVMlJ4?=
 =?utf-8?B?WEE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 7639483c-301f-4d5e-5763-08ddf5d46192
X-MS-Exchange-CrossTenant-AuthSource: MN0PR11MB6011.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Sep 2025 10:24:27.7313 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8+0arw0ffZ+Pi9PZvBzPaQFHWlw31JjJ9gLYnAaNfLBflZ9vSFG9hYYsX446KKz23Y9t+Rh/qdcR6sIdt2sSmXPq1KJ2fephGUkHxgcTu8s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR11MB8677
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



On 9/17/2025 8:18 AM, Raag Jadav wrote:
> On Tue, Sep 16, 2025 at 07:00:29PM +0200, Michal Wajdeczko wrote:
>> Instead of manually maintaining each sysfs file define and use
>> attribute groups and register them using device managed function.
>> Then use is_visible() to filter-out unsupported attributes.
>>
>> Signed-off-by: Michal Wajdeczko <michal.wajdeczko@intel.com>
>> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>> Cc: Raag Jadav <raag.jadav@intel.com>
>> Reviewed-by: Lucas De Marchi <lucas.demarchi@intel.com>
>> ---
>> v2: rebased, reordered
>> ---
>>  drivers/gpu/drm/xe/xe_device_sysfs.c | 104 +++++++++++----------------
>>  1 file changed, 41 insertions(+), 63 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_device_sysfs.c b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> index 896484c8fbcc..c5151c86a98a 100644
>> --- a/drivers/gpu/drm/xe/xe_device_sysfs.c
>> +++ b/drivers/gpu/drm/xe/xe_device_sysfs.c
>> @@ -71,6 +71,15 @@ vram_d3cold_threshold_store(struct device *dev, struct device_attribute *attr,
>>  
>>  static DEVICE_ATTR_RW(vram_d3cold_threshold);
>>  
>> +static struct attribute *vram_attrs[] = {
>> +	&dev_attr_vram_d3cold_threshold.attr,
>> +	NULL
>> +};
>> +
>> +static const struct attribute_group vram_attr_group = {
>> +	.attrs = vram_attrs,
>> +};
>> +
>>  static ssize_t
>>  lb_fan_control_version_show(struct device *dev, struct device_attribute *attr, char *buf)
>>  {
>> @@ -149,8 +158,16 @@ lb_voltage_regulator_version_show(struct device *dev, struct device_attribute *a
>>  }
>>  static DEVICE_ATTR_ADMIN_RO(lb_voltage_regulator_version);
>>  
>> -static int late_bind_create_files(struct device *dev)
>> +static struct attribute *late_bind_attrs[] = {
>> +	&dev_attr_lb_fan_control_version.attr,
>> +	&dev_attr_lb_voltage_regulator_version.attr,
>> +	NULL
>> +};
>> +
>> +static umode_t late_bind_attr_is_visible(struct kobject *kobj,
>> +					 struct attribute *attr, int n)
>>  {
>> +	struct device *dev = kobj_to_dev(kobj);
>>  	struct xe_device *xe = pdev_to_xe_device(to_pci_dev(dev));
>>  	struct xe_tile *root = xe_device_get_root_tile(xe);
>>  	u32 cap = 0;
>> @@ -160,51 +177,25 @@ static int late_bind_create_files(struct device *dev)
>>  
>>  	ret = xe_pcode_read(root, PCODE_MBOX(PCODE_LATE_BINDING, GET_CAPABILITY_STATUS, 0),
>>  			    &cap, NULL);
>> -	if (ret) {
>> -		if (ret == -ENXIO) {
>> -			drm_dbg(&xe->drm, "Late binding not supported by firmware\n");
>> -			ret = 0;
>> -		}
>> -		goto out;
>> -	}
>> -
>> -	if (REG_FIELD_GET(V1_FAN_SUPPORTED, cap)) {
>> -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_fan_control_version.attr);
>> -		if (ret)
>> -			goto out;
>> -	}
>> -
>> -	if (REG_FIELD_GET(VR_PARAMS_SUPPORTED, cap))
>> -		ret = sysfs_create_file(&dev->kobj, &dev_attr_lb_voltage_regulator_version.attr);
>> -out:
> 
>>  	xe_pm_runtime_put(xe);
> 
> The device is already in D0 while probing so runtime PM is probably
> not needed here.

true, but this is how it was initially coded and I didn't want to change it now

we can either drop it completely or replace with

	xe_pm_runtime_get_noresume(xe);
	xe_pm_runtime_put(xe);

do you want this to be done as part of this series or it can be done later as follow-up?

> 
> Raag

