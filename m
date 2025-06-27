Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B29D5C7EE2A
	for <intel-xe@archiver.kernel.org>; Fri, 27 Jun 2025 18:57:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4698610E062;
	Fri, 27 Jun 2025 18:57:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="IF2aOBxM";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7352210E062
 for <intel-xe@lists.freedesktop.org>; Fri, 27 Jun 2025 18:57:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1751050673; x=1782586673;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-id:content-transfer-encoding: mime-version;
 bh=Qg3MOo8bVroraOuKDJ6VcWS6RNlolEWErRStt5izvL0=;
 b=IF2aOBxMZEvhh9xBk2TkCeCAS+CUnlF6srRcK96nGyHwJ20SLC2kfAc6
 m+URGTgW/R4FeXp3MDUz/vscfOdcMF5EMXwkLlWpKIDykIOUatRuDcCNV
 njSJlN1F0l7X6MUjwAIuJN14lUzZBjkt8izc9SO00ijsPfVT3ZxFMQSte
 tQOjIKJbRJc+tH1U/q3jzwc9H/amNIGN083ZDCebXH18w1TX/un6a57dI
 eJVORSZmlJ8qkHEgpLXiBKJzhPSZFQ+G3UlOIW9f79YUNNU+YJiwdz57S
 1Xu5SXFIy7/grKw26kgpBZuR4vlbgwEVUot22SsPrBOg/UooKoG8sVs23 Q==;
X-CSE-ConnectionGUID: qP/8mYz2Tl+QwtyJ3b47+A==
X-CSE-MsgGUID: csjn42WBS/yKD1FtgQhg6g==
X-IronPort-AV: E=McAfee;i="6800,10657,11477"; a="53095010"
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="53095010"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:57:51 -0700
X-CSE-ConnectionGUID: qhz9Dd81S++fYRYd7kiyTQ==
X-CSE-MsgGUID: cQ3onjuWSOefL4SKZvws2w==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,271,1744095600"; d="scan'208";a="183793479"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 27 Jun 2025 11:57:51 -0700
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:57:51 -0700
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Fri, 27 Jun 2025 11:57:51 -0700
Received: from NAM11-BN8-obe.outbound.protection.outlook.com (40.107.236.76)
 by edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Fri, 27 Jun 2025 11:57:50 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=slJGtDwyxheu9UlunlTPRkqX8enpopbecS6qqz/+44pcYzGnty/npLx3zY3s9LxBsMYtar/1YcCMj3Pc4HqpMTQe5QY5qtKVIWIMBmg0y258GMJHM4gLlLSKdJNF1Mz5GObN0W5tE+nspfleEiphH23A/mZbOlh1PgtRSzXrk0SCqcP48GbQ2w3uxb3VAf/tjUqiXjO47tF5dyxP4A9LFdZgDDv5D02cDhecQEGuP8V2fRsPaNYFpAoSxjGHL03/+JRL7DpHmNy3imdagX5Bytlq1oKxaPWNfauyb639nWV+Pi0mXSm7SJ2Tq9MyDzAABj6PRr3XH19w0r/lPgWaIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qg3MOo8bVroraOuKDJ6VcWS6RNlolEWErRStt5izvL0=;
 b=Q3qCCOxNnH+ElzsaWbKYmrhp/oGJyN6uvIEJUH1qtYEAVEh0bfDaJft1uVBADfohpWuFxPX1s4jKPmb9KEvZR9mf6tJSIHahCKSk1FD4LF9gNk/SMTHHHLit6J3vWB836Qdc17zq2hq8nihUUumevYi63Rn65lp65P6fNO8YMhk1YvOp/7t9k4u99krDZm9nAsn5UR5If2qP8ywRj3yVkWEEmbm8+j4GzjL6Y+uwQjV4BMC72lGFARtGHCNt3FMj3uja6dH69+04mYs9aW/Dgh0iFGkGvo1JIpCrjnj31qGH87dokEV9y/+cSjRna2uGtm2+cAx7uCYRZ932Nfuzgw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB8179.namprd11.prod.outlook.com (2603:10b6:8:18e::22)
 by DM3PR11MB8735.namprd11.prod.outlook.com (2603:10b6:0:4b::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8857.26; Fri, 27 Jun
 2025 18:57:48 +0000
Received: from DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba]) by DM4PR11MB8179.namprd11.prod.outlook.com
 ([fe80::f5c2:eb59:d98c:e8ba%4]) with mapi id 15.20.8857.026; Fri, 27 Jun 2025
 18:57:47 +0000
From: "Souza, Jose" <jose.souza@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "tvrtko.ursulin@igalia.com" <tvrtko.ursulin@igalia.com>
CC: "kernel-dev@igalia.com" <kernel-dev@igalia.com>
Subject: Re: [PATCH v7 11/24] drm/xe: Flush L3 when flushing render cache
Thread-Topic: [PATCH v7 11/24] drm/xe: Flush L3 when flushing render cache
Thread-Index: AQHb52g9qzxDPgf4y0GJW+5zkZ1dbbQXUjgAgAAJs4A=
Date: Fri, 27 Jun 2025 18:57:47 +0000
Message-ID: <3bbea88dc4e95e6e976f0143a38ae40b813a9728.camel@intel.com>
References: <20250627133340.54603-1-tvrtko.ursulin@igalia.com>
 <20250627133340.54603-12-tvrtko.ursulin@igalia.com>
 <371c413dbaeb584cf56264bd7d1d44d0ca284ec5.camel@intel.com>
In-Reply-To: <371c413dbaeb584cf56264bd7d1d44d0ca284ec5.camel@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB8179:EE_|DM3PR11MB8735:EE_
x-ms-office365-filtering-correlation-id: c236e232-0a6e-49c7-7bcd-08ddb5ac8228
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|376014|1800799024|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?dU1Ib1JyOHZYR0VnM3RBNXQxWTIrRWtBYU5xYjNDeTBXMWJsUWxuVEtGblhi?=
 =?utf-8?B?dXg4MGNnb0lMUkpnRStqRFNXRFRIUk1iQ1BkK0ROemtQNlpuMjFYOFowZVBL?=
 =?utf-8?B?NUpMSm1WLzJEd1pCS2d3dy9vSFdkOE9nV1ZpNnd0UUNNalBqR3hScGJLS0cr?=
 =?utf-8?B?ZjVDeWlaTnRqbnNiVTY1dm1kcGhhb3RNWUFySTV0RG9DalpHTFZ3cjZXVWtz?=
 =?utf-8?B?Y1F6M04yK0JxMnU3aDl0NHJYTnR0b0hKdzdqdGFGSER6VDNmYkNESVlSODVi?=
 =?utf-8?B?N1RRajZXZEdOVSs2aW9yUTJpSFQwdVZWK2JLZzNjZmZ1aWpLOVFRUXNQM0tp?=
 =?utf-8?B?UjdtVUtEaEkrWHluamJjWE1xR1hMK0FIcDBidHExMTNkdXBXc0FNT2pjRWFI?=
 =?utf-8?B?SDR3WUxXNWYvdkNXQnBFMVRlUnF4YjR4bVVVNzhrckVxT285R3hNaTNmWGdl?=
 =?utf-8?B?WCsxSXB0QUNsQ0Qwb2p1bTB4K0w3WW02azgxQmx6M2ltenA5cElQdUdZYTBC?=
 =?utf-8?B?SFp4Z1ExMlg5cDNGWTNrME8xUHFWZUtYNk0wL3RiaEhVendzS1BpOGlRQzZw?=
 =?utf-8?B?YitKYmdZdnFsWERmbGtGSi92QXNqVDF1SzVMRUlyNjZiSE04SHFxdm5TWXA2?=
 =?utf-8?B?L3UvMEdNNWtmV29wUHl0ZjE3dmFNbFJvclk0R0NucFphSXYrV2dNVFg3Z3Bu?=
 =?utf-8?B?aTUyVDRjVzFDRmI1RTdPTzhybExCU1FjcUwzUWV6YlpIM1BKZDBMeTB0dnpJ?=
 =?utf-8?B?VzYwU2d4SXo3bzYwK3RvMGNtWFAxb1Y4cU1ZTGF3cGhramhLcHpTNmNBc2pi?=
 =?utf-8?B?REhzMjkwTWdack02cjA4UzNKdGhPSU5OVEQwd2lxc2g2SkZoS3pldlZIZ1lz?=
 =?utf-8?B?L0JmblQrU2hBc3RsSG9PNFRxanROSTFBVnBtSyt4LzNJam5oZWhScnFzREE3?=
 =?utf-8?B?dnRnamNkYm8vTkhsYTJtQ1Rabmw4d0xQUW1RR2tudTAzK0VUR0dQMFBQQ2dw?=
 =?utf-8?B?KytyZXU1ZlYzT25UZHhheUwyc01QU1hoQU9ZaytZYWw4dDZWNGg1REE3Y2pC?=
 =?utf-8?B?aDFYL3lWWkV4ZmdSdlAyWnUrdzJSNjRLelZuLy91enpzelRqWTE3VERlNDZz?=
 =?utf-8?B?Nkg1Y3FCRlNFL3ByMGhiTnAzdDhoRXlnOVlYOTdOQXFSd2MvMlQ5UmNkNDZ2?=
 =?utf-8?B?UnNuenROdkZlcHhqczJsZ2h5RUNnT3YwVjJVa0lYUkFmQTcxeGZ1Sk5CcDhJ?=
 =?utf-8?B?eTFrSUpSMFRRaUJ4Q0FObC94U2VCc0M5ZmNLQlN4d3ZwdEQrb3p2L01CMi91?=
 =?utf-8?B?cHAzdFRJelBuSko0UFQrRVBOTk5IaU43Q3FhWnJ5TDdjZFpnY2Y0QUJJNkRQ?=
 =?utf-8?B?UU9WUEhUSC9Tc3Q3VDdGaXdKdUV0YUVKWE9lWW5Bc1JJT1NsZzk4L01zRmtk?=
 =?utf-8?B?dWJ0cFMrUml1b0NLUmVETUFaczN4bFJXbXozajBqMVhTUVE4ejVZYlRKQ0dB?=
 =?utf-8?B?RGJ2NHJoWVlNN3p3UUh2OWFjQklNTU9rdHI5ZE1iVDlmRkI4SmRjN2VVVDI0?=
 =?utf-8?B?bmZwQVJnR1pjbzVvTjE5VEZNNTl2WnlPU25pbW5qbnp0L054dXREN2FzK2xt?=
 =?utf-8?B?NVMxQWRiL2E4OFFuc2JkMnNQRnBCNkUxcmFlS3p4MFZhSWhiWnArL3B3cmdz?=
 =?utf-8?B?TjJyZlBpcDBoV3Z0SHBHSG5sNjFXU2ZMY1BjMzEvVE1BbndkMkNRa1ZZd3J6?=
 =?utf-8?B?ZUZGRDVWekxxWFo1S1A1VXIvWUptajdLaFpjY0tQOGFaSnFKK1lnNS84VlNm?=
 =?utf-8?B?MzJnaCtsRTNoK1hjTE0xOXJWenlveFdNL3V3bWN4NXZKbHl4R05kSGJVdGVS?=
 =?utf-8?B?VkhCVmFqZllYSlAvZFRLWFRLVXdlc3Jhb1lsU1FWd1dBSExvWjNLc3pBb1ps?=
 =?utf-8?B?Z1BNeU1JQ3FxekRXS05CejBlWWNwTi81ZEM2aXNjaEtzYkFhSzMwVXJEcm15?=
 =?utf-8?B?ekdDWVVPaElBPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB8179.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?SDBuaW03dmpKbTJrenlZVGZLWmZ2Si92K2JJbXZxRlFMamwrZmtlWkUxdGkr?=
 =?utf-8?B?UFFXamhTamlRenJmbWd2MHdFaG9NS3pBZFR1WkcwUmVhREZLMUg0dVBsOUhj?=
 =?utf-8?B?Z3FpS0VNSURBWkNSRW8rMW9TR0Q5aExiWkMrcmlxOVc1RmcxY2UrcWdaWjdB?=
 =?utf-8?B?SzJXZHJua25XOFR0dmZGaGJzQmFsNGdibDlGUlVXbTFOSDlTRC9DWVBYQmFM?=
 =?utf-8?B?UGUvSFh6cTc0TUpua09RRkdBdWNCMkhIdzBlZ0RRUThxdHdsSGJJVkx0MjJh?=
 =?utf-8?B?ZXZpN3dML1BabEtTS1ZBZHE0YzJwUVNLK1dZUExFeWxKeWhhUDdaOVByWk5h?=
 =?utf-8?B?Y0xza09Yekovb2dPeFVKUisyQkk0RFMzSnZMNWh1SHhISHlDWUU2bWw1ajR3?=
 =?utf-8?B?d1B6T2ozZ1BTeEcrdnpVYWxOMnJ3RmpoVG1IY2xITlBkVnpEL2RJZWZ1MExH?=
 =?utf-8?B?OTJZdW45UG0zNFNtcGUvMVloSWVDbkYzUndtQWROMXBJNXJOd2ZKTUlGckM1?=
 =?utf-8?B?S2ZrV1dtU29ERVZFZWpIbVBYSWdNcWZFUWV4ZnppYktRU0Fsc2FPbFZBcDFn?=
 =?utf-8?B?bzREemh6MDlJWWY5aWRaY1RQUUZhcUlZUHhOclNZZEF5alljMlpuZHM3MXJh?=
 =?utf-8?B?M0N6dWZaRzl4WmVnelovSXZUVW9VZGJid3hDZ0Npa2dZMURCVlQvY3hpL2gw?=
 =?utf-8?B?UVZLMjJvUGVZdW8xZ1c0cFpVQmF3Q2RocjBVUDI2V1drK2VjcFBJWC93SG9D?=
 =?utf-8?B?bEEzSDF6RWR4eUE3TE1FSWswRmdFaUxyNHRyRFh4ZlB5M1pxTW9NYlVwRmkr?=
 =?utf-8?B?L2NvU0ZjaDBWVElqRWtaZ2E4aG9TY0ZyM0VNSmlDekFVS0JaV0piMFVrKzQ3?=
 =?utf-8?B?bE1kN3N6T3ozTEFvQ2N1ZXc5ODNSd2xzeVBkaGs0T1Nha2MvOUd4eis0Nndt?=
 =?utf-8?B?RFhoZk1Pd2FpcUsyRXNjRldrdjk0bXYrYmFuR09EbDk1U3ZLQ2lsM05uSEVZ?=
 =?utf-8?B?UHl3N3hCZDVrY0pYRTNIeWlvRTZlZ1F2VmlDTDQySFB1LzV6cnlWUWF3eWYw?=
 =?utf-8?B?VmJ3YkQvS2VQTVM1YzhtOWJCOXpETXNMT21SUXVZV3NzNzcxZVIvT2dJVVFx?=
 =?utf-8?B?MUdiZC95ZU9FUVJvenp4TVVPa09wc09pK2FDcEM3eHR0dUtmcGtQRUpSQWRt?=
 =?utf-8?B?Rjl6a2lyS2NMQTBqSENqdDROOFlOeHJOZmw0YW80c2ZieCt3Ym93cU5lUC9o?=
 =?utf-8?B?WWtKeTgzYm5LdWlXeFUxSE1uWU1NZW9FbElvbGo2Nno0RGdPbG50SlUzODQ1?=
 =?utf-8?B?N2ZVSGhST3FiNUZmQS9yR0hYVnpBY1VnN01OQ09ubWtVVzROSXdZSUNWZEFC?=
 =?utf-8?B?bm5kNGdRZnN0ZS9HdktHRTRKYStEMnBiWEN0YVIwVWYwTFpFeVRLbWV5Sld3?=
 =?utf-8?B?K0N1VUNTbktLaU1DZUppSTlmRitSK0kvK0tOWnJaK1RSUVp4Y1ExbDFHdmtx?=
 =?utf-8?B?aDdCWXRBK3N1M0cvRm1JZUJyNXprYmNraDk0emFnRWJ6ekh6MThiM05IKzJj?=
 =?utf-8?B?WTRkbGtqZThIZnlWYURxc3oxZVhVZ3dwdHY0ZStlRmYxSTloK2VGdzdWMHZk?=
 =?utf-8?B?bFhMdG81QU04Ti9rSVBZaFMvcUlLSHZMZWJhMU1YUFk2RVN3RnhGQStSc21J?=
 =?utf-8?B?cW03Ulg5MEhKejI4VkIxRlR0MUttSFZIcGhTRjZMYllFZk5lSHdTRzFSRGR4?=
 =?utf-8?B?bys0TDA0bWFCdHFPU1FYMlNsOXl4dFdYa0wyQktLSGc0ME5aVE1STlloMm9z?=
 =?utf-8?B?aWRLVGFpV3hpbTNXT0VRa25vbGhpNW5uVlkwc09GQkJUdFZvQ2x2NzlMaGth?=
 =?utf-8?B?RlVhb0pMdkszODUxcnZBZU5GRmIyRVIrU1lNVW9IemJQRmtid1NjZU5HeGxF?=
 =?utf-8?B?Y1hLcWtxYUw3ZkVYWk1LWHByakk4MjdnV0NVNGM4ZnQ2TmFYWk1STmo2aUd4?=
 =?utf-8?B?Nk1PZmF6UVVXMStPYk9TUkY5bEpDcmQrYk5TQVRzZHVhUTI3VVpZVXJGRFRD?=
 =?utf-8?B?ZVpZcTRNQ3E2L21QUTJSVnN3WEVoR2x0dzAwZFluK2ZWOHJPYldqbE82UjVs?=
 =?utf-8?B?VHNZZTNrbkJCVFNMMVFzMDNFZjIzM1hQYS9sejBZcjVKU3BvNTdyUlAybFY0?=
 =?utf-8?B?QkE9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <FB14B3EBA040C44DA102E37C3FFDD49E@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB8179.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c236e232-0a6e-49c7-7bcd-08ddb5ac8228
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Jun 2025 18:57:47.9023 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: AMpZsm2IcAVET74m6u6Y4jUGQ5fC7ezEEb+z8Ne3Uq/IvIb5nLWUNp9glQwsNuOlUSGjfSO8YcNDqB8TmVZ3WA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM3PR11MB8735
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

T24gRnJpLCAyMDI1LTA2LTI3IGF0IDExOjIzIC0wNzAwLCBKb3PDqSBSb2JlcnRvIGRlIFNvdXph
IHdyb3RlOg0KPiBPbiBGcmksIDIwMjUtMDYtMjcgYXQgMTQ6MzMgKzAxMDAsIFR2cnRrbyBVcnN1
bGluIHdyb3RlOg0KPiA+IEk5MTUgc2V0cyBQSVBFX0NPTlRST0xfRkxVU0hfTDMgKGJpdCAyNykg
d2hlbiBmbHVzaGluZyByZW5kZXIgY2FjaGVzIGJ1dA0KPiA+IGludGVyZXN0aW5nIHRoaW5nIGlz
IFRpZ2VybGFrZSBQUk0gbGlzdHMgdGhhdCBiaXQgYXMgcmVzZXJ2ZWQuDQo+ID4gDQo+ID4gU2ln
bmVkLW9mZi1ieTogVHZydGtvIFVyc3VsaW4gPHR2cnRrby51cnN1bGluQGlnYWxpYS5jb20+DQo+
ID4gLS0tDQo+ID4gSXMgeGUgbWlzc2luZyB0aGlzPyBPciBoYXMgdGhpcyBiZWVuIHdyb25nIGZv
ciBzbyBsb25nIGluIGk5MTU/IE9yIGlzIHRoaXMNCj4gPiBhbiB1bmRvY3VtZW50ZWQgYml0Pw0K
PiA+IC0tLQ0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hlX2dwdV9jb21t
YW5kcy5oIHwgIDEgKw0KPiA+ICBkcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYyAgICAg
ICAgICAgICAgICAgIHwgMTAgKysrKysrKysrKw0KPiA+ICAyIGZpbGVzIGNoYW5nZWQsIDExIGlu
c2VydGlvbnMoKykNCj4gPiANCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL2lu
c3RydWN0aW9ucy94ZV9ncHVfY29tbWFuZHMuaCBiL2RyaXZlcnMvZ3B1L2RybS94ZS9pbnN0cnVj
dGlvbnMveGVfZ3B1X2NvbW1hbmRzLmgNCj4gPiBpbmRleCA3OGMwZTg3ZGJkMzcuLjI3ODkyOTg0
NDAzYyAxMDA2NDQNCj4gPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0veGUvaW5zdHJ1Y3Rpb25zL3hl
X2dwdV9jb21tYW5kcy5oDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL2luc3RydWN0aW9u
cy94ZV9ncHVfY29tbWFuZHMuaA0KPiA+IEBAIC00Nyw2ICs0Nyw3IEBADQo+ID4gIA0KPiA+ICAj
ZGVmaW5lICAgUElQRV9DT05UUk9MX0NPTU1BTkRfQ0FDSEVfSU5WQUxJREFURQkJKDE8PDI5KQ0K
PiA+ICAjZGVmaW5lICAgUElQRV9DT05UUk9MX1RJTEVfQ0FDSEVfRkxVU0gJCQkoMTw8MjgpDQo+
ID4gKyNkZWZpbmUgICBQSVBFX0NPTlRST0xfRkxVU0hfTDMgICAgICAgICAgICAgICAgICAgICAg
ICAgKDE8PDI3KQ0KPiANCj4gT24gc3BlYyB0aGlzIGJpdCBpcyBQcm90ZWN0ZWQgTWVtb3J5IERp
c2FibGUuIEkgdGhpbmsgd2hhdCB5b3Ugd2FudCBpcyBiaXQgMzAuDQoNClRoYXQgaXMgYWxzbyB3
cm9uZyBvbiBpOTE1IG9PLg0KV2lsbCBnaXZlIHNvbWUgdGVzdGluZyBoZXJlIGFuZCBzdWJtaXQg
YSBpOTE1IHBhdGNoLg0KDQo+IA0KPiA+ICAjZGVmaW5lICAgUElQRV9DT05UUk9MX0FNRlNfRkxV
U0gJCQkoMTw8MjUpDQo+ID4gICNkZWZpbmUgICBQSVBFX0NPTlRST0xfR0xPQkFMX0dUVF9JVkIJ
CQkoMTw8MjQpDQo+ID4gICNkZWZpbmUgICBQSVBFX0NPTlRST0xfTFJJX1BPU1RfU1lOQwkJCUJJ
VCgyMykNCj4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMg
Yi9kcml2ZXJzL2dwdS9kcm0veGUveGVfcmluZ19vcHMuYw0KPiA+IGluZGV4IGExMjg5ZjA4NjE5
MS4uOGY2NTViNmZlOTEzIDEwMDY0NA0KPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9y
aW5nX29wcy5jDQo+ID4gKysrIGIvZHJpdmVycy9ncHUvZHJtL3hlL3hlX3Jpbmdfb3BzLmMNCj4g
PiBAQCAtMTk3LDYgKzE5NywxNiBAQCBzdGF0aWMgaW50IGVtaXRfcmVuZGVyX2NhY2hlX2ZsdXNo
KHN0cnVjdCB4ZV9zY2hlZF9qb2IgKmpvYiwgdTMyICpkdywgaW50IGkpDQo+ID4gIAlpZiAoWEVf
V0EoZ3QsIDE0MDk2MDA5MDcpKQ0KPiA+ICAJCWZsYWdzIHw9IFBJUEVfQ09OVFJPTF9ERVBUSF9T
VEFMTDsNCj4gPiAgDQo+ID4gKwkvKg0KPiA+ICsJICogTDMgZmFicmljIGZsdXNoIGlzIG5lZWRl
ZCBmb3IgQVVYIENDUyBpbnZhbGlkYXRpb24NCj4gPiArCSAqIHdoaWNoIGhhcHBlbnMgYXMgcGFy
dCBvZiBwaXBlLWNvbnRyb2wgc28gd2UgY2FuDQo+ID4gKwkgKiBpZ25vcmUgUElQRV9DT05UUk9M
X0ZMVVNIX0wzLiBBbHNvIFBJUEVfQ09OVFJPTF9GTFVTSF9MMw0KPiA+ICsJICogZGVhbHMgd2l0
aCBQcm90ZWN0ZWQgTWVtb3J5IHdoaWNoIGlzIG5vdCBuZWVkZWQgZm9yDQo+ID4gKwkgKiBBVVgg
Q0NTIGludmFsaWRhdGlvbiBhbmQgbGVhZCB0byB1bndhbnRlZCBzaWRlIGVmZmVjdHMuDQo+ID4g
KwkgKi8NCj4gPiArCWlmIChHUkFQSElDU19WRVJ4MTAwKHhlKSA8IDEyNzApDQo+ID4gKwkJZmxh
Z3MgfD0gUElQRV9DT05UUk9MX0ZMVVNIX0wzOw0KPiA+ICsNCj4gPiAgCWlmIChsYWNrc19yZW5k
ZXIpDQo+ID4gIAkJZmxhZ3MgJj0gflBJUEVfQ09OVFJPTF8zRF9BUkNIX0ZMQUdTOw0KPiA+ICAJ
ZWxzZSBpZiAoam9iLT5xLT5jbGFzcyA9PSBYRV9FTkdJTkVfQ0xBU1NfQ09NUFVURSkNCg==
