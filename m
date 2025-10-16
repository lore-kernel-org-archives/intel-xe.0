Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1128CCCD185
	for <intel-xe@archiver.kernel.org>; Thu, 16 Oct 2025 04:07:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA40E10E080;
	Thu, 16 Oct 2025 04:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="BEdmxvFA";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.15])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BAF010E080
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Oct 2025 04:07:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760587622; x=1792123622;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=cMoO1F9M7Pbn/0MeXVCOQGfUx3mA+FeJKOooRLNbF+Y=;
 b=BEdmxvFAuM7XbcrzYcLngL/8It/hhP3hO6ZzThRViengJ+gD73xv+pTt
 Q3/gh45YtXOFrxzqoIkXKohS85chWjeGkz2EolXVMWmK2vwDAQ4bZjPDv
 rLkBkUt2J5BNZ7zVw/DdndGm/LgpQ28LCWRSQiYIn+1acwxEz4GqGb2qX
 JFUM1qrqfDa2htcRcTaPHGcNteSjJRlgNJg5mHg1YI69fokwLLu24FdXH
 S/0gg41Eh5tbExBo4eqeMVkQ4L0oUmmuPmglrjghAmTkRZxXArbPAboyr
 FYPDDrGkpRcqjXMWGD0pM7igC7tx9II9G6UmIg3pKH9t/+ZwIf0ZzVNyK Q==;
X-CSE-ConnectionGUID: oKJfythISDSZgxDm5AHPVA==
X-CSE-MsgGUID: oOVeh4ONTM6X82E1OZQKMA==
X-IronPort-AV: E=McAfee;i="6800,10657,11583"; a="66422246"
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; d="scan'208,217";a="66422246"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
 by orvoesa107.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 21:07:01 -0700
X-CSE-ConnectionGUID: ydjnNN7rSmm5jIePIXJUeA==
X-CSE-MsgGUID: EW/fG6hfRH+0fFzVzn8Lhw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,233,1754982000"; 
 d="scan'208,217";a="186356495"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by orviesa003.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 15 Oct 2025 21:07:01 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 21:07:01 -0700
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Wed, 15 Oct 2025 21:07:01 -0700
Received: from CY3PR05CU001.outbound.protection.outlook.com (40.93.201.6) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Wed, 15 Oct 2025 21:07:00 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P8fEoIOtPOkSdu0KGCALPscKWsH5TTh9xuduXPpP8HGOYjMSwczCjf0N7B9gHRT1Ljua6fT2qhMBkjCt0y1MSbB2eJDLkTuQZpyKxqAXnxR3Bq0hn4AvR46Yp/eJC/1RtiTJ2J+bZzrNXT5onTleswk56cv4N5NoDbW4JZv4kLUrNOb7rAoopPd9L+It1N33XVqo7Bcrh1ultLot7CnB2K6Wed37iO8C9wLv/eosWrfhc1X3T0Ku988P2AAIK689hCD/EGFH/xAxAZhLLYFYGz6iDD70U7ZjNIvTMNpM/FTwkGNSWNYTFSf6FmUn3wLaqL/PRMi4dHyT0Sp3Ibxp9A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fTxv5o6xpI+1K0H7F5xFQy59fPlEU3zwxaEfno1Hmoc=;
 b=Cdptglk4em5w35QG5qNJoCac10MJP4s0oOvuj5hcYD0JUk6JBqCnXfE7d1NggRUlLHAqbLVRaBMYnYPDv700eCsrP/PkTUw3CyotNLFf9Nt6uk8XEumsZSPmy5tyb0osZ/GPsZIsN7nwVPULJ6CsytG558D0vWrtZXatqOYBCGSjGeqU25Vidi1o+1iz0WzJJa6BAy1eVhhI1JrICIxu7M/X7GWRdTtLWZQudLw/PONwtifyInZEtFUpGS4W/ZJ9a58g6CE5XdZOHL1Efxf3pv/w0aMDtLEoLwbFzaN13xJEcM+I58t3kw0C143AUIZ87XlgdKmqDQKufEOenn+rLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5262.namprd11.prod.outlook.com (2603:10b6:5:389::10)
 by DM6PR11MB4657.namprd11.prod.outlook.com (2603:10b6:5:2a6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 04:06:54 +0000
Received: from DM4PR11MB5262.namprd11.prod.outlook.com
 ([fe80::19d3:28f4:c53f:8431]) by DM4PR11MB5262.namprd11.prod.outlook.com
 ([fe80::19d3:28f4:c53f:8431%4]) with mapi id 15.20.9228.010; Thu, 16 Oct 2025
 04:06:54 +0000
Content-Type: multipart/alternative;
 boundary="------------iigaRXkgTqNcEqscRsc7qs6u"
Message-ID: <b4100879-4704-40d3-bc58-3933a060f963@intel.com>
Date: Thu, 16 Oct 2025 09:36:46 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/xe/xe_debugfs: Expose G7 package state residency
 counter through debugfs
To: Mohammed Thasleem <mohammed.thasleem@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>
References: <20251016001219.37684-1-mohammed.thasleem@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <20251016001219.37684-1-mohammed.thasleem@intel.com>
X-ClientProxiedBy: MA5PR01CA0122.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:1a7::12) To DM4PR11MB5262.namprd11.prod.outlook.com
 (2603:10b6:5:389::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5262:EE_|DM6PR11MB4657:EE_
X-MS-Office365-Filtering-Correlation-Id: f9230b0b-79ef-44ab-456f-08de0c696fee
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?b25CTWZzRHJzYjNmbFRkOFVwcS9WWG8rRlBGUUtwdGhLNmZ3Wkw3RU4wYTMz?=
 =?utf-8?B?UmFZTTY0R0hkbStOa0RVZGgvTnhicTVsRmVMbGtjY2JOMVZDS09wdXZNc3lP?=
 =?utf-8?B?ZlFkVStUZzFTd3cvYmQ3THhKdFJVQTdZejhMaGNKWERWREYyT2I2Y1IwSFlC?=
 =?utf-8?B?ZjRJdGd1UWVmTmdKRGlEaUhzTFRZVWl5TjVEU2FaOVZ5SkRaam5HZ2FoTWUz?=
 =?utf-8?B?N0VPb2RLeDFLelpMSWFGVnhuRzJib0tldzRBMWZhbFpGWXVzUmNPZ2k3ZlQ2?=
 =?utf-8?B?SnZBS3pIVnhKaEMvaStxc2xjcjJ3VVFISjhUY3JYYVROVXdVU00vY210bFp3?=
 =?utf-8?B?VTlYU1MvbFNWUUc1VXVicEhSOHd5MWNJU1FJazMrak16OFVRTTM3NXhkcWgy?=
 =?utf-8?B?bmNFY0thdkZQSEFDS2ZTUjg1dnFlR0o3d0pVdzJnVitsQXlFcjhoMkNRSVMx?=
 =?utf-8?B?ZHhPRTV0ZWkxd0h4V3AzeUVlQWUxaDdEeWplUzY4andyM0dnS1NkWGpvNlpK?=
 =?utf-8?B?aFdHcTk2QjZySTQxanFmdm9iRG9rMEpQQjBHc1ZNZlFsbTRlc2NJTitpL0R6?=
 =?utf-8?B?SmpvN2VSeUtXR01RN0tUQUNiejVjM0YyS2lYMkEyNUlsMHBrOFcweU14eDkw?=
 =?utf-8?B?RkZ2V3gvM1dHOHpyRHdiT0RIODIyY3pOcGJIeHRjZUt3TTdRc1dBYkdxR3VF?=
 =?utf-8?B?eHZkb2V0Z1c3Y25YeTJlaUJKWi9FRnJqTHROTmtXSG1XSFdMVjVydk5MS3J6?=
 =?utf-8?B?VDNkNGhnRk4rd1pZVDdQNlFxOTgyV1hHZUlIRWU4NnRxLy9MMzhHeTh4WEZI?=
 =?utf-8?B?SnA1dEJBY2dPaGNBRjBvSWF4UC92dExwVUZuakRTNFdWUTh4NmEwSmJtSVFR?=
 =?utf-8?B?YlN0bC9iZVFBUHF4V2JSVkh0VitZbTdTdlNWN1FTR0hRZTBXakY3NE5kbGI2?=
 =?utf-8?B?MVdxQ3JxekFwK2t1QlJ2WVNTYTRXM29Ub3RNMHJXRG1VN1dsSHBIYVlKanJz?=
 =?utf-8?B?Nkx4WHhPRTl0SXp4RDlsYyt5bU0vaUlMRVNWNWpSRERjVHJuUkNuY2ZmWkI4?=
 =?utf-8?B?elpXSkpLOWNvMzlxQXdkaUwzeENkRWtSeXR2Wjg3YzdOQ3kyQTk4c28zUVpp?=
 =?utf-8?B?VTlXdGY5enFEWmJhSHEzYWd4M3NxaFU4R0JoL1NhSnBjWDViL0FmTFB3blNn?=
 =?utf-8?B?eGdqWGVaSVNBdnJUc0xTTHRuazhrMkRhOVN2cFNiM2gwZFR1dWNtamcxV05V?=
 =?utf-8?B?Qm9GUnY1aWVmMDE0NVkxNVpIeXhnYjhNd2VrOUhNeWxBNWQycFVXZklRT2RL?=
 =?utf-8?B?TFJaMm5WNGFVclhtU3VLV2dVZjVGeUZ0Y1pYN1JyODFaME9pckJEME1TdjhJ?=
 =?utf-8?B?STJtcndHUU1iUFlCenBUN0htVnhFQ1ZXbTkzL2ZPaXZNdS9SeG5VSjRDRXo2?=
 =?utf-8?B?aWs5QjQ2QkxXQUlNc21MRzZITHRGVTc1a0drU24ydG1UUEoyeS9PRE9OckFO?=
 =?utf-8?B?L2M1czk4QkJrM2hHd2xjMFY0ZDNIL1Y3SmtTck0xOUhRVnN1N0VnUmpuUDEz?=
 =?utf-8?B?VVp5cDQrditXcm55dUZoczlQYTJxSklidXExRW1QZWdZN0wyM3VtMFBValpn?=
 =?utf-8?B?b0dsQXoraHdsOEFBRy9tRVFqZ0hYNjdlT2tGL2N2Mk01TU1aUjFjRmlkSndk?=
 =?utf-8?B?MEMvZmxXZ1NDaWN0N1FxQ0FzN0RscDJQcVg1WTVmMnpMRjUrR3l4VGN6ZG0z?=
 =?utf-8?B?czRMWDY3K01WVUFQYXlVdndQL1Bjd1IrOGxXdlZSUmR4eEVvSGU5dGpER0I0?=
 =?utf-8?B?QXB3ay96QjFZc2wwbEpyYzBLY2MvVWt0Zm1RQlVLQkpjekpUVXZ1OXd4RE42?=
 =?utf-8?B?aE9HcXIzSDdpbG8ySEExYTlnSW1MVFhRNDhkYWdxeE0wU2VQOU5sOURSekxM?=
 =?utf-8?Q?Sg9Q+zXEByMUsIpijl0ua4hbiBNNPV7e?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5262.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?dEFsTnhBcTRwYTVJRWVwQnpUUVJ0NWpKSVJtaitIUjJ4S3J0V3o4c1VoK3hT?=
 =?utf-8?B?UjBQOHN3dENJYzF4Y3g3N3FxQWlOZkNHc2t6Y2IxS0ZmNThGVFVrLzg5bVJZ?=
 =?utf-8?B?UEJxVytRVmlKR1hXTm95SzNoRThxNFVUVXBzUjdqNys4TytOTk01UGlOYmp1?=
 =?utf-8?B?RUJkZ08yS2FHWjd2bE1wTCtnQ0VNelR1ZjFqVmhlelFNV2dzcjgyQnI0WUwx?=
 =?utf-8?B?Tmx5Qk5HK2dONHJ6SW13clFZckhPYnVlR2ZaMmFuRG0zNEY1R21ic3RDTEpO?=
 =?utf-8?B?Tk5lVEJBYlJKR3ZrTnRpV09rbkZ3ckNVV0xmK1hNN2kwQm5CWkNFYnQ3bXRl?=
 =?utf-8?B?c3lDSXBlOXJOeHVmNWlPTzd6UU9YdnVTS1ZEczdSWjRyUVl4QmJLNVhsVlY0?=
 =?utf-8?B?bXg3a3htYUdjbTFhaEovVzJ6WFJSZXhZWjRjQkZIOHd1UGlUckJueUpuL0pR?=
 =?utf-8?B?NXFRcy9sc1lyODNUZHZYVnN5djUvOVA0R1RlV0h1Y01NckJOQVVsVnVuZVJl?=
 =?utf-8?B?dzY5WHJ4MHIrMU5BVTJLb1Q4Y2VhOXpjRVhQZmxwRno0bXRIYWtWczNXTlFV?=
 =?utf-8?B?VzY5b3dteTZYcUxWQnkrOERXbU9vdzloSG1TQWUwWkQ4ZFZhUHUvNGJHK0xx?=
 =?utf-8?B?ZlNOMmJsZFM2ZE9nOEgrdGg2MEkrOHd0TkZJdEwrL3dQcnZ6eC9xa2lVblFj?=
 =?utf-8?B?YVpUU0hZb1VMMFQ4NkhJSTE4VmFvQjdSSlJNK1ZQTmpNRlkvUWpGVE81UGNR?=
 =?utf-8?B?R1JsYndMUXp3YWtKQmxHVzk1Q1NaYXBJOFc3K2kwaWRPODJ4Qk5xcmpoZllM?=
 =?utf-8?B?RXJ0NTBuRDl1LzhXQnEvVDRidHUxZzhtRko3ZjdCWHJGalJ6aDFsakV4YWQw?=
 =?utf-8?B?RzVqTHJwYjJrRmFJRUtCVm9ENmwzZHJvNHRJOTZMb2hqcjVHQW1uRmx2RmVa?=
 =?utf-8?B?UkhVaVYrNlJ5ODdVdmFLd1hWTU15cXB4RDMxOEZ2dFBkUVYwbS94QUtIc1R4?=
 =?utf-8?B?K2dXZU5CWW1Pd2dGQjlDR2pqdHpWUElMbDcvWXA2Q3NEY045REwzWWxSem1R?=
 =?utf-8?B?QzJHd1U1UHZ0Y0h0NWhyakE3NzlJMkRrNi9YdEJ1dHVSdEhuM1VlRGZ6cm1H?=
 =?utf-8?B?WDZOL3ZCVit5RzlmN2c4dlRacGM5QXdiaURzRlF4WDJJa3BJN01uaE1aTEp4?=
 =?utf-8?B?dGU0d0x1ZEVhOTN0WWx4VnVCNG9YS2RMZkFxVmNCN29kSzZvcktDTVduQ0FI?=
 =?utf-8?B?VitibVdCT0JwSWc5YWs5aDNvdEpQTWt4V0hUZ09oUWFXMnlNNXF1WCt1Qi9z?=
 =?utf-8?B?RlZGVmpvWDFyaHRiNFU2dC9ma09ydjVqbXdidWhtOVUrYXpscVNvbm83ZlBF?=
 =?utf-8?B?N2JNNGxoY3BlNG1wOHUvcTFuM3ZCZ21VR0RwQnRhQVl2b3hpK04ycFVuM2FU?=
 =?utf-8?B?Q25CNUprWU9KWXhYNnFSN1ZCakprWUpnOEs1dUZxanA2amo3UVB1ZXJGYmkx?=
 =?utf-8?B?Q1VFNEhVSkNIdUJSQkF4eUNHdFZONk9uVzlCU0xSd3RwUUcrdys4NUdOazNY?=
 =?utf-8?B?cXVqYUFyTmVJdXd0c2FZaUFlRmNqUm9FZGJyMDg0amtzOEhyVFVsQmZnbVpM?=
 =?utf-8?B?VTh5UHRqL1A5NENGNk9CN3I0cUZrQnBtQVZoODZLdGw0T3RhWDNDdEhZMlhR?=
 =?utf-8?B?dHRFUkZ5ZzFZQzFvckNNWDJoYmd5aWdhQ1dBTEFISGMxQTl2T0FNQTJTNWtG?=
 =?utf-8?B?dlAvWHhnRWxjaGtrdGZocmJEOHYvZ1JEYWdqVmh5WitiUWxuRGZ6aXBFRzVC?=
 =?utf-8?B?am56S2cxSVpJczhQTjNOWGd0YWM0WVAvOVU0aVNHdGlUQTBhWS8veXBoZncz?=
 =?utf-8?B?bE1tUXZzUGxudGk2TDh4Ly9ranBnazRnci9xZUJuL0RUTVZleVhSR2M4V1VS?=
 =?utf-8?B?aTZnUUtGaDJIeFQ4TVJkdTNEM3RNNXNXWkovc0hLeS9kUHdBTFA1MHluWkpG?=
 =?utf-8?B?NUlaMG1FY1NqV25oTCswNmtPM3dmSWNIb0hsU2pTSjJjbC9hYUN5NXFCWWpj?=
 =?utf-8?B?bkJpQmZsY2tyb1V5TzZIbVk0WjlUMm1nWGFBT3VKWUMzYm5xL01kR2FoQzlP?=
 =?utf-8?B?eW1qYWdBdVZ1Rmk3VnR6OVJoVUpkUnYwQ1NQY09XZDZHVkczS3d0RS96cjkv?=
 =?utf-8?B?OHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: f9230b0b-79ef-44ab-456f-08de0c696fee
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5262.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 04:06:54.3339 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nLbZhBiT3ePDHTrjYjOUTvoFYxnq0DmMkjgF+ZeVkMcW27mSnW42Gmw1OIwe424hNlu8Uty+3BLAKC89xHTQHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR11MB4657
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

--------------iigaRXkgTqNcEqscRsc7qs6u
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit


On 16-10-2025 05:42, Mohammed Thasleem wrote:
> Add G7 package state residency counter in debugfs alongside existing
> G2,G6,G8,G10 states for complete power state visibility.
>
> Signed-off-by: Mohammed Thasleem<mohammed.thasleem@intel.com>
> ---
>   drivers/gpu/drm/xe/regs/xe_pmt.h | 1 +
>   drivers/gpu/drm/xe/xe_debugfs.c  | 1 +
>   2 files changed, 2 insertions(+)
>
> diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
> index 264e9baf949c..0f79c0714454 100644
> --- a/drivers/gpu/drm/xe/regs/xe_pmt.h
> +++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
> @@ -24,6 +24,7 @@
>   #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
>   #define BMG_G2_RESIDENCY_OFFSET		(0x530)
>   #define BMG_G6_RESIDENCY_OFFSET		(0x538)
> +#define BMG_G7_RESIDENCY_OFFSET		(0x4B0)
>   #define BMG_G8_RESIDENCY_OFFSET		(0x540)
>   #define BMG_G10_RESIDENCY_OFFSET		(0x548)
>   
> diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
> index d67e32ebbe29..417e6df95e1c 100644
> --- a/drivers/gpu/drm/xe/xe_debugfs.c
> +++ b/drivers/gpu/drm/xe/xe_debugfs.c
> @@ -142,6 +142,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
>   	} residencies[] = {
>   		{BMG_G2_RESIDENCY_OFFSET, "Package G2"},
>   		{BMG_G6_RESIDENCY_OFFSET, "Package G6"},
> +		{BMG_G7_RESIDENCY_OFFSET, "Package G7"},
>   		{BMG_G8_RESIDENCY_OFFSET, "Package G8"},
>   		{BMG_G10_RESIDENCY_OFFSET, "Package G10"},
>   		{BMG_MODS_RESIDENCY_OFFSET, "Package ModS"}

LGTM.
Reviewed-by: Karthik Poosa <karthik.poosa@intel.com>


--------------iigaRXkgTqNcEqscRsc7qs6u
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 16-10-2025 05:42, Mohammed Thasleem
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:20251016001219.37684-1-mohammed.thasleem@intel.com">
      <pre wrap="" class="moz-quote-pre">Add G7 package state residency counter in debugfs alongside existing
G2,G6,G8,G10 states for complete power state visibility.

Signed-off-by: Mohammed Thasleem <a class="moz-txt-link-rfc2396E" href="mailto:mohammed.thasleem@intel.com">&lt;mohammed.thasleem@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_pmt.h | 1 +
 drivers/gpu/drm/xe/xe_debugfs.c  | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/xe/regs/xe_pmt.h b/drivers/gpu/drm/xe/regs/xe_pmt.h
index 264e9baf949c..0f79c0714454 100644
--- a/drivers/gpu/drm/xe/regs/xe_pmt.h
+++ b/drivers/gpu/drm/xe/regs/xe_pmt.h
@@ -24,6 +24,7 @@
 #define BMG_MODS_RESIDENCY_OFFSET		(0x4D0)
 #define BMG_G2_RESIDENCY_OFFSET		(0x530)
 #define BMG_G6_RESIDENCY_OFFSET		(0x538)
+#define BMG_G7_RESIDENCY_OFFSET		(0x4B0)
 #define BMG_G8_RESIDENCY_OFFSET		(0x540)
 #define BMG_G10_RESIDENCY_OFFSET		(0x548)
 
diff --git a/drivers/gpu/drm/xe/xe_debugfs.c b/drivers/gpu/drm/xe/xe_debugfs.c
index d67e32ebbe29..417e6df95e1c 100644
--- a/drivers/gpu/drm/xe/xe_debugfs.c
+++ b/drivers/gpu/drm/xe/xe_debugfs.c
@@ -142,6 +142,7 @@ static int dgfx_pkg_residencies_show(struct seq_file *m, void *data)
 	} residencies[] = {
 		{BMG_G2_RESIDENCY_OFFSET, &quot;Package G2&quot;},
 		{BMG_G6_RESIDENCY_OFFSET, &quot;Package G6&quot;},
+		{BMG_G7_RESIDENCY_OFFSET, &quot;Package G7&quot;},
 		{BMG_G8_RESIDENCY_OFFSET, &quot;Package G8&quot;},
 		{BMG_G10_RESIDENCY_OFFSET, &quot;Package G10&quot;},
 		{BMG_MODS_RESIDENCY_OFFSET, &quot;Package ModS&quot;}
</pre>
    </blockquote>
    <p class="MsoPlainText">LGTM.<br>
      Reviewed-by: Karthik Poosa &lt;<a href="mailto:karthik.poosa@intel.com" class="moz-txt-link-freetext">karthik.poosa@intel.com</a>&gt;</p>
    <br>
  </body>
</html>

--------------iigaRXkgTqNcEqscRsc7qs6u--
