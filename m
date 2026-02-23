Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C358EEC299
	for <intel-xe@archiver.kernel.org>; Mon, 23 Feb 2026 21:56:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A3E510E317;
	Mon, 23 Feb 2026 21:56:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="RN7zUll4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0104910E317
 for <intel-xe@lists.freedesktop.org>; Mon, 23 Feb 2026 21:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771883789; x=1803419789;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=SM8Wh9+Af7kWeuk+IlVoXVN+82xsEOqYYAOrIf8mgSE=;
 b=RN7zUll4kc1ugBlMkjirb0AOxUR2BMYfIxK6xOEH2MaDUq/ijlHMiWHK
 OuzbRWvHzLeaeeNNxg5Ntsyqj73X4k3ijWf+KSR4l5B8lnIM5x/tNA0tK
 HBwnocHjXcRaMS30Iibx/nUl3Orzz8Jueh55GrMJdOrt3ZZCsw9KxaPMP
 5MCkgJ/PIAXSC7Vr7d7o3W7M7tXgMAEIXL6z/wWVUQksZ8BX2Mjq4544d
 KxwKFQ4kxoOGOLw6/vJ3Xleyc7io5Aao+c/fQmcl1vqTzKBw/J/98/ga/
 O3CaAJbwc3uQt6uf8suSsKkh8XcV2RM0Efov5bjYbuJnm4K9/Wjmcw8qp A==;
X-CSE-ConnectionGUID: wdLsh3/PRFy0aTLFqeL95A==
X-CSE-MsgGUID: higbYsb3TZaIVUORwomXkg==
X-IronPort-AV: E=McAfee;i="6800,10657,11710"; a="98355104"
X-IronPort-AV: E=Sophos;i="6.21,307,1763452800"; d="scan'208";a="98355104"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:56:28 -0800
X-CSE-ConnectionGUID: RVwxnUd7TuGgjMHZM67iYw==
X-CSE-MsgGUID: wOpK82sgQzKgLo9x1NCOlg==
X-ExtLoop1: 1
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa003.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 23 Feb 2026 13:56:28 -0800
Received: from ORSMSX902.amr.corp.intel.com (10.22.229.24) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:56:28 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Mon, 23 Feb 2026 13:56:28 -0800
Received: from PH7PR06CU001.outbound.protection.outlook.com (52.101.201.0) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Mon, 23 Feb 2026 13:56:27 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UgUX0spNDB6f1QJKoWwPoZ6N3D6+MW7vcRC8NSj77pvzNKkx9kgEZdnkJTz9BK7bFl7rVeEJjo2Z8P0sHPiJTAV+luEFe4i91C6+pcLX3LO5Qkm8tn317306akgt66Ib3zhXZ/uRjQBMpRcPE3QquWD079Z3KJRbPGXOINl0ZWIP6jzXEUW3Btr9IVXD0miJ2R+z5/DEVnGzPVyW16G0eiltTcFacHFt1LNC4bg5/UXLS2qmj+sDUUk6zNagR1K2KFizrRecOTUr44nMIwXx5h+ylQK4xwvlFP3URzr2bBQFIqEXHleqiif46w6KBXxFtr5HelHRbyajaRe700RKeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SM8Wh9+Af7kWeuk+IlVoXVN+82xsEOqYYAOrIf8mgSE=;
 b=dzzJaQGDb2GY71ULl0aFIe7s79Gl4fg8IISbOB2rp9adUIQ9ygoGclQupmKeSBIUrZcDd+AlJD+Opt84HLRB13UkpmG3LUBk/PU8MkFaeGPLZ29hPZqnAutmtbo9EArgP45so89NST70StskzDkhfyQy024gZufegw9tKUdlh4YpUaqjhMDr5c+4OXxGDWG9SrbUztiJwnC8kXHQ8TZ8Awej7FMw3gFnXgJntHl93z4eqQxH0xIaKfiOKSK7OEkvN5P4DfpN/4c7BfvpszNs1SGhEVBqlumRs2mPNEe09mAhQo6OE5+aFi1w+RyX/Y1h5heclpLgLJNl8HeThF61fA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM4PR11MB5456.namprd11.prod.outlook.com (2603:10b6:5:39c::14)
 by PH0PR11MB4936.namprd11.prod.outlook.com (2603:10b6:510:42::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Mon, 23 Feb
 2026 21:56:21 +0000
Received: from DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082]) by DM4PR11MB5456.namprd11.prod.outlook.com
 ([fe80::62e5:4a7c:f965:9082%6]) with mapi id 15.20.9632.017; Mon, 23 Feb 2026
 21:56:21 +0000
From: "Lin, Shuicheng" <shuicheng.lin@intel.com>
To: "Roper, Matthew D" <matthew.d.roper@intel.com>,
 "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>
CC: "Roper, Matthew D" <matthew.d.roper@intel.com>
Subject: RE: [PATCH v2 18/23] drm/xe: Consolidate workaround entries for
 Wa_14019988906
Thread-Topic: [PATCH v2 18/23] drm/xe: Consolidate workaround entries for
 Wa_14019988906
Thread-Index: AQHcoo5g8r804aWaUE+dtHFbDB3rQrWQ2Plw
Date: Mon, 23 Feb 2026 21:56:21 +0000
Message-ID: <DM4PR11MB545647FDDB60BC6604B82A1EEA77A@DM4PR11MB5456.namprd11.prod.outlook.com>
References: <20260220-forupstream-wa_cleanup-v2-0-b12005a05af6@intel.com>
 <20260220-forupstream-wa_cleanup-v2-18-b12005a05af6@intel.com>
In-Reply-To: <20260220-forupstream-wa_cleanup-v2-18-b12005a05af6@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM4PR11MB5456:EE_|PH0PR11MB4936:EE_
x-ms-office365-filtering-correlation-id: 164024f2-8756-4e3c-f66d-08de73266140
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?dDdONVBYSG9vWU15c1FsQ1dSeldWeHRkUDJBNEo1ZEcvbUVwdG4zSGM1KzF5?=
 =?utf-8?B?aE01Y1RKR2ViSzVyZnFvU1ZjR2RGK0M2S09aUzlERE8yYWZHbTNEbmQwVWFU?=
 =?utf-8?B?SzY2V1kreHVOcmpTR3VCS3JuYStjZFVJbytLU1d5L2RzbUU2QXQvaEZSM0RJ?=
 =?utf-8?B?UnhBL0lTNlU5bUxJUDJUM3N5TmxBTC9ZSHhYTVFZQWxZS3oyQ0xPZzd4TWp0?=
 =?utf-8?B?Q0l4eXVmZlJtRUFRTzc5TEplRVBnZS9ZTUwxVmh6MnJYdHg1WXFCWEFVaHRx?=
 =?utf-8?B?UEdaS0JVYlNFYXkrM01tVkZEaTl4RVVNcmhIdnFEdjVhZG4yOWc2UTg5OXVD?=
 =?utf-8?B?VDJ2WGpQT3JkcW5OcTFzQ3BHSmZlQzNxRHgxL1RTUUQ5SVNyeWRnTHJMNVMz?=
 =?utf-8?B?NkRNTk85bURlTlVMWWxDQThTYUx0ZE12TEhlR1ZXU2JmTWNrT0JQK2gzSzJn?=
 =?utf-8?B?YllLZ2txanNqWDJ0NjRtajJiZStudmZ1TnZ5Z1JUOGVKRU54RitOb01oVm9s?=
 =?utf-8?B?WHluTktQb1FRQzNBSElIdGlZTTcwTVR0YUYraVlCSHRQS2F2WnpyTk1hODBQ?=
 =?utf-8?B?MFFNaDR6VW9TZkIrQzZEV3B5RDROMmU5OVZiOUlRMEExbndtMlZsSGNLOG5q?=
 =?utf-8?B?TjRSSUtqOHZUUzJlbHBra1ZLc3RNWXBOWUdPWmdiT2J1NmFUaStOS2I1Ulls?=
 =?utf-8?B?ZzYvQis5bXpZemMvbDB3Y0hsVUVoUXpZQWVSbGszU09NemR0VjArdnpYQzFh?=
 =?utf-8?B?cmxCbVduSnNMQkxWWnVpeG1PSUdra0ZWZXZJakxjZVJLa1FnQ2prb3BwRGN3?=
 =?utf-8?B?c3NzcDhYY3BmTUZOYktXUzRTS2xidFl3RWF1bmJwQkV4UkdyU05FbXhQTnBi?=
 =?utf-8?B?YXREY1NWczg4eXZ3bG8wdm9aUVRKSEI2TFA3RzQ5TGdMY1hOMmJ0elFnNGhJ?=
 =?utf-8?B?Vzd6Z2g4OEdxTkkrVmFHZG8yOVFqV0doRlpNWFhmL2YrNlA3U3I4K0hWRnQr?=
 =?utf-8?B?OGJoM3ZmL2lzbGl6Q0pybWxZK1RsWVJPOTVpRHB5ZmJqS1h2SzU5dXRFT2tC?=
 =?utf-8?B?U3d0NzNma3hrNFlPMFd2MlRFcDZLN0pYRjhNU1JTNUFNNzljNkZuWjVUcDFZ?=
 =?utf-8?B?Vm5LUUhkWjNBYlgwcWUwWEtYVHcvVXRzak9oYmJJZWFYZlBaZy9iT0JIRmND?=
 =?utf-8?B?WkxTeHJGeFIzQkF0WldSLzVDYTZCVFV5MURHZjE5bk5SUmw3aitFV01HZTBO?=
 =?utf-8?B?am1JNENYZGtTcDl4b1lXaWNRS2hRT3R0NDlJekkrNE5QQ1NxVmdrWjMzSjFp?=
 =?utf-8?B?cVdBSUFMN3RpVjUvc0Nab1N6Snl3S2NiZG1aUHpIc3dBTisxQzZuMERzT0Zx?=
 =?utf-8?B?MmFwQWYwSjFzQjFISXNaUWxUd1RUUGd0MEJZa0NVTGxNcGFuR28wWktIYlAz?=
 =?utf-8?B?R0JkTFYzTmg0bG1IdE5GZHhPaGdpbjVKUzhEM2w0c08xdlluUnExNnMxYVlV?=
 =?utf-8?B?TEZYL1NhNUx1blJOSTFEek5OanhzRys1ZUFzNE1yYlF6anovaGhiOTNYMVpk?=
 =?utf-8?B?b09aaERleEkyL0JNYnFmRE9ZQW13SzR5SXZLWkRkeTNKblFHQmtwQ0cvVWtZ?=
 =?utf-8?B?dG9KSDk0RHhOQjlBRzJ2QVo4NWp4Y3BuOEVkTFVDRHJvNUFHWTh2VlBKUzlt?=
 =?utf-8?B?OVowZWkvdFBJYVc1bXZKUGhXd29XaHlWRlZDZUlQVTJnclJuSXp3ZGlZeUFP?=
 =?utf-8?B?emRjUkxxUFBaSWJIb1F4WjQvUlRLYWw5ZkhqdmJFVytpZU1NVXdNcGgzaGtn?=
 =?utf-8?B?N2JHRTlPcnhaaGMwRW9BNUxMME1xQmpybmszemNybUdyeXBMTUJyV0htWmcy?=
 =?utf-8?B?Wnp2bmsxajJOLzBVcmZkMTV2dVVVYUhjQzY2WTlGZzZYU2Z6dWlBejhKbnlG?=
 =?utf-8?B?WUs3WHVocmw2YTF3cVA4TmU0N1BYMm1STGNXSVNEMjliZXptRTljRHVkMXU3?=
 =?utf-8?B?WHNRd2lrb2pxMlJZV0V2K2pQMmFVMXRXNjVuSXp0cGZZTlNKejJnTlA3OElK?=
 =?utf-8?B?QjVlTjEyc1A5ZEp6YmhiNDdnKzdtZy9ISjhNWnozckp4S1FlaWZoRHBCZytz?=
 =?utf-8?B?YlFhdThwTjJEV21kV2lPMTlPYndpL0NjSUh3bGdQTFk5a3A5RVpxWjlhQUt5?=
 =?utf-8?Q?03S3NRnT9Gw5gk+5EtGxbCg=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5456.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?VS9VNDlPb2hHb2VqL09KenpGZ01MM3FlUmM1TkZRa1RkblJET3N2Tmt6U1ZO?=
 =?utf-8?B?VFN4NTI3YjQremQ3UjhaV0s3YTlpQ0tiOXNmSVZ2VEljeUpNenU2a1Z5S3FY?=
 =?utf-8?B?cEQ5dEhSZ240d3Z3OGxQMnZUdnFrTGMwSVpNcGZXdjNEMUYzZnozSXAwdlZk?=
 =?utf-8?B?Q1laSlBQMGdOWWVCUGZZM0xJemQyY0NwcFVFSlRuMmxKTlpwbTVIUms1U1BB?=
 =?utf-8?B?d3N6UVVxbzREcVpJVGIvb09ualB3WHRLTmpNVDJ4WWErVlp4YWNqQ0Zhei81?=
 =?utf-8?B?VGEzRWp1Q1RQZitQSmpXNVZEcEFpNGJlbXlzOHVYN1lnQlBlY2VkSlBKeldP?=
 =?utf-8?B?YUg5OFFqOWloQldmajlsTXQ3cnVGc25nL0QyM0prWkM4NEl1OFBGSFVwRWNn?=
 =?utf-8?B?c0NBYXBTVmR1ZG5WcVRwYVFNejA0SFJSYTVoaUs2WDJKRWd6b3dHN1E5aEhH?=
 =?utf-8?B?UGxsRjluSGl6dndOM2VYZkV3T1dFSnpaa29tUWx4WUdzSDZ4b3lEY1ExV2lM?=
 =?utf-8?B?QkYySXBlRHdManJmTE1VQW5udTNxNXBuL09MVUwyMmdJeEpaUjZsVHVTNDMw?=
 =?utf-8?B?aW51NG5iendzNjI4VUdvNUdaTGhiWjdja09qbytJWC9LQTRBTU1tNEs1c3NN?=
 =?utf-8?B?S2FRZFdwWTl5SVZESklVUEhaMEVJYTdPVGVkbUJvMVB4ZDlhSmU0Z3JrRXNk?=
 =?utf-8?B?WVc4bFdTVG16QTEvbFNLYlhaQno1Y2xrcnh2Snh5Q0U0Ti9kSDR2dTNIbS9Q?=
 =?utf-8?B?cE14UXk1RTNRRzRGcjZNQXVUQUZCUU9jem9YSnVJOFlKSVBjaCtVb29XclhD?=
 =?utf-8?B?eXBWQzJ2azJkTHBCRWZuLzZjb2o0bjBQSDMySCsxOE1wUmQvSjk0NEFYZjFZ?=
 =?utf-8?B?MWxjZWdWVkRQSGtKVGJmdmpmeHpQaDV3VnNRZm44MTBjYzlEZklXWlIvT0lu?=
 =?utf-8?B?QTloeExVbkxnTjVDdE1CVlVzUW4zcG5jZFZGbUlCcDdpM09INXFicEU3R0p3?=
 =?utf-8?B?Rld6bW13YjYwa3hTUXpSWkRMd0YrTGh1TUNINVRGbTVlZVd0MHlFbm90U0VW?=
 =?utf-8?B?ZGE3Q2ErRDhuN1FoSjc2eHdKcXdMUUI4ZVp6dFZyNGprMmE2YW5VdS9HbW1K?=
 =?utf-8?B?UCtybXE1ejdUV1QrTVA0TG1TS0wxdnFZWGlvQXd5am1tcVZmVXY4bDhaUmVT?=
 =?utf-8?B?TWpOd1grTUphNXpYRGZkNU5tblRvdzh2aEZlV0NFVmpjcHNJc1NOMjdyZk94?=
 =?utf-8?B?UkVFRTBORE9iTm9obVNqb2JQTjZuKzJoQzFxNkxtaFNoUHNyU3A1VitaRlNo?=
 =?utf-8?B?YkR3NmZWTUhYY1FScnVLd0JsbCt4U1ptL1p4OHVTeHk2K3RvTXdZanNaVno3?=
 =?utf-8?B?S05zclNGeHNyRzZuVS9iRTd3dG5nTlhUOS9zUCthdC9UczltYTNXaDd4cVdo?=
 =?utf-8?B?QldCeWRmR2lHMmNITDBDaEw0cTFJYWYvRTV6TW1KMEUxSHZvNEZLc2pFTkc1?=
 =?utf-8?B?eEc2ZThWV0NJTlR2dVNVc2dyeGQ1RnNITmtFRFEyTWdDZi9TeGNVaHM1bkFa?=
 =?utf-8?B?K2d3Tm9CVUYyK2NKZ3dGcjNkdzBnOVEwZ3Z6bU1GNG50MmtGVjdPeHh0eUJB?=
 =?utf-8?B?aGdhY1VuVytNeXZqdDNVL3Y2Q3hpa1liR2pvYTd2MzFhUDhONFdOUUIxc25V?=
 =?utf-8?B?NDBNTFZ1ek9wN2swUHR3YTMxRHl3SHU3VnBZTFc5cjgyR0U3VGpVRXREZnpw?=
 =?utf-8?B?a3JGV21hYU5SRlNKYTRyNXVrYi83WElPQmNaKzRtUU1wRXFwSkJQZC9PaW4r?=
 =?utf-8?B?RlNTbmR2SjVzdmVYWVRNcjlXNGVFM1oxZnAxS3pMZWV4bGI1MDhzd2dPVDlM?=
 =?utf-8?B?SlA3TXFaUjBFeUdWYmQvZ1ZRelZXVXRWN1piQmx0eW1IblFyOXdBR1NVWEF5?=
 =?utf-8?B?Rk1QRGllWkhicUU3QjhyTG92MkU3S0Vpa0czV3U1SUJGbmZ6NzAvdjg5dkN1?=
 =?utf-8?B?MlFnd1V2UzRMN1RNZTk5K09yM1cxUlg1MjQ3cnNMcjlDZ3dHWitYeDRGelIz?=
 =?utf-8?B?SUg0dXZtYy9uN25iUnRjeXZBQ3BlcTkzVEJrQmpkK0IzR0pzTDB2Wi84dFVF?=
 =?utf-8?B?TWs4bXRxVDU0NWlqbDd3aFl0bjNhNjlBWVZzM0RyWmp0bFpCdVg3WUtGVGg1?=
 =?utf-8?B?OTNIU1QvaHBOVnNyTWFjSkN6Mkh3Q2RuSWc0VGdjdmdyRDhQb2dSa3Btc05z?=
 =?utf-8?B?VTlhNUJMeGVlSklYTTVzK0pqU2dLY0RRcWU0R0c0a2hWa0ZJQlMxdjQ2Tm03?=
 =?utf-8?B?MWZmK2lhaFpBOWtWa1VvRVBBZmdsVHBvSlhSdzArS3Zzdit4VHp3dz09?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5456.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 164024f2-8756-4e3c-f66d-08de73266140
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Feb 2026 21:56:21.0337 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VXXQhj68i23wcLcsNG33YPeci4vEoja4MceFbONre/YOx2MaTIox24GxO/pUwn/ccD4FA79ou95aMxWmzcqzjg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4936
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

T24gRnJpLCBGZWIgMjAsIDIwMjYgOToyOCBBTSBNYXR0IFJvcGVyIHdyb3RlOg0KPiBXYV8xNDAx
OTk4ODkwNiBhcHBsaWVzIHRvIGFsbCBncmFwaGljcyB2ZXJzaW9ucyBmcm9tIDIwLjAxIHRocm91
Z2ggMjAuMDQNCj4gKGluY2x1c2l2ZSkuICBDb25zb2xpZGF0ZSB0aGUgUlRQIGVudHJpZXMgaW50
byBhIHNpbmdsZSByYW5nZS1iYXNlZCBlbnRyeS4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IE1hdHQg
Um9wZXIgPG1hdHRoZXcuZC5yb3BlckBpbnRlbC5jb20+DQoNCkxHVE0uDQpSZXZpZXdlZC1ieTog
U2h1aWNoZW5nIExpbiA8c2h1aWNoZW5nLmxpbkBpbnRlbC5jb20+DQoNCj4gLS0tDQo+ICBkcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYyB8IDEyICsrKystLS0tLS0tLQ0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDQgaW5zZXJ0aW9ucygrKSwgOCBkZWxldGlvbnMoLSkNCj4gDQo+IGRpZmYgLS1naXQgYS9k
cml2ZXJzL2dwdS9kcm0veGUveGVfd2EuYyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV93YS5jIGlu
ZGV4DQo+IDAzYmVmMTEzNzBhZTU4OWQxMDM1Y2YyY2I3YjAyMmZkMTczZDM3YjUuLjBhMGY5NGVm
NWM2OGMyZTU4M2YyOGENCj4gYjQ4ZWI0Zjk2YjI4OTZiNjY1IDEwMDY0NA0KPiAtLS0gYS9kcml2
ZXJzL2dwdS9kcm0veGUveGVfd2EuYw0KPiArKysgYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfd2Eu
Yw0KPiBAQCAtNjQ1LDYgKzY0NSwxMCBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IHhlX3J0cF9lbnRy
eV9zciBscmNfd2FzW10gPSB7DQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJQ1NfVkVSU0lPTl9S
QU5HRSgyMDAxLCAyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKFZGX1NDUkFUQ0hQQUQsDQo+IFhFMl9WRkdfVEVEX0NSRURJVF9JTlRFUkZB
Q0VfRElTQUJMRSkpDQo+ICAJfSwNCj4gKwl7IFhFX1JUUF9OQU1FKCIxNDAxOTk4ODkwNiIpLA0K
PiArCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT05fUkFOR0UoMjAwMSwgMjAwNCksDQo+
IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gKwkgIFhFX1JUUF9BQ1RJT05TKFNFVChYRUhQX1BT
U19DSElDS0VOLCBGTFNIX0lHTk9SRVNfUFNEKSkNCj4gKwl9LA0KPiANCj4gIAkvKiBERzEgKi8N
Cj4gDQo+IEBAIC03MDEsMTAgKzcwNSw2IEBAIHN0YXRpYyBjb25zdCBzdHJ1Y3QgeGVfcnRwX2Vu
dHJ5X3NyIGxyY193YXNbXSA9IHsNCj4gDQo+ICAJLyogWGUyX0xQRyAqLw0KPiANCj4gLQl7IFhF
X1JUUF9OQU1FKCIxNDAxOTk4ODkwNiIpLA0KPiAtCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZF
UlNJT04oMjAwNCksDQo+IEVOR0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gLQkgIFhFX1JUUF9BQ1RJ
T05TKFNFVChYRUhQX1BTU19DSElDS0VOLCBGTFNIX0lHTk9SRVNfUFNEKSkNCj4gLQl9LA0KPiAg
CXsgWEVfUlRQX05BTUUoIjE4MDMzODUyOTg5IiksDQo+ICAJICBYRV9SVFBfUlVMRVMoR1JBUEhJ
Q1NfVkVSU0lPTigyMDA0KSwNCj4gRU5HSU5FX0NMQVNTKFJFTkRFUikpLA0KPiAgCSAgWEVfUlRQ
X0FDVElPTlMoU0VUKENPTU1PTl9TTElDRV9DSElDS0VOMSwNCj4gRElTQUJMRV9CT1RUT01fQ0xJ
UF9SRUNUQU5HTEVfVEVTVCkpDQo+IEBAIC03NDIsMTAgKzc0Miw2IEBAIHN0YXRpYyBjb25zdCBz
dHJ1Y3QgeGVfcnRwX2VudHJ5X3NyIGxyY193YXNbXSA9IHsNCj4gIAkgIFhFX1JUUF9SVUxFUyhH
UkFQSElDU19WRVJTSU9OKDIwMDEpLA0KPiBFTkdJTkVfQ0xBU1MoUkVOREVSKSksDQo+ICAJICBY
RV9SVFBfQUNUSU9OUyhTRVQoV01fQ0hJQ0tFTjMsDQo+IEhJWl9QTEFORV9DT01QUkVTU0lPTl9E
SVMpKQ0KPiAgCX0sDQo+IC0JeyBYRV9SVFBfTkFNRSgiMTQwMTk5ODg5MDYiKSwNCj4gLQkgIFhF
X1JUUF9SVUxFUyhHUkFQSElDU19WRVJTSU9OX1JBTkdFKDIwMDEsIDIwMDIpLA0KPiBFTkdJTkVf
Q0xBU1MoUkVOREVSKSksDQo+IC0JICBYRV9SVFBfQUNUSU9OUyhTRVQoWEVIUF9QU1NfQ0hJQ0tF
TiwgRkxTSF9JR05PUkVTX1BTRCkpDQo+IC0JfSwNCj4gIAl7IFhFX1JUUF9OQU1FKCIxNDAyMTQ5
MDA1MiIpLA0KPiAgCSAgWEVfUlRQX1JVTEVTKEdSQVBISUNTX1ZFUlNJT04oMjAwMSksDQo+IEVO
R0lORV9DTEFTUyhSRU5ERVIpKSwNCj4gIAkgIFhFX1JUUF9BQ1RJT05TKFNFVChGRl9NT0RFLA0K
PiANCj4gLS0NCj4gMi41My4wDQoNCg==
