Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC279C10F1A
	for <intel-xe@archiver.kernel.org>; Thu,  9 May 2024 11:48:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFACD10E039;
	Thu,  9 May 2024 11:48:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="JoD1VLMj";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75D7F10E039
 for <intel-xe@lists.freedesktop.org>; Thu,  9 May 2024 11:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1715255292; x=1746791292;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=JhfW/ZP+/4f4z2SIJCGfTdx20yNUd0Gewdl20Q2H38s=;
 b=JoD1VLMjqPXOKLfXDQNZ3ckNEvyFNduB+Bg5NgxVwNcw8cv3QDqxv2Yr
 ouLaktoow+sZn/s2gWNPoj8U90T1o63l+cxZYhxkOpM0aZxWYsjY/kZHF
 QSw7uDPCiM3AEFAyxCRbjGXJ1aY4xXBJjsRVAVFE3upicBCGMmqGaqLMk
 tdeT+iVhhhh8QxxKrfpL58AXEemat8jr5Y1yRDZzRtAltoYKbDJP5ONx8
 PyoW8sZuC1obFJxcwjpUDGksID3fpssWdBSLwrsGbGesVVINvsPAP23MR
 kjUBq4PPMiGw26fHebWOcGMVuQcXkiS3FUehHrfxJfSH6vP6j2VetzE6H g==;
X-CSE-ConnectionGUID: Ei0LH/jaTEe1foXaT2ZUBw==
X-CSE-MsgGUID: gJpEkc+wSi23c7qMH7i2Rw==
X-IronPort-AV: E=McAfee;i="6600,9927,11067"; a="21841510"
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="21841510"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 May 2024 04:48:12 -0700
X-CSE-ConnectionGUID: y/VDoUPjQPaeaZ3sG+5bZA==
X-CSE-MsgGUID: 1n5SfxYeSsujdkK9u2o6VA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,147,1712646000"; d="scan'208";a="33685871"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by fmviesa005.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 09 May 2024 04:48:12 -0700
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35; Thu, 9 May 2024 04:48:11 -0700
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.35 via Frontend Transport; Thu, 9 May 2024 04:48:11 -0700
Received: from NAM12-MW2-obe.outbound.protection.outlook.com (104.47.66.41) by
 edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.35; Thu, 9 May 2024 04:48:11 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZwqudGhvemu8OEpEj9zG8H9sqcDJWSOVB8AkzuAZyCz5fuVuFpACHhNrgjWKGjyw4gWlfEWfVlr6nprkEvf6+2HrL+JvUT+Rt5PDZOLpZM/vMvdygDKKvtW18pJnn8YP6BnyCOOmKW6PYJcAfMRcvQSZ8MdnYHt5ZRV94G0ngtz0ivRmK+ab9sV6v3u2cMIPtUXldVCDNUxvyQzVtbe3pLJppaWfo4tcJyzyGOnFuoaUtCjTvigC3ElwCuvs62JEe6UDVzpC1opEjf0QEpm95we0WOuiZgOsLMDvCLF9WD/qqb5epGuAgKD2ccADS4Vpso3/8l4ho4cucY1EqNRxzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JhfW/ZP+/4f4z2SIJCGfTdx20yNUd0Gewdl20Q2H38s=;
 b=HQyk1moIHEYV83jqTlHW+aXh2SFN2vy5op1Tg82kPutiylFgE016cpfeHdet/nMfr1dEdluZuDGMUoBoYTqPQCkeWH7Uq+tVNM7AwtXw0eYyWiJ87MGRHosMLhobOKhGom3KyqVdeTrkLWPlEiJLgBmSkhXoMV2gjtWZINVtI76AC1cm+ooFf+nmV7BPE9Q7iJcbWiJyvsNDrM4HF2S9d+KZbrqD3/AZfXBwD1h9zZ6tBsIvq59jkIdTKyJkPv+pEDYCtmoGhiiFTKM6TI3Fc7ezUpc0VdDAmuL38UxX3elmOeNp0I2iM35zQjwWJx+rrHQExDOwnrx3nNpkjaaWmA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6211.namprd11.prod.outlook.com (2603:10b6:930:25::6)
 by SJ0PR11MB5119.namprd11.prod.outlook.com (2603:10b6:a03:2d6::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.35; Thu, 9 May
 2024 11:48:09 +0000
Received: from CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1]) by CY5PR11MB6211.namprd11.prod.outlook.com
 ([fe80::df5a:a32c:8904:15f1%3]) with mapi id 15.20.7544.047; Thu, 9 May 2024
 11:48:09 +0000
From: "Gupta, Anshuman" <anshuman.gupta@intel.com>
To: "Vivi, Rodrigo" <rodrigo.vivi@intel.com>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>
CC: "De Marchi, Lucas" <lucas.demarchi@intel.com>, "Brost, Matthew"
 <matthew.brost@intel.com>, "Dugast, Francois" <francois.dugast@intel.com>,
 "thomas.hellstrom@linux.intel.com" <thomas.hellstrom@linux.intel.com>, "Auld, 
 Matthew" <matthew.auld@intel.com>, "Nilawar, Badal" <badal.nilawar@intel.com>
Subject: RE: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Thread-Topic: [PATCH 4/7] drm/xe: Relax runtime pm protection around VM
Thread-Index: AQHanY38LjumPJ2o8kqK70I0vIlkp7GO0MXQ
Date: Thu, 9 May 2024 11:48:09 +0000
Message-ID: <CY5PR11MB621196A10CC9B803883CFE5095E62@CY5PR11MB6211.namprd11.prod.outlook.com>
References: <20240503191309.7022-1-rodrigo.vivi@intel.com>
 <20240503191309.7022-5-rodrigo.vivi@intel.com>
In-Reply-To: <20240503191309.7022-5-rodrigo.vivi@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6211:EE_|SJ0PR11MB5119:EE_
x-ms-office365-filtering-correlation-id: 2be863f0-49e5-4a1e-e734-08dc701de628
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|376005|1800799015|366007|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?blRKaUVOUVRscThQWmtwbEtmVk5xTUgvcnRnbWN3d09idWptK204d0llbitv?=
 =?utf-8?B?MEJYQmZVclgvSGhaeWVhemk0OGJ2VXhwWXZvaGdWQUp4K0UwOVJnNTdXeWlJ?=
 =?utf-8?B?dUd0TWh6ZFQvVFJ1WDRjY0NVQlFBTkR3TmFJVmxoTDVGd0h0MHVjbitsVGhL?=
 =?utf-8?B?eEJMYjljeWZWd1o5WFZsemF1dkU4OHI5YnVYZy9YRWxKYXJHN2cza1gwVUc0?=
 =?utf-8?B?eGNmazFHTWJveG04aTZIem9FSFhHVEhRVU4wbmtZVnowSHNTcmxoVG9WMGdy?=
 =?utf-8?B?R0JTVFNtWU1pcWZHUHZyTnVjQzZwcDR6eFMzU0ZpZFdjSjJKWXpHbnBWWlM5?=
 =?utf-8?B?SlAyQlhkS1hoZWlqaERhQ2xjb3lCUlJNUnJPUkhFOEF1MXFXTWQxOFVEb0FK?=
 =?utf-8?B?Y3hJY0R4WHRpZDVBazFEOFdOeDdLa0VCNXJQaWp5YkV2Z1NtUFBDQ1JqRUJP?=
 =?utf-8?B?U2tBME12a09IUCtEY1JxaWxiQWNHcEFueGpQa2Zkd1g4cC9lVjdORmplVTFo?=
 =?utf-8?B?dnhzcDl0SFhsL1VTOGd2VzlseHgycm8rUVhxTk0vSTJ1di9RdWpVOUhQbHRU?=
 =?utf-8?B?ZDRoMTJoUWp1REdQSHFVaDNzbSs5Y2puL0JiZ29NVVhJY2xBbndKYnREQUFU?=
 =?utf-8?B?MnhyK1dxSjlHVkR4QzZkWUJISHZ5V20yb25Va3FER0xlQzh6QWhqSnV6aEVQ?=
 =?utf-8?B?em5wQmhkQk1yVzEvZ1VkQUJMSXdIbXFITy9ZWlJJS3cyeENNK3VvT0V3S1oy?=
 =?utf-8?B?R0ZMM2cxL0VEM0dtMFBmQSs2WnBwQ3hCb0pSRVFObTR1cTFRMHJBbVIvUVF3?=
 =?utf-8?B?TUtWdXNrUzZlWDcvbGFvay9hZkxjcjlnWVQ0dWJqWVRjM3d4MUp3cEh3dUVC?=
 =?utf-8?B?UXNHeTIyTHVzbmZUaTI2NFZQMDVMd3Uxc3ZkYmhTQldrN3dCNHAwNUx2WHBo?=
 =?utf-8?B?TDBTK25tZkJ5SWtlOWFvNzcyYnhDUzl2aGVBMFBQZFh1bHZGcC8zSGxIaXdQ?=
 =?utf-8?B?Tk9iVzQ2WDM5U0M1QnNjMDgvVkwvcnZzdG9RU1JUeWpJK3Q0ckl2eHRJUkho?=
 =?utf-8?B?NS9MWjJTMmtKTFFTWG9QcXVOeGtYZm1WbkNsems3dVBESDRZZGZheGN1S3Qy?=
 =?utf-8?B?RkhscTJCZEFlaE5tTzJRV0lsaTAwS0diM3h0Z1dXTXZHS05WdkFNNUlyZXhO?=
 =?utf-8?B?cCtXUVhqQmorNkhCcjNza2dsQnNpamhhTkVVUHo1MU81S3I1S3d0U0ZybHl6?=
 =?utf-8?B?bE85UGxlY0JObi9YS2cvRWhLeWNDZEJwdTR5MEdiN042NnVFOXFzVVRacUFT?=
 =?utf-8?B?LzJRNzgvcTRzN3lnckp4ZDFmeVp2TkxpcE5QcG5pcU02RjFaWWhKYkZUbW16?=
 =?utf-8?B?NjNzZ0lxZGx4NDQvQzdTWW5CcHJQY0VtZWM5RzBtaFVaa0ZKUEp1bVlCT0No?=
 =?utf-8?B?NS9JWXFRSzlaeS9kY3Y5NFRNZmhqTEFpRTZrTmtqNG5IMTBwUFRudVIwYjIw?=
 =?utf-8?B?TVRBR0VsMm84ZCswRzhpUVZ6REhGcnptUU8vZ0dHVDFZVUlRUStMWnlpQUU0?=
 =?utf-8?B?ZkprdG1IZDhSTzhOSEQyQmdnTXFwallCNUxYd0oyU291OHB4aTVWQjZ4d1c1?=
 =?utf-8?B?eDNCR2p0ZW5CUktaWUwxeVNWVS8xK3dJRG5UZm5tb0FDR2h6a0dMelZnSkh5?=
 =?utf-8?B?Uk1KMnZxR3RKbHZIUFI5Qmo0UXZTdmpqMVkxKzJ1UzhrRlFLQmRyQTh6Q3VH?=
 =?utf-8?B?TmJnTlUyc21CZWRPYTBFTUZTTVEydUpqQS90dHMvR1A1bjd5WXZtSHk1Snhm?=
 =?utf-8?B?RWJYTzdHMTJLdVlKYUE4Zz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6211.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(366007)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?S0pPQmt2Qmc3WldiT29tNmdKTmxWTXZFZlVJY3hhM2YxV1Q0ME5HWnAreVFj?=
 =?utf-8?B?dVNIUWRxN1NoR0d5akxkcEdzditlcFg4Y24ydUF6NzBOZ0xxbFlMdEUxRmNQ?=
 =?utf-8?B?MDllT1dmeEhEQmVaK3FxdVBoRlRzN2tPTDA4SnFYYVJqOGFKT3duMVpRR1N0?=
 =?utf-8?B?MzFiRUFZM0NRMkpZWWNpMzdBWkxJVjhxcE9IQmRuRzhFaGtYM1RJRUg0S25o?=
 =?utf-8?B?bXlTTk9lYk00ZDB2d3I5L2wzK0RWVVhneUtnVXdjcFhnMHdhQjhNWDkwcTRl?=
 =?utf-8?B?ZUF3OHBkVzhRYk9QL25MYlZZZzlNeHAzdEF4VjRsWnFXeDBvbW1hMmtzdUMr?=
 =?utf-8?B?QU1oajhIeUltY2hubnE2d1U0WHN4QmpORFcrdVUwWkw3V2tsRzhpT0FOUGt1?=
 =?utf-8?B?cXUvVWZ3RnBmUXY2YzRSZjFCdExvTmcrWWR0K3BJc3liSld0NHhiZWZlaXdY?=
 =?utf-8?B?end6WXJWdGZ3eDE0bzdOKzJyb0xnMjZQSkJkanZtUVFJU1VMQk1HVXlTbkpN?=
 =?utf-8?B?UDRVTnYxMXBlb2xnUlFHaEV5NnQ4SGZhMGlPL1I4M3RqZnZkTk5QTEwzYzlm?=
 =?utf-8?B?QStYS29FTDJ5a3p5VHRCcHFtWDZhUUFwbUZUVFh4WGNzUnk4dTlVMjBvbEdB?=
 =?utf-8?B?amhxSnJjeTRnL0hvSS9zZzNHelZXazJKV3BENjlWOFR3NTdRR1NEeVd3cmk1?=
 =?utf-8?B?R2ZSK3RNZ3QwdGRxR09mVU5Fb29qMXBkczNDSXl3NUp0Z3c5cGFSQXFXQ295?=
 =?utf-8?B?cWV4ZTFtMDlKaWgzRDFmSE4ySGtKbGt3YWF1aDdZV0NHUVV4ZHRMakJadUVQ?=
 =?utf-8?B?TWZLT1B0eVVDaURkalNJd2FrMHdiR1VCeVhEYjEydlZNNWJsNzZ4R3ZTa3lv?=
 =?utf-8?B?STJxSmZEVVA5bHRRNEZiZU9tais0TkYwc3BZeXBUbExEZCtTbEUwb0VvcjBZ?=
 =?utf-8?B?QWZaU29CSW91MU10Q2t6RzdkQ3dIb0xmNXBpZGJ5di9YQ3U5L2R2RmJLYjFN?=
 =?utf-8?B?TGVtdUorcjBCeFhlRm9OMmdDRUtNUDRTWUFRTjJJeit6T3JYakFzOEJ4TWRr?=
 =?utf-8?B?M3FSNGM3NVF4eVNibGUzSmZMblJIMEN2aWZpTHNnNkgyYmhtMlk1NFJhRmd6?=
 =?utf-8?B?YkpkUi8wT0lnOWdYUUUzTUhZeHRuYzFGSVc2YmgrUWpabzZGbDRjd05hYk9B?=
 =?utf-8?B?b0w4OURGVmNhc0Q3YTlNUmx0Ymo1Y1lhZnRWNFRQRGJGOEdUSE0yU0ZXT094?=
 =?utf-8?B?Rk4wMHNvQWhGSEllTFBRMEV2ODgyQjhZakJNc0xVUTFyUUhhRGh1Z00yZ3pP?=
 =?utf-8?B?TmtvejRsbm1sSC9uUTZXRmErcFhreTN5VU5JTUZjcDN3dlFhUWlmbnJLNC9Q?=
 =?utf-8?B?dXZuK3NwZm9kMXVFUW1LRFR2ejViNlR6ZEEwcW9IVU1uNmJ4RTRaMEVkQ0c1?=
 =?utf-8?B?UDBUaEpHQjJzYWkwUHNRZGVCN3RoVEZWdFBrUCsvb0h2anhKVE5nR1VhbnZ6?=
 =?utf-8?B?T0dOV3I3NmxkV0hFWXcxb3Q1RFc3T1pUTGllV0xEaFVHdU4wMHZIVlFQZkh2?=
 =?utf-8?B?TmFjZ2xweTJ6Yi8wTldFZmNHL2NQK0w3WVlBQmVBZXVOYlgwY09tS1N2Wjln?=
 =?utf-8?B?QTFOMTdmeklQMk5LKyt3SXVrTlV6d2tIVUxiZXFHSUNWalcxekVldmJmeHh3?=
 =?utf-8?B?M0wraTAxMm91cTNZc3FQR1dPNCtUSXQ0TUFTb2prOXVIZ0d3Ylc1V0ZOZ2lE?=
 =?utf-8?B?VXY1ZFhldW5PTFJtWGJPem5ITXBqRUFyVEExZWREVEc1ZjdaUkRsMnloZ3Y1?=
 =?utf-8?B?QjdVdGhsYmtrZ2x1ZFNUMDI4VVZEUmtVZ2prMlU1OHRwekwvRFVLQzdLMmY2?=
 =?utf-8?B?ck5DTnF0dkFFczg5VElacG1pcEd1RU1JMTJjZ2IvL1ZUM04wekFwcnR5cmZF?=
 =?utf-8?B?eDZ6K2lhbEpPR2NkVlhRTTUySEJUWjFNS0VaOXpvZ3NFc3QxYWdpQlFpQm9V?=
 =?utf-8?B?eEliM2lNWERRb3JxeFdFMktieUJid1Z1dVE1eFRHYWNjYnNOcmhaUmdEb0Ru?=
 =?utf-8?B?MDVJaEJqWkRYZFpLVTdGdGY1NWE3bjNMN0x0dXRPdnk3NzUvTXByZ1lJTUkz?=
 =?utf-8?Q?CJ5oWQOngfAPGpdQieFzCecQs?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6211.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2be863f0-49e5-4a1e-e734-08dc701de628
X-MS-Exchange-CrossTenant-originalarrivaltime: 09 May 2024 11:48:09.7129 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: LEC+ufkCv7NmO90oUUPEAUhvXwvJcvyQuyr/e5TlxhE8zrzlbijAfhcqGt84pTedHFM6IwZ1zKxDEZHTzUZ6Qamj8Xs7WvaW0Bi7oA0EW+8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR11MB5119
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

DQoNCj4gLS0tLS1PcmlnaW5hbCBNZXNzYWdlLS0tLS0NCj4gRnJvbTogVml2aSwgUm9kcmlnbyA8
cm9kcmlnby52aXZpQGludGVsLmNvbT4NCj4gU2VudDogU2F0dXJkYXksIE1heSA0LCAyMDI0IDEy
OjQzIEFNDQo+IFRvOiBpbnRlbC14ZUBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gQ2M6IERlIE1h
cmNoaSwgTHVjYXMgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNvbT47IEJyb3N0LCBNYXR0aGV3DQo+
IDxtYXR0aGV3LmJyb3N0QGludGVsLmNvbT47IER1Z2FzdCwgRnJhbmNvaXMgPGZyYW5jb2lzLmR1
Z2FzdEBpbnRlbC5jb20+Ow0KPiB0aG9tYXMuaGVsbHN0cm9tQGxpbnV4LmludGVsLmNvbTsgQXVs
ZCwgTWF0dGhldw0KPiA8bWF0dGhldy5hdWxkQGludGVsLmNvbT47IEd1cHRhLCBBbnNodW1hbg0K
PiA8YW5zaHVtYW4uZ3VwdGFAaW50ZWwuY29tPjsgVml2aSwgUm9kcmlnbyA8cm9kcmlnby52aXZp
QGludGVsLmNvbT4NCj4gU3ViamVjdDogW1BBVENIIDQvN10gZHJtL3hlOiBSZWxheCBydW50aW1l
IHBtIHByb3RlY3Rpb24gYXJvdW5kIFZNDQo+IA0KPiBJbiB0aGUgcmVndWxhciB1c2UgY2FzZSBz
Y2VuYXJpbywgdXNlciBzcGFjZSB3aWxsIGNyZWF0ZSBhIFZNLCBhbmQga2VlcCBpdCBhbGl2ZQ0K
PiBmb3IgdGhlIGVudGlyZSBkdXJhdGlvbiBvZiBpdHMgd29ya2xvYWQuDQo+IA0KPiBGb3IgdGhl
IHJlZ3VsYXIgZGVza3RvcCBjYXNlcywgaXQgbWVhbnMgdGhhdCB0aGUgVk0gaXMgYWxpdmUgZXZl
biBvbiBpZGxlDQo+IHNjZW5hcmlvcyB3aGVyZSBkaXNwbGF5IGdvZXMgb2ZmLiBUaGlzIGlzIHVu
YWNjZXB0YWJsZSBzaW5jZSB0aGlzIHdvdWxkDQo+IGVudGlyZWx5IGJsb2NrIHJ1bnRpbWUgUE0g
aW5kZWZpbml0ZWx5LCBibG9ja2luZyBkZWVwZXIgUGFja2FnZS1DIHN0YXRlLiBUaGlzDQo+IHdv
dWxkIGJlIGEgd2FzdGUgZHJhaW5hZ2Ugb2YgcG93ZXIuDQo+IA0KPiBTbywgbGV0J3MgbGltaXQg
dGhlIHByb3RlY3Rpb24gb25seSBmb3IgdGhlIGxvbmcgcnVubmluZyB3b3JrbG9hZHMsIHdoaWNo
DQo+IG1lbW9yeSBtaWdodCBiZSBtYXBwZWQgYW5kIGFjY2Vzc2VkIGR1cmluZyB0aGlzIGVudGly
ZSB3b3JrbG9hZC4NCj4gDQo+IFRoaXMgaW5kZWVkIG9wZW5zIHVwIGEgcmlzayBvZiB1c2UgY2Fz
ZSB3aXRob3V0IGRpc3BsYXksIGFuZCB3aXRob3V0IGxvbmctDQo+IHJ1bm5pbmcgd29ya2xvYWQs
IHdoZXJlIG1lbW9yeSBtaWdodCBiZSBtYXBwZWQgYW5kIGFjY2Vzc2VkIHdpdGggZGlyZWN0DQo+
IHJlYWQgYW5kIHdyaXRlIG9wZXJhdGlvbnMgd2l0aG91dCBhbnkgZ3B1IGV4ZWN1dGlvbiBpbnZv
bHZlZC4gQmVjYXVzZSBvZg0KPiB0aGlzLCB3ZSBhcmUgYWxzbyBhZGRpbmcgaGVyZSwgdGhlIGV4
dHJhIHByb3RlY3Rpb24gZm9yIHRoZSBzcGVjaWFsIHZtX29wDQo+IGFjY2VzcyBjYWxsYmFjay4N
CkFGQUlVIGZvciB0aGlzIHBhcnRpY3VsYXIgY2FzZSB3ZSBhcmUgYWxyZWFkeSBoYXZpbmcgcHJv
dGVjdGlvbiwgYXMgd2UgYXJlIGludmFsaWRhdGluZyB0aGUgcHRlIHVwb24gZW50cnkgdG8gcnVu
dGltZSBzdXNwZW5kLg0KU28gYSBwYWdlZmF1bHQgc2hvdWxkIHdha2UgdGhlIGRldmljZS4gVGhl
cmVmb3JlIHdlIGRvbid0IG5lZWQgdGhpcyBleHRyYSBwcmVjYXV0aW9uLg0KVGhhbmtzLA0KQW5z
aHVtYW4NCj4gDQo+IEluIHRoZSBpZGVhbCBjYXNlIG9mIHRoZSBtbWFwcGVkIHNjZW5hcmlvIG9m
IHZtX29wcywgd2Ugd291bGQgYWxzbyBnZXQNCj4gcmVmZXJlbmNlcyBpbiB0aGUgJ29wZW4nIGFu
ZCAnbW1hcCcgY2FsbGJhY2tzLCBhbmQgcHV0IGl0IGJhY2sgb24gdGhlICdjbG9zZScNCj4gY2Fs
bGJhY2ssIGZvciBhIGJhbGFuY2VkIGNhc2UuDQo+IEhvd2V2ZXIsIHRoaXMgd291bGQgYWxzbyBi
bG9jayB0aGUgcmVndWxhciBkZXNrdG9wIGNhc2UsIHNvIHdlIGFyZSBub3QgZG9pbmcNCj4gdGhp
cy4NCj4gDQo+IENjOiBUaG9tYXMgSGVsbHN0csO2bSA8dGhvbWFzLmhlbGxzdHJvbUBsaW51eC5p
bnRlbC5jb20+DQo+IENjOiBMdWNhcyBEZSBNYXJjaGkgPGx1Y2FzLmRlbWFyY2hpQGludGVsLmNv
bT4NCj4gQ2M6IE1hdHRoZXcgQnJvc3QgPG1hdHRoZXcuYnJvc3RAaW50ZWwuY29tPg0KPiBDYzog
RnJhbmNvaXMgRHVnYXN0IDxmcmFuY29pcy5kdWdhc3RAaW50ZWwuY29tPg0KPiBTaWduZWQtb2Zm
LWJ5OiBSb2RyaWdvIFZpdmkgPHJvZHJpZ28udml2aUBpbnRlbC5jb20+DQo+IC0tLQ0KPiAgZHJp
dmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgfCAxNyArKysrKysrKysrKysrKysrLQ0KPiBkcml2ZXJz
L2dwdS9kcm0veGUveGVfdm0uYyB8ICA2ICsrKy0tLQ0KPiAgMiBmaWxlcyBjaGFuZ2VkLCAxOSBp
bnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQ0KPiANCj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV9iby5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX2JvLmMgaW5kZXgNCj4g
NTJhMTZjYjRlNzM2Li40OGVjYTlmMjY1MWEgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV9iby5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9iby5jDQo+IEBAIC0x
MTU3LDExICsxMTU3LDI2IEBAIHN0YXRpYyB2bV9mYXVsdF90IHhlX2dlbV9mYXVsdChzdHJ1Y3Qg
dm1fZmF1bHQNCj4gKnZtZikNCj4gIAlyZXR1cm4gcmV0Ow0KPiAgfQ0KPiANCj4gK3N0YXRpYyBp
bnQgeGVfdm1fYWNjZXNzKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25n
IGFkZHIsDQo+ICsJCQl2b2lkICpidWYsIGludCBsZW4sIGludCB3cml0ZSkNCj4gK3sNCj4gKwlz
dHJ1Y3QgdHRtX2J1ZmZlcl9vYmplY3QgKnRibyA9IHZtYS0+dm1fcHJpdmF0ZV9kYXRhOw0KPiAr
CXN0cnVjdCBkcm1fZGV2aWNlICpkZGV2ID0gdGJvLT5iYXNlLmRldjsNCj4gKwlzdHJ1Y3QgeGVf
ZGV2aWNlICp4ZSA9IHRvX3hlX2RldmljZShkZGV2KTsNCj4gKwlpbnQgcmV0Ow0KPiArDQo+ICsJ
eGVfcG1fcnVudGltZV9nZXQoeGUpOw0KPiArCXJldCA9IHR0bV9ib192bV9hY2Nlc3Modm1hLCBh
ZGRyLCBidWYsIGxlbiwgd3JpdGUpOw0KPiArCXhlX3BtX3J1bnRpbWVfcHV0KHhlKTsNCj4gKw0K
PiArCXJldHVybiByZXQ7DQo+ICt9DQo+ICsNCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3Qgdm1fb3Bl
cmF0aW9uc19zdHJ1Y3QgeGVfZ2VtX3ZtX29wcyA9IHsNCj4gIAkuZmF1bHQgPSB4ZV9nZW1fZmF1
bHQsDQo+ICAJLm9wZW4gPSB0dG1fYm9fdm1fb3BlbiwNCj4gIAkuY2xvc2UgPSB0dG1fYm9fdm1f
Y2xvc2UsDQo+IC0JLmFjY2VzcyA9IHR0bV9ib192bV9hY2Nlc3MNCj4gKwkuYWNjZXNzID0geGVf
dm1fYWNjZXNzDQo+ICB9Ow0KPiANCj4gIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZHJtX2dlbV9vYmpl
Y3RfZnVuY3MgeGVfZ2VtX29iamVjdF9mdW5jcyA9IHsgZGlmZiAtLWdpdA0KPiBhL2RyaXZlcnMv
Z3B1L2RybS94ZS94ZV92bS5jIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3ZtLmMgaW5kZXgNCj4g
ZGZkMzFiMzQ2MDIxLi5hYTI5OGI3Njg2MjAgMTAwNjQ0DQo+IC0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS94ZS94ZV92bS5jDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV92bS5jDQo+IEBAIC0x
MzQ3LDcgKzEzNDcsNyBAQCBzdHJ1Y3QgeGVfdm0gKnhlX3ZtX2NyZWF0ZShzdHJ1Y3QgeGVfZGV2
aWNlICp4ZSwNCj4gdTMyIGZsYWdzKQ0KPiANCj4gIAl2bS0+cHRfb3BzID0gJnhlbHBfcHRfb3Bz
Ow0KPiANCj4gLQlpZiAoIShmbGFncyAmIFhFX1ZNX0ZMQUdfTUlHUkFUSU9OKSkNCj4gKwlpZiAo
ZmxhZ3MgJiBYRV9WTV9GTEFHX0xSX01PREUpDQo+ICAJCXhlX3BtX3J1bnRpbWVfZ2V0X25vcmVz
dW1lKHhlKTsNCj4gDQo+ICAJdm1fcmVzdl9vYmogPSBkcm1fZ3B1dm1fcmVzdl9vYmplY3RfYWxs
b2MoJnhlLT5kcm0pOw0KPiBAQCAtMTQ1Nyw3ICsxNDU3LDcgQEAgc3RydWN0IHhlX3ZtICp4ZV92
bV9jcmVhdGUoc3RydWN0IHhlX2RldmljZSAqeGUsDQo+IHUzMiBmbGFncykNCj4gIAlmb3JfZWFj
aF90aWxlKHRpbGUsIHhlLCBpZCkNCj4gIAkJeGVfcmFuZ2VfZmVuY2VfdHJlZV9maW5pKCZ2bS0+
cmZ0cmVlW2lkXSk7DQo+ICAJa2ZyZWUodm0pOw0KPiAtCWlmICghKGZsYWdzICYgWEVfVk1fRkxB
R19NSUdSQVRJT04pKQ0KPiArCWlmIChmbGFncyAmIFhFX1ZNX0ZMQUdfTFJfTU9ERSkNCj4gIAkJ
eGVfcG1fcnVudGltZV9wdXQoeGUpOw0KPiAgCXJldHVybiBFUlJfUFRSKGVycik7DQo+ICB9DQo+
IEBAIC0xNTkyLDcgKzE1OTIsNyBAQCBzdGF0aWMgdm9pZCB2bV9kZXN0cm95X3dvcmtfZnVuYyhz
dHJ1Y3QNCj4gd29ya19zdHJ1Y3QgKncpDQo+IA0KPiAgCW11dGV4X2Rlc3Ryb3koJnZtLT5zbmFw
X211dGV4KTsNCj4gDQo+IC0JaWYgKCEodm0tPmZsYWdzICYgWEVfVk1fRkxBR19NSUdSQVRJT04p
KQ0KPiArCWlmICh2bS0+ZmxhZ3MgJiBYRV9WTV9GTEFHX0xSX01PREUpDQo+ICAJCXhlX3BtX3J1
bnRpbWVfcHV0KHhlKTsNCj4gDQo+ICAJZm9yX2VhY2hfdGlsZSh0aWxlLCB4ZSwgaWQpDQo+IC0t
DQo+IDIuNDQuMA0KDQo=
