Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0469DCCD18D
	for <intel-xe@archiver.kernel.org>; Mon, 13 Oct 2025 17:31:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B855810E13C;
	Mon, 13 Oct 2025 17:31:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZAA2hv/v";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588A110E13C
 for <intel-xe@lists.freedesktop.org>; Mon, 13 Oct 2025 17:31:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760376683; x=1791912683;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=9+nBc2jJlmyTLlz63M496id8c8PLwOS58CAMyaQDgw0=;
 b=ZAA2hv/vQdtqCLqSeeDsA0Zs9yjqgsbUqwLCIGjSoiZgnO+N2VHZOvHk
 GgS1lcSi3bcAEg7amzM0kzOz7GFBDmULSahS/hhehq/7DsmM93JFGngMv
 4HCGtQZ7zIfxW9movuBugXyRk3MAaH2Do6fOwfCUQ9N2bgNMcljJKTVxL
 9q10te62Yw+GcIwVRiUjTlDTgFRMzoJasch5W/UByD74EZ+tZvMLweZq/
 ZvwxoISRj4rb3OORVyr1QusFV0Wsyhk895abHEYlSthnq6uRySXPylOvf
 AslxwyxgU62RMEWLEhoHNqtJ+FbNKzpyLyvTwn++Z474OVOxEjtGXrtuw Q==;
X-CSE-ConnectionGUID: onML+BWRT2aeQb7hMgXzvw==
X-CSE-MsgGUID: tjriXKJISDWUv7cQ3wIg+w==
X-IronPort-AV: E=McAfee;i="6800,10657,11581"; a="73204567"
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="73204567"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
 by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:31:23 -0700
X-CSE-ConnectionGUID: AhTeO0svQ2m/gKq6zwlvwQ==
X-CSE-MsgGUID: /zN3k75DQ5WpJjALmskwyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,226,1754982000"; d="scan'208";a="180891590"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa010.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Oct 2025 10:31:23 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:31:22 -0700
Received: from fmsedg903.ED.cps.intel.com (10.1.192.145) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 13 Oct 2025 10:31:22 -0700
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.32) by
 edgegateway.intel.com (192.55.55.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 13 Oct 2025 10:31:21 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nV11X7K0xHLOTifTeFCCoRYml/mBoyHkddauVS5o97aeYwsPdhuuEJgoUUD3ygX8+ASBOBoIIU8Xi6Juu1QiIi3nyl2qT6p5Q6AOnOxMdapyonuDn2b2lihRK5xDACnHPdlEoZ/1DW2O073yVjrt2/WqPJIRZPnaQcg/ICBkn5h8am68qIXzhNwhjImpwfD8XKkBUdEPY9ciPbolSEptrAtkIQ7hBP7tRaLUWEZ6Onzp9fwjGIkGGOxVcaR/dSw3XnI8QY1oXGrzJI1erTD6+LbnKA9nbk2MgWEW8YCa8CYnGzEz/MXon+8s9Qu0zT2ufiyyqsKmOBuCR9c/YdWXuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7m0TZUrYxbJw1qaMXKASyR98vOhed3XRN9BXU3QmSGs=;
 b=voGyVBAqOavvEmb9KJx1iUQzGByxrZgSGBYGftaTyr2fNNh6cNZSkI68o5K5BroClsW4yiz0PRgRlAnbZmlTSXJwg4vi0XiPKIx4DuwiFFOyYlN2CD6B3wGn3rjz338dwm3W5ertVO/iyJhuF9OB2o8vv3tnn1mAACFLFmiwh7pdZsJuGfM05VENDmLljonGsKgUzJR6iM4rMpQgIol25/+2yB82KrxFchWY4Fa50TMzwW/PKzc/oAXSQSZ5g9rD49zTtnCoXkjPJJYQUtwUNjUrVobrT1+vxPfTMVdEhUf1bG78G3W45vz1cTxXd0lBpRdyRXkzM7zLmM0K4Haz7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BL3PR11MB6508.namprd11.prod.outlook.com (2603:10b6:208:38f::5)
 by SA3PR11MB8118.namprd11.prod.outlook.com (2603:10b6:806:2f1::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.13; Mon, 13 Oct
 2025 17:31:19 +0000
Received: from BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5]) by BL3PR11MB6508.namprd11.prod.outlook.com
 ([fe80::53c9:f6c2:ffa5:3cb5%5]) with mapi id 15.20.9203.009; Mon, 13 Oct 2025
 17:31:18 +0000
Date: Mon, 13 Oct 2025 10:31:16 -0700
From: Matthew Brost <matthew.brost@intel.com>
To: "Summers, Stuart" <stuart.summers@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
Subject: Re: [PATCH 6/7] drm/xe: Don't block messages to the GPU scheduler
Message-ID: <aO03ZANSaEfzOo1w@lstrano-desk.jf.intel.com>
References: <20251013162504.7768-1-stuart.summers@intel.com>
 <20251013162504.7768-7-stuart.summers@intel.com>
 <aO0vRcrh+vYm8JbN@lstrano-desk.jf.intel.com>
 <69295444f047934f6f8a711b939bf1306dce0416.camel@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <69295444f047934f6f8a711b939bf1306dce0416.camel@intel.com>
X-ClientProxiedBy: MW4PR04CA0312.namprd04.prod.outlook.com
 (2603:10b6:303:82::17) To BL3PR11MB6508.namprd11.prod.outlook.com
 (2603:10b6:208:38f::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL3PR11MB6508:EE_|SA3PR11MB8118:EE_
X-MS-Office365-Filtering-Correlation-Id: c041aa64-6d5f-4762-fd6a-08de0a7e51c0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dFNDdUhhcVN2UjAwalV6d3Zwa1pnUlYwK3czck5CeStma1RmcEdKZGRJVjBP?=
 =?utf-8?B?dmowSUY4Y3RVejAyaVd6cDMrL0xxQUdaN3k5TUlYRU12S2ZIVjlVTkpZUVRP?=
 =?utf-8?B?eEdKYlNIQ3hyOXkweEtxRW53UGNEeEVuejg4c29ocEIyS1E0dXRjSUcrZ0J4?=
 =?utf-8?B?akdER2RDcUsrNVd1WG9PMVFFTWV3WjdnWHRxYWNkNllPRTB6S0JTRFZRZFRO?=
 =?utf-8?B?UzM1aWNvbjA5SGZxQzQxTkdVd1BjQVd5Q3BvbExPYUpyQm9SK2NtR3FLRTRB?=
 =?utf-8?B?cnN2N1RvRHVNbUpOTFBxNWppdS9pb3lYZk5EcWhJZW5OQjhkVWdNQWpSZEl3?=
 =?utf-8?B?aTlpNm5hMk5lSmRUcUNJUFFwNXFFZHk5bEIzVE9qeDVLNWYvVUxqUlc2R2pa?=
 =?utf-8?B?clpoS3NRYnRMenVFYXI3eCtGdndWVXBVanRLNXc5VEcrYjVGRTNBMitWdHRp?=
 =?utf-8?B?RzNtVExVUEZsYWFSRW52V2xBOS9YYWg4bFgzMG1Yc1NQanVXbFlBRGJwSUpT?=
 =?utf-8?B?KzdZdU82TEpzaGFqQUhvR1ZzU2pPU0UvRHhmWDlERkJQWWNGVDZuVUc1VHJX?=
 =?utf-8?B?OU96YTk0Z1BlNzFOK1BlVUlHR1h3bDkza01ha0REb0hqRGk2M3p1OGdYVlhz?=
 =?utf-8?B?d3FiN1BoSWhDUTFDbmk0RTNQTjNjaE9zRGU2dGJPUC85Tzg5aHFxUXB6b3dU?=
 =?utf-8?B?OHUrbFFZK1JrTzdVU1UvOWY0aVlCSm5GNHpjNGgzRkRDb0ZMTFR0WFIzdDV4?=
 =?utf-8?B?bUJ5a2g3eTFJS1pEdXg0UkdvOGZnKzJsQjdBTk85WWhoWUNDS1NvMFVERSt3?=
 =?utf-8?B?d0ZlTTAwYmtlVWVRck15ZG1Cai80MzVxcWFPRWdNUy9BU2hQV1NNWXB6QXlH?=
 =?utf-8?B?TkJCeVFMWWk4M0dGY1JiVzB5cU05azJNdHppL2F2RE5IS3B3NUUwWit0R1h6?=
 =?utf-8?B?NnZOZjZTdXdoL2cwWDU5ckJOSkdPWENwQVpPQklHdGoyOE05ZWxTOTRFRnVV?=
 =?utf-8?B?VVRRczBva0Q3cG03UU1lTU9pSFlsUUZseHJWMVlsQ3VsTzhLS0NxZzV2UDlz?=
 =?utf-8?B?d1ZKUkJaNE5oQjVBaHVBNUhpS3oyWkt1dUhKK1Z1YjdtZGJYUGhmZTZ0WG1S?=
 =?utf-8?B?TU5oTVhsMldyRTNtZnlLcWhYcEM3blpaTjR3WlozZThVTlIwcjEvbG8vWXJl?=
 =?utf-8?B?ME9rTk1DczgwdUcwNGxscTBwOWx0VWlhUTNKaWd0T1JLZzh2eGFGSjlQNUNa?=
 =?utf-8?B?YkdNRWlnSzJBcWZ1a1RDUkloYVpHV1VoclkzZzRVZ0tOQ2JubVY5WE05SWRM?=
 =?utf-8?B?Y1NLbGVLVU95dG5KYnYzQVNhcHRWVU1GSHovTHRlUjZkeFVKa29UZFM1QjUy?=
 =?utf-8?B?MlRwNitxY3Vta1JDa3FVZFRDclZuVG9PU2RMWUZjWEVCR1VkUTd1b1JHcktY?=
 =?utf-8?B?ek9PWnN3cHBuTncxVlI1ZU52b1ZCRXZ5aTNRUGtFRFdDak9sbWtqdUVoeTUz?=
 =?utf-8?B?VFN2Nm5STnBCM3I1SElyNHVCOStMNFRxaDE4ZlcrZnY5dWxpazNuY3dHVWxV?=
 =?utf-8?B?QlBFWVhId3Z5UzZlSUpZMStPb0RGUytiLzBuamRqcTFRRlNjeGZzKzdtblNO?=
 =?utf-8?B?WVVNZnRNbDhOWU1KNFB3dy81bjMyVXUrYVE5VjZqRU9URTVPcTJIczNhMkc5?=
 =?utf-8?B?U3BWbVI2WW9FdGpyVVZkQVpYaHF1ZTZwakVpRVB4NW9LS2J1NFNTZ1lwSmt4?=
 =?utf-8?B?UTQwem04RkFWZUNoSFQrcWFXb2Vxd2Y1NExiZlVZTmFvcVRZZXpyTEk3OGds?=
 =?utf-8?B?UkhNQnRWUE8vVTFmaUFNUGgvS1dBeFlvWVhHaCtlUkU3cmlvRW1ZRHh1dWxE?=
 =?utf-8?B?M3N0TjJzZ2Ywa1owaG0rZit4MUswZFJ0ZVFIQno0ZlVnWVE9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BL3PR11MB6508.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NnlQK3ZTd0tHTWY1M1pDSFBQaWlxKzZmQ2xnaWdYbEdHQlQ5RzhhcUZlWTd1?=
 =?utf-8?B?M1VYTkk2aHlxNnVNaTdvTXA2TEF5UlFETGNyaXpZVkxGS3lSbUhNQ2lFZHl0?=
 =?utf-8?B?WU9ZT09PaE5VVDRScTBWcjZJTXRtYmluYWZSeE84VVJDNUYreVBOQ0dZQkRX?=
 =?utf-8?B?RUxCY0dvR3NZZTFaWTByMnZ0V0ozbUR4cERFV1NGZkRMN1gyUDllS2NDMG55?=
 =?utf-8?B?aGdsM1VTcyttdVdWYW1FY3d3R1NOMGhvNTJOd2lkekY4VVpiakhXdUt4Q2V1?=
 =?utf-8?B?a3ZXUUJqUGU1bktlLzR4d3JZMFFobEcrYTVxOEd2OTZ6ZHQ0VWc1VkcvRWlT?=
 =?utf-8?B?cEgxZnBJSTV6SE1wTm9LYnRXbFEzWFFVcXZsUTBsYmkxRWxJVUFDSXpLVDBV?=
 =?utf-8?B?NFFRZndRNjJWVDFTN2FPVFk1VDlMdVNtaVV3S0RmS0grdVg1bTlCMVBkMGNQ?=
 =?utf-8?B?ZHdvTjQxS2RyZ3RVY2JqcklhQlZkT3BQcU12NVVxbjVlcVhiRjNvc0N5Y2hO?=
 =?utf-8?B?bTVqL2pnSzd3eENoUGwza2lDRVZmQ2luR1k4MkdiK2NQcmszbjRuMDkrQ2dJ?=
 =?utf-8?B?QUFnMHpIbzVvNzk1bG9KNVlOVGNNTmZrTnFJZlpoZTZYMUdwbExmbys3K3Y5?=
 =?utf-8?B?YUlHQkx6MWZRaFNWdWlCMkNjMzM0Nm1yaUpUUW0rSTMvWFVKY2xtZENmMVBm?=
 =?utf-8?B?SWN6TnZiNWNocEpPVysvTldjSnFadDhHdDM1SnM3VVZHUm96VlpsN1kzSzV3?=
 =?utf-8?B?Uzl5clQ0dERQd05hSWwyRHFhUmRNRGZ3T0crNytrVFo2NEJrUmFMenA4dkJr?=
 =?utf-8?B?Z1RuV3lBOERrcGJCWXFQeVRnbDdDUlRjeFNTbFBPK2E4dXdRNFZ5dnlNNEhz?=
 =?utf-8?B?VHVDVDJJYlU5MHdtSjlYQ2R4NnhPKzhRVGt4eGFKb0dFdGhqWXB5QWkxWHRk?=
 =?utf-8?B?UzhyK1JYL0FkcVFjQnRQb3VWT3ZLTlphUEdjZjIwcWFkYStha0RpZHVoRGpp?=
 =?utf-8?B?TXg0RmN6Yjh4akhtVDlscis1MzVBa1JWNjFwbmNaYnVoZGE1M3ZFMFowaktY?=
 =?utf-8?B?TE56UHFrSFZncGZpNW5tUXlDNzhCeXhlTDFmNXVsSmxXNHpEWm1IT0tnSGxz?=
 =?utf-8?B?VnB5U2NNVUpiNGk3TFZkT1FkUGM1YnhsTmVKQkdVd3ZTTDJQUEFoeUxCOUZ0?=
 =?utf-8?B?TDhmWFBJL2IzZjM5cWx1bkRnTmZvQnk1a21NQkJBS3RFODFDT0IraHg2cWl2?=
 =?utf-8?B?SC9CR2NsR1dFd0Jqc0E0UlZsMDFYWERZKzkydWs4QjZDNGhRWERTbmtES1Fn?=
 =?utf-8?B?MnFRTzd5c1N5bmprZzU4djZsdEh2ZG9oRTNDQ2xSYjF3eFBTMjJwalcyV3JB?=
 =?utf-8?B?b0FuWHQ1NlROYzZvOXVCWDNoajV2aE1NakVEQkxEeEVSeURKQlp4OGpXZjN0?=
 =?utf-8?B?b1VSUEhxb1AwT2ZjUTZzcVZzRzRMWC9tdGlTdm1LT1pJbCswa29PSitHYk9J?=
 =?utf-8?B?U2tkNEpVV216TTk5d3hLUys5VHNEdE9Dck83VEc1RW5iaklyWnlkRjBvem9u?=
 =?utf-8?B?NU9KVWIwdEllSVVuaGNtNTNocEJlS2NSOExqdUhFZ1VlenN2WmhlbnB0emxo?=
 =?utf-8?B?cXVxY3lCNDhQOXpHMUgxMG1xWVVqWVgzWU1JYVBZdEEvT2c5UWR2ZHRhNEw4?=
 =?utf-8?B?TUVFRTVyanMwU0RrbmF1YXFSdVRVQ0MrcXk2M3o5WVBOay83OW4zWTlIeGZz?=
 =?utf-8?B?eU5aWXFHb0VUc1NhQnNvMldLR24xNUxrbnp1QXFXR0I2amJXS2RmZUhheURB?=
 =?utf-8?B?U1liTW9WUTd4RHQ2NkxmUjZobXVvc3lsY2RsMTdHYkk3R0kxWExud1FjblM3?=
 =?utf-8?B?NkU4bWoyUzB5M3F6SFM2VmlyRG8rcW9XaDNxNnRBcXVHR0FFSUlqaUJCcVQw?=
 =?utf-8?B?SWE5SXJyWHpBd2ZPdmVkOWRKSVVLRnYwU3BtU1lHMDlRVHo2Rlp6UHhwUnV4?=
 =?utf-8?B?V1R5a3lxK25GUkFha1pkQ2xDaVlSc2xydThPOTVvOXU1ZXg0SFVUNGFTTmlY?=
 =?utf-8?B?UFBCL0FIZ3dHUFlPbTV3VnBiNFpQaCtNSXpnVXN4ZGpVNFBTOWN4L04zaExG?=
 =?utf-8?B?TXFSY0pWcWQwUUcwRUJDYXI2dnZLcmV4ZUVkUjF2RWxnRnh4YXcvSnNhQVR5?=
 =?utf-8?B?dXc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: c041aa64-6d5f-4762-fd6a-08de0a7e51c0
X-MS-Exchange-CrossTenant-AuthSource: BL3PR11MB6508.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Oct 2025 17:31:18.7997 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: el6LWgcaAnwvkTMcm8VeaUOPRTndnY3yhMV0AjTPCwuY9+A3mXL7rDd6rerGULQn6hn4tjgoH73mSVUpkYrhAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR11MB8118
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

On Mon, Oct 13, 2025 at 11:17:58AM -0600, Summers, Stuart wrote:
> On Mon, 2025-10-13 at 09:56 -0700, Matthew Brost wrote:
> > On Mon, Oct 13, 2025 at 04:25:03PM +0000, Stuart Summers wrote:
> > > Right now we are using the state of the GPU scheduler
> > > to determine whether we send and receive messages. There
> > > are some states, however, where we might intentionally
> > > pause the scheduler, like a device wedge, and expect that
> > > messages are resumed later once the user has taken the
> > > hardware state and is attempting to reset, like an unbind.
> > > 
> > > Remove these checks in the XeKMD and let the GPU scheduler
> > > handle state checks internally.
> > > 
> > 
> > We can't do this. The entire queue stop / starting mechanism relies
> > on
> > getting exclusive access to the queue by ensuring the scheduler is
> > fully
> > stopped - this includes messages. This will break job timeouts, GT
> > reset
> > flows, and VF migration.
> 
> I'm not sure I full understand here. The scheduler should be stopped as
> it was before, it just means we keep sending messages right? I can test
> the job timeout piece to make sure...
> 

This will show up as an obscure race condition — 99% of the time it will
work just fine, but I can assure you it will break the entire design of
submission.

> Basically I'm arguing the start/stop mechanics should be inside the
> scheduler and not in the calling driver.
> 

The message interface is built on top of the DRM scheduler, rather than
integrated into it. Originally, I had it built into the scheduler, but
based on feedback, I moved the channel to the driver side. Therefore, we
need to hook into the stopping mechanism on the driver side. The
layering could use some cleanup, but the functionality will remain on
the driver side.

> > 
> > What exactly is the problem you are trying to solve? The device is
> > wedged and queues are stopped, then an unbind occurs? That is
> > probably a
> > bug. IIRC even wedging a device / tearing down a queue we should
> > always
> > start the queue again. We could assert in guc_submit_wedged_fini that
> 
> I think there's basically a race between sending the cleanup message
> and stopping the scheduler. And once we send that message, we don't
> really track it on the xe side. So if we artificially pause things on
> the xe side (by adding the checks I'm removing in this patch), we can
> get into a scenario where the cleanup message is sent *after* the
> scheduler is paused and thus that cleanup message gets dropped, and we
> never issue the deregistration for that particular exec queue.
> 

That's not how stopping works. Stopping prevents future work items from
being queued and flushes all in-flight work items. These work items
include running jobs, freeing jobs, or processing messages. When stopped,
each of these interfaces can set up state so that when the scheduler is
started again, the work items are requeued for processing (e.g.,
messages are stored in a linked list). The key point is that when the
scheduler is stopped, work items that could be modifying the queue state
are not running, so the entity that stopped the scheduler has exclusive
access—without requiring any locks.

Matt

> Thanks,
> Stuart
> 
> > all queues are not paused.
> > 
> > Also if you having issues on unbind - there is this patch [1] which
> > fixes an issue too. I'm going to merge [1] now.
> > 
> > Matt
> > 
> > [1] https://patchwork.freedesktop.org/series/155417/
> > 
> > > Signed-off-by: Stuart Summers <stuart.summers@intel.com>
> > > ---
> > >  drivers/gpu/drm/xe/xe_gpu_scheduler.c | 6 +-----
> > >  1 file changed, 1 insertion(+), 5 deletions(-)
> > > 
> > > diff --git a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > index f91e06d03511..d9d6fb641188 100644
> > > --- a/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > +++ b/drivers/gpu/drm/xe/xe_gpu_scheduler.c
> > > @@ -7,8 +7,7 @@
> > >  
> > >  static void xe_sched_process_msg_queue(struct xe_gpu_scheduler
> > > *sched)
> > >  {
> > > -       if (!READ_ONCE(sched->base.pause_submit))
> > > -               queue_work(sched->base.submit_wq, &sched-
> > > >work_process_msg);
> > > +       queue_work(sched->base.submit_wq, &sched-
> > > >work_process_msg);
> > >  }
> > >  
> > >  static void xe_sched_process_msg_queue_if_ready(struct
> > > xe_gpu_scheduler *sched)
> > > @@ -43,9 +42,6 @@ static void xe_sched_process_msg_work(struct
> > > work_struct *w)
> > >                 container_of(w, struct xe_gpu_scheduler,
> > > work_process_msg);
> > >         struct xe_sched_msg *msg;
> > >  
> > > -       if (READ_ONCE(sched->base.pause_submit))
> > > -               return;
> > > -
> > >         msg = xe_sched_get_msg(sched);
> > >         if (msg) {
> > >                 sched->ops->process_msg(msg);
> > > -- 
> > > 2.34.1
> > > 
> 
