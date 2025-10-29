Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77D17CCF9EB
	for <intel-xe@archiver.kernel.org>; Wed, 29 Oct 2025 21:28:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3558410E140;
	Wed, 29 Oct 2025 21:28:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="StTtPu7f";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 41CBB10E140
 for <intel-xe@lists.freedesktop.org>; Wed, 29 Oct 2025 21:28:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1761773320; x=1793309320;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=dDOT1h9aa9C1gaQj1c1U/tUwvBN88vivFKlzd2lKwro=;
 b=StTtPu7fQUqLzIFDJTJab6w0p8zrK+NB+E7t82BGDM9qVkaTMqfDP08+
 IdUcENlyYjoPkmG2eQPDwwdEF2xsS/FvgIYLfE9Gkh8QRSlE14JCHoBfW
 nDYvexpt1PG6Ici0UIh42FE/yGOfKeKhtUcRfjZ9qk3lSQx1Ffx+20/2L
 j25xvwVuq46vVIkcRnBKqkXgALNEQZEdkrP41/7yRPBu16K4cydgpg2Xx
 sHNgZZg4Dbfn2X7YfufuYx9WgiATXUtE4cYmnvU3DE7iovMG9r99RvAMv
 QXKVVREI+a5Upqhex5FhfG5/1ISID+W8eLd8GGjWs2FTbRbiUyuVo/GhB g==;
X-CSE-ConnectionGUID: rhm7017+SAK3q8sCzUX2oA==
X-CSE-MsgGUID: twlCEYF0TruqtG0KAaxBzg==
X-IronPort-AV: E=McAfee;i="6800,10657,11531"; a="67743025"
X-IronPort-AV: E=Sophos;i="6.17,312,1747724400"; d="scan'208";a="67743025"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:28:40 -0700
X-CSE-ConnectionGUID: 8iSUDmlmT6CGrtVOHolplA==
X-CSE-MsgGUID: ywQq7LVIS0ehFD89XG5+lw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; d="scan'208";a="184969602"
Received: from fmsmsx901.amr.corp.intel.com ([10.18.126.90])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 29 Oct 2025 14:28:40 -0700
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx901.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:28:39 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 29 Oct 2025 14:28:39 -0700
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.22) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 29 Oct 2025 14:28:38 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yMqnciGQ5rUiwZOsHxusVKFEPWFvbt1CtvGUOtBa8QlJyT2gVvhsr4YCw0cAl8Xnupy3vFIxQlz6suw4FDXYw1jVE5WnOGa+e0dAZvVmiGMijWCa2xfhuP28r6R1tvavdGwfWZIdsuxLBHiNzithym1vzoypLxTjLbqUDw3iUTAyGsmf4Ln4oKOozgUW/lA8KApn5YP++TboLOOMPzXlraiiaVRVFfv0Xv8xZnbwt5SXYLSRpHVYiw64gYGn6tJeFttgNIcAeOBsz5WzkYAF+RhNlmJ3r6W2I7n+UiwP64zxEI5AJr1ABPe2DlZDSzlR/YBszSX9wJ86xJMSLDryCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h4ANoLH62dszIFB7iseGA5VK3R9YhS62UaJQ9iDqlAk=;
 b=XCsU4OQodNyjFU3Rexhzs7rIt3A0RbNwsvILoFAafNbvmU561CsvmTqmyssPAYZoFq3dDKWZ0QiLOt0WH/lDI3dtg6hn6XCrKy/nR4yCI/U03sh96taGWCTT6Vo+69U6sB1gLdsZKVMoPO8mPuh7L3C5WsYYeuUmNkNMWIrUIccwcnWVSA80ZaDB2SI8bq9Lum9oxqaEoDcBc3doAsC43LDz7/NftlvuDuF5BmhsbLRZOvxWEHCtXFerUbDbfZ8+ZQWXcR1jlmGxSrg8hvktGECLkc7nSycWMhXifX+iHkwVbm4KzETSzDEySnyIFC6jMt/jFgFJuhLPssy7mF8XRg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from SA3PR11MB8046.namprd11.prod.outlook.com (2603:10b6:806:2fb::22)
 by IA3PR11MB9350.namprd11.prod.outlook.com (2603:10b6:208:574::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Wed, 29 Oct
 2025 21:28:37 +0000
Received: from SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c]) by SA3PR11MB8046.namprd11.prod.outlook.com
 ([fe80::f04:d46a:1742:5c3c%4]) with mapi id 15.20.9275.013; Wed, 29 Oct 2025
 21:28:37 +0000
From: "Wang, X" <x.wang@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Lin,
 Shuicheng" <shuicheng.lin@intel.com>
Subject: RE: [PATCH] drm/xe: Dump PAT entries with reserved mark
Thread-Topic: [PATCH] drm/xe: Dump PAT entries with reserved mark
Thread-Index: AQHcQ56Vsr5ODpI19EqkrOXyRFxaW7TOuKXQgAraGICAAAGuwA==
Date: Wed, 29 Oct 2025 21:28:37 +0000
Message-ID: <SA3PR11MB80467E85601D84EE3BEA906C86FAA@SA3PR11MB8046.namprd11.prod.outlook.com>
References: <20251022215504.5559-1-x.wang@intel.com>
 <SA3PR11MB804663C2A664A60E8713D7AC86F3A@SA3PR11MB8046.namprd11.prod.outlook.com>
 <20251029194825.GF5409@mdroper-desk1.amr.corp.intel.com>
In-Reply-To: <20251029194825.GF5409@mdroper-desk1.amr.corp.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA3PR11MB8046:EE_|IA3PR11MB9350:EE_
x-ms-office365-filtering-correlation-id: 9fac9d17-990b-48e3-48aa-08de17321f20
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|42112799006|38070700021|7053199007; 
x-microsoft-antispam-message-info: =?iso-2022-jp?B?VEhwVmt4aHB1TklIRFRva2FTV3BpTFFvRGZHK3ByT0RTZ0s0VG5TNmJE?=
 =?iso-2022-jp?B?MlVoM0cxMGJqNE1uNjFIbnArcTF6TVhRWnN6KzVkQklKbWtscitlcUhS?=
 =?iso-2022-jp?B?Q2Exemh2SS9Vb1RyZjRZL2djWmI3aktFdnN6QVdUUTRHNVQ4VGRpNFZP?=
 =?iso-2022-jp?B?Zy84cVppWmpnS1laemVRbzdLZWpGQ1FvbUlPRUpLTnJtT1NZZkFsRDh3?=
 =?iso-2022-jp?B?RzJLeDRwRjdKcHdCTUFuYllaUjRETVRSR3lLNVovWlRtajV3cTJhY2dJ?=
 =?iso-2022-jp?B?SUYrOENibnpabUtWNUZkVmNmTGJPd2JFUFp6S05LMlp6TVJadWN0ZEc3?=
 =?iso-2022-jp?B?Nk9iajdPNTB1NFdlT2RhcEZwRm1UL2R4V0RDenpGTjFhMUVTOTQvOExw?=
 =?iso-2022-jp?B?ZUNBZlZBM01meGovZTdJcm5FVUFaNnVObzlqTFZ6YTh4N1hGS1J6ZUlz?=
 =?iso-2022-jp?B?dHJqN0hJSmlLRjZrQk1YNHZUdDV0NlZ3SzRGa0dpRmZhcm5BN25hTVJG?=
 =?iso-2022-jp?B?VWJIRmRXQ2ptZ3FzTzJSVGMzcWdTdTgyS0dYQmliZjFYUjh3aDBtdlZ5?=
 =?iso-2022-jp?B?UXpvSksvdWswYlRZbHNVeit2MWpUYVc3UDJ3enVwdmYzd1FFZThDZVBh?=
 =?iso-2022-jp?B?MTU5MVpmTmlhcGFxenhNRlc2WjRzaVoweFBTekcwUkNMRWZvY0VwZFlV?=
 =?iso-2022-jp?B?a3UwMENnUVJmWUxPRkNjOHkya3lvR3RxUGowdHhMaTlRNUhOQmZZNVhW?=
 =?iso-2022-jp?B?YmhZak9lTlBDVjdIR2l4VTZuQS9sOFYwSE1HZlJOdDBTUjd1bDlJeldx?=
 =?iso-2022-jp?B?N0VjVjBXOHl4RjluSG03OVgxYTQwdmJKa2NyMjNTS3B2bTZzRThuUFRy?=
 =?iso-2022-jp?B?WDJHQ1R3QVpiVjhWRG1lSURSdlo0M0JBMWt6REZxbFJDUzA0VTFMZnpR?=
 =?iso-2022-jp?B?WGJiSVZVK0JlSHRvSnJ3VFo1R1I3d0RWN1dCWmpkSGpzSHlWVVhua0dP?=
 =?iso-2022-jp?B?alZMcWV1d1pBaHU4VnMvUlFTYUFaTER2YUJabmliSVdEeUtRSnZGSElt?=
 =?iso-2022-jp?B?NnRFQUw5ZHIwNUtkV09ZUG91RDlTUHYxMGRxb3MrcmhYZEYvN1hONVdO?=
 =?iso-2022-jp?B?RXZFY1N2OXlyUXBHT1ZJb0U3eXB0MVF2ajl1c2tNZ1FZNkZNOGpPR08x?=
 =?iso-2022-jp?B?WUcvSDV0TFNLa29wZjUycGV0RVcyOHFYZDVWaU1vbnZ3TGFmeWFmeFVU?=
 =?iso-2022-jp?B?NWNOYS9mZmt3VmZJZXJpUW03bnVkVVVWSDcza3ZJNEUvV0txaDRXZ1Rv?=
 =?iso-2022-jp?B?VDFCS1kxdnhQWld2Q0dPS0VZKzBSVFpmZS9UVk00OXNFNlNERWJCRUtQ?=
 =?iso-2022-jp?B?VXpDVFVucVphUGdEREs5N3lia1JJNkMwVnV0UUZEZ2tXOTBqRVpEWi9q?=
 =?iso-2022-jp?B?V0JzUkZkU1lPcW5nWGtQYzB5b0pHUDJrKzNHb3ZrOERTdTBrSitMZmJW?=
 =?iso-2022-jp?B?bGhpTjBkd2R3QlZpUG1KWSs4dlZQK1QrVUFDL1VPWFZJNHNWdVlRZjJZ?=
 =?iso-2022-jp?B?NVFSMWR0U1RtTFIyRmpEaHV1YWFkWGpzdHM1R0FUUFdSKzZFa0JtTE5y?=
 =?iso-2022-jp?B?WHlsM2M0Y0E2WTd3aW92VHMvSEJpNWdBNnBHTGwxelhpODVGUXVUcVpV?=
 =?iso-2022-jp?B?VUtvOUJJYVZvbysrTHhpZ21ZaUkzWGVFYmpXZXlPUldGY1pOOWQ5eExZ?=
 =?iso-2022-jp?B?RnBoQml4cnh6bkIyRmtxMDUzSEhlYTNyWTdNMlRBU3BjTE1HRERldW1r?=
 =?iso-2022-jp?B?QmRnOWtqQ1BsZGZsclpHMWQ4Zlg1ak94NGE2Sm1nNzZDWFVWTk16Q21W?=
 =?iso-2022-jp?B?QUxPYUxpQnlQMWRFenZOUlhoWkY3c09EYm1kM1h5cEF5TXRxN0FXSUZp?=
 =?iso-2022-jp?B?ZTk5VWZrMm1TSVcza1JpdzYvM0pZSnQ5NzZsS21LK1M0OFVVa0hzeVI1?=
 =?iso-2022-jp?B?VmxwcnErZDBQWHBLQnNCSm9jSlVPSlRndGsxZVJsUWRLMWJtdGV2Z1RP?=
 =?iso-2022-jp?B?bjNDZ0pFdVREbHd5a3c2SElBY2tkTTRLWCs3QVpRVTFiU1dqaFhTeVMw?=
 =?iso-2022-jp?B?eWYvNzZHQktHNHlKMmR0WDNCVU96c3Avb1BHOHZEc1VWcll3bXdMRG93?=
 =?iso-2022-jp?B?YSt3a2NTQUNSVGV3WmtZUnBMRDdpNSsr?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:ja; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA3PR11MB8046.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(42112799006)(38070700021)(7053199007);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?iso-2022-jp?B?QnYzYi9TbGR4Mmk2YjFjZlBvdTJhM2FTYWhqS3pLdkd6aVpMS1hTQVNV?=
 =?iso-2022-jp?B?WlRtQmtpZlZTajE3S09wR1VEZW1JaEQ5NkFzbUg4Ti9iaElJQ0FFME1s?=
 =?iso-2022-jp?B?UUprUGhGQmthVHgrcUdVaDNudVUzSm4xWkt3Y2lQdnkreWJ5eE1HYVMy?=
 =?iso-2022-jp?B?Qi9WNklDLzU2WXJjUE5tUEExZWtpcXkrNHBNRmlLSWdwWWRPQ01rU2c0?=
 =?iso-2022-jp?B?cUtWdi90S2lTelEvZEIwdjJTV0ZBdHpLNE1YSzhMK1drOE1YeHFUbEor?=
 =?iso-2022-jp?B?M1l5b1FWRGpTU3NxK1dJaVV4eng5NUtjbVJiQ0szaW92ZDh3QWduUkZF?=
 =?iso-2022-jp?B?cVRqNFpvMnVIZUt0MFY1cFB3cXUxODBwZWlPME54Skt0N1h5TWtkOXlC?=
 =?iso-2022-jp?B?RkU3UEdka0ZteFc2bUU5M25yUWtiWnlEcjk5RlAzRi9GQTI0TUNOSllN?=
 =?iso-2022-jp?B?c0Nka2ViYjRwK25mK3VwWTRRT25wOE1aKzY4TERCY2dvejJEbkRib01S?=
 =?iso-2022-jp?B?YzVqcWlmYU1SWkN0ajZKRHJDWkRYdkNQSlZ4SUVUWVRNdzFNWXErTjdX?=
 =?iso-2022-jp?B?dkxiL1gyUUVmVUxNM1NsZE5iMnlISFFScm1xSVM3cFJha2dPSnlzKzk2?=
 =?iso-2022-jp?B?ZjNmM3p1T20yVGdWbzJuN3JJUVhYa1dkcEJaenBPTGZJRVdsVEFHTm9s?=
 =?iso-2022-jp?B?VHNPTU5RL1AwajZSYldSWWhoRTR5Qnk2ditCYllZOU4vbis5Ymd2dU1N?=
 =?iso-2022-jp?B?aUpNUzJhVlk1VzRMeW1SYVg3VFJISEVsK3lZb0xrTzRCWC8yZkI1NmUx?=
 =?iso-2022-jp?B?d2l2WkprTi9pQU9UQkJwZVBhRitGeEhGUmxFZEd2ZlNWSGRRWFBXZDJr?=
 =?iso-2022-jp?B?aGhRQitxM2srU1hLV3FHdWs0Q3FRZXdjNXpDTDlPTXlkaHZnNE9EcVY0?=
 =?iso-2022-jp?B?NTk3MzFQT2txdjZ0RzNuT2UzNDJDeHdzOUxXZVR3UnZTMnhMRUpEeXpt?=
 =?iso-2022-jp?B?UGZiZ1BsdU9ucDNvdEw4SjFrN3o1RlFZNlVUdzRuNkJHNG8ySEFWUEdk?=
 =?iso-2022-jp?B?VXpzRTR1eEhLUWlRK2xnWUp2QVBXb3pIaXZlOCttSWJRRWw4alQybGVG?=
 =?iso-2022-jp?B?WFh3Zmp6d0Y4b1BhaGMxaS8wTDdFT3BQYlpZK0srTzJEcHJuSTBUbU0x?=
 =?iso-2022-jp?B?eEpoU2hMRW1IajRyVEZ1TmpPN0FDdXAzbG83Z05ZUTFWRFpiY0RUcmEv?=
 =?iso-2022-jp?B?UXZKbnRFWDM0SUJ3djRzVE9vZVNCcm1MTzV0bHozWG05RHR4bStvbEFG?=
 =?iso-2022-jp?B?b3FHY2VWc3VvYmtJN1FFYUpIS2RYSUgwa0V2QmNlU3BXcWZtN0hkVjJn?=
 =?iso-2022-jp?B?eHhPbGUxU2hmVUhnNFlRS1R6bjZxQ2kvM3BSWXRlOGNuSUpKeldxTDFO?=
 =?iso-2022-jp?B?aGloNHE1WlVyMzlMUU02TG9RM2puUXQ5dlRYR0RyQ2VOZXJONCtlTXJJ?=
 =?iso-2022-jp?B?Q2MrRGdrYjZnWnp3Vms1SFVha0VqUWJUTnNDV0JiVTV2K1JnYXBaOEMy?=
 =?iso-2022-jp?B?bUh5RlVWM0pxWU9TYlk3V3hjMzZxd0RZb2VIWFlwdHl6U3FoZ1lUMG5L?=
 =?iso-2022-jp?B?akpKZ3pFdDgvbzlPUGJaQjV3VWtCOGVBWXB2b3VEOW9nbjh1YkgvcXRC?=
 =?iso-2022-jp?B?K1R1MU11b0RqUVQvd0k0MWgrbW5WUHpKOEFkdWwySkt2bVAyY2hzT1lm?=
 =?iso-2022-jp?B?ZU1ZYWJUOEt5OXJZRkJMNndFTTdqTmNrb3FRUXdVaFo3aC9qekRkRjhJ?=
 =?iso-2022-jp?B?S3F5dWtXS0NBRVl6a285enBqRkprdFRYNFZFdVpNaHNRWTBaYkNaeWxs?=
 =?iso-2022-jp?B?VDV3Um4ydDZ4RkJZdW1xdGFtVUw3c2FIaEM0dGd0NDZjK0JqSVNwWE1Z?=
 =?iso-2022-jp?B?QWpFWWdQd3I0OXBSbWlOTjJnL0dWN1YxV3IzYkQxOGJSOGl4TkZSSVpQ?=
 =?iso-2022-jp?B?d0JtdWJvNkhIUWlEZkoxMVJGYXFROGt4UEFHTVBZRGVnMHpvNTQxaVVa?=
 =?iso-2022-jp?B?a0hxSFRqY084eWxnWEhYVlRjZ0FTRGwyWGttVktLSnFjRlk1aHVYVUlW?=
 =?iso-2022-jp?B?dnIxZVRGVlNsKzA4WTN0SnNZaVVFNGVMWHh2Z1oxSWQ5a2RINUJ2NzlN?=
 =?iso-2022-jp?B?ZExLSHEwMGFkZU5Kc2Q5eXZ1LzF5N09va2tiTUw3WFZnVktsWk9zS09P?=
 =?iso-2022-jp?B?ci9BblVrdVpkdzV1SzhRNlBSaGNMSWhEND0=?=
Content-Type: text/plain; charset="iso-2022-jp"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA3PR11MB8046.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9fac9d17-990b-48e3-48aa-08de17321f20
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Oct 2025 21:28:37.0573 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fz6wQh3jdlzhX2ACYs9CmdbKC9eZLimLy/JlBGDH8K5GtX4A6s+zSfxQ7egDrBFI5QHT8VGxkwaTBqFp7iDPWw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR11MB9350
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

> -----Original Message-----
> From: Roper, Matthew D <matthew.d.roper@intel.com>
> Sent: Wednesday, October 29, 2025 12:48
> To: Wang, X <x.wang@intel.com>
> Cc: intel-xe@lists.freedesktop.org; Lin, Shuicheng <shuicheng.lin@intel.c=
om>
> Subject: Re: [PATCH] drm/xe: Dump PAT entries with reserved mark
>=20
> On Wed, Oct 22, 2025 at 10:09:01PM +0000, Wang, X wrote:
> > From the gt0/pat file on BMG platform, we can easily find the pat[13]
> > is a valid entry and PAT[16 - 19] are reserved entries.
> >
> > /sys/kernel/debug/dri/0/gt0# cat pat
> > PAT table:
> > PAT[ 0] =3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> > PAT[ 1] =3D [ 0, 0, 0, 0, 3, 2 ]  (     0xe)
> > PAT[ 2] =3D [ 0, 0, 0, 0, 3, 3 ]  (     0xf)
> > PAT[ 3] =3D [ 0, 0, 0, 3, 3, 0 ]  (    0x3c)
> > PAT[ 4] =3D [ 0, 0, 0, 3, 0, 2 ]  (    0x32)
> > PAT[ 5] =3D [ 0, 0, 0, 3, 3, 2 ]  (    0x3e)
> > PAT[ 6] =3D [ 1, 0, 0, 1, 3, 0 ]  (   0x41c)
> > PAT[ 7] =3D [ 0, 0, 0, 3, 0, 3 ]  (    0x33)
> > PAT[ 8] =3D [ 0, 0, 0, 3, 0, 0 ]  (    0x30)
> > PAT[ 9] =3D [ 0, 1, 0, 0, 3, 0 ]  (   0x20c)
> > PAT[10] =3D [ 0, 1, 0, 3, 0, 0 ]  (   0x230)
> > PAT[11] =3D [ 1, 1, 0, 1, 3, 0 ]  (   0x61c)
> > PAT[12] =3D [ 0, 1, 0, 3, 3, 0 ]  (   0x23c)
> > PAT[13] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0)
> > PAT[14] =3D [ 0, 1, 0, 0, 0, 0 ]  (   0x200)
> > PAT[15] =3D [ 1, 1, 0, 1, 1, 0 ]  (   0x614)
> > PAT[16] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[17] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[18] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
> > PAT[19] =3D [ 0, 0, 0, 0, 0, 0 ]  (     0x0) *
>=20
> The general idea here looks good to me, but my only worry is that down th=
e
> road people who weren't involved in this discussion will wonder what the =
"*"
> means if they don't dig through the code.  Maybe printing something like
> "[rsvd]" instead of "*" would make it more obvious what it means to a hum=
an
> viewer, without negatively impacting the automated use you have planned f=
or
> IGT testing?
>=20
I agree that clarity is important. Instead of repeating [rsvd] for each res=
erved entry, which might feel a bit redundant,  we can keep the * marker an=
d simply add a note after the PAT table: header, like this=1B$B!'=1B(B

PAT table:  (* =3D reserved entry)

This way, the meaning of * is immediately clear to readers without needing =
to dig into the code, and it keeps the output concise and script-friendly.
Let me know if this approach works for you ? I=1B$B!G=1B(Bll update the pat=
ch accordingly.

Xin
>=20
> Matt
>=20
> > PAT[20] =3D [ 0, 0, 1, 0, 3, 0 ]  (    0x4c)
> > PAT[21] =3D [ 0, 1, 1, 0, 3, 0 ]  (   0x24c)
> > PAT[22] =3D [ 0, 0, 1, 0, 3, 2 ]  (    0x4e)
> > PAT[23] =3D [ 0, 0, 1, 0, 3, 3 ]  (    0x4f)
> > PAT[24] =3D [ 0, 0, 2, 0, 3, 0 ]  (    0x8c)
> > PAT[25] =3D [ 0, 1, 2, 0, 3, 0 ]  (   0x28c)
> > PAT[26] =3D [ 0, 0, 2, 0, 3, 2 ]  (    0x8e)
> > PAT[27] =3D [ 0, 0, 2, 0, 3, 3 ]  (    0x8f)
> > PAT[28] =3D [ 0, 0, 3, 0, 3, 0 ]  (    0xcc)
> > PAT[29] =3D [ 0, 1, 3, 0, 3, 0 ]  (   0x2cc)
> > PAT[30] =3D [ 0, 0, 3, 0, 3, 2 ]  (    0xce)
> > PAT[31] =3D [ 0, 0, 3, 0, 3, 3 ]  (    0xcf)
> > Page Table Access:
> > PTA_MODE=3D [ 0, 0, 0, 0, 3, 0 ]  (     0xc)
> >
> >
> > > -----Original Message-----
> > > From: Wang, X <x.wang@intel.com>
> > > Sent: Wednesday, October 22, 2025 14:55
> > > To: intel-xe@lists.freedesktop.org
> > > Cc: Roper, Matthew D <matthew.d.roper@intel.com>; Lin, Shuicheng
> > > <shuicheng.lin@intel.com>; Wang, X <x.wang@intel.com>
> > > Subject: [PATCH] drm/xe: Dump PAT entries with reserved mark
> > >
> > > Add a marker * in the PAT dump output to indicate reserved entries
> > > more clearly. This improves debugging and makes register inspection
> > > easier to understand.
> > >
> > > Signed-off-by: Xin Wang <x.wang@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_pat.c | 8 ++++----
> > >  1 file changed, 4 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/xe/xe_pat.c
> > > b/drivers/gpu/drm/xe/xe_pat.c index 7649b554942a..82c221aacebf
> > > 100644
> > > --- a/drivers/gpu/drm/xe/xe_pat.c
> > > +++ b/drivers/gpu/drm/xe/xe_pat.c
> > > @@ -376,14 +376,14 @@ static int xe2_dump(struct xe_gt *gt, struct
> > > drm_printer *p)
> > >  		else
> > >  			pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
> > >
> > > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)\n", i,
> > > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u, %u ]
> > > (%#8x)%s\n", i,
> > >  			   !!(pat & XE2_NO_PROMOTE),
> > >  			   !!(pat & XE2_COMP_EN),
> > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > -			   pat);
> > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > >  	}
> > >
> > >  	/*
> > > @@ -431,13 +431,13 @@ static int xe3p_xpc_dump(struct xe_gt *gt,
> > > struct drm_printer *p)
> > >  	for (i =3D 0; i < xe->pat.n_entries; i++) {
> > >  		pat =3D xe_gt_mcr_unicast_read_any(gt,
> XE_REG_MCR(_PAT_INDEX(i)));
> > >
> > > -		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]  (%#8x)\n",
> > > i,
> > > +		drm_printf(p, "PAT[%2d] =3D [ %u, %u, %u, %u, %u ]
> > > (%#8x)%s\n", i,
> > >  			   !!(pat & XE2_NO_PROMOTE),
> > >  			   REG_FIELD_GET(XE2_L3_CLOS, pat),
> > >  			   REG_FIELD_GET(XE2_L3_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_L4_POLICY, pat),
> > >  			   REG_FIELD_GET(XE2_COH_MODE, pat),
> > > -			   pat);
> > > +			   pat, xe->pat.table[i].coh_mode ? "" : " *");
> > >  	}
> > >
> > >  	/*
> > > --
> > > 2.43.0
> >
>=20
> --
> Matt Roper
> Graphics Software Engineer
> Linux GPU Platform Enablement
> Intel Corporation
