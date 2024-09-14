Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F097DFC6185
	for <intel-xe@archiver.kernel.org>; Sat, 14 Sep 2024 00:02:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D0CB10E275;
	Sat, 14 Sep 2024 00:02:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="HUIRfxN/";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 35C5910E275
 for <intel-xe@lists.freedesktop.org>; Sat, 14 Sep 2024 00:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1726272130; x=1757808130;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=yFdmvfxa9J2l6e2sXlzlILJJZufoN1US+b3V8rIDKhQ=;
 b=HUIRfxN/Eo0VM5mbQVOozjYH+JVcvUUQ/tPLHWK/nltPcNJ0lWAPStsr
 9BUHrbXL0nedWKnSS8vshjkznBXeFe4c6jV6e3M1oPSUYE7fqLBrKU4Sc
 +pnaZJTiUzLnEdc9xWz4ba3W4Ubv8o8upgXtuBQX1/iKlYDba2PbCb2zM
 Wc9hD1atI8Z5igVkH3xoeE6kq5Ldwb9I9UPaQ4rXKa7e2DPL75+xVMAGc
 XB/oju4bFAeGjHqTah0eBFLNxtEXHSxjTSZ1Kdju2ZlAMdRZRA0TlN1yp
 jDNqPNDuMALfFhDMK41U0llPZTX0Nfzn1Sy1DUROVUcnZzYABjXC7v4SD A==;
X-CSE-ConnectionGUID: 8/EyBJIcSoWwdSgS6lod7g==
X-CSE-MsgGUID: fupEZVfuTXejVc5UppEglA==
X-IronPort-AV: E=McAfee;i="6700,10204,11194"; a="25061414"
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="25061414"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 13 Sep 2024 17:02:09 -0700
X-CSE-ConnectionGUID: VxpX7tR7QTCGxsYEylxPSQ==
X-CSE-MsgGUID: PdzD+3vKQM+LUk/cBMn/DA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.10,227,1719903600"; d="scan'208";a="68480239"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmviesa010.fm.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 13 Sep 2024 17:02:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 17:02:08 -0700
Received: from orsmsx610.amr.corp.intel.com (10.22.229.23) by
 ORSMSX610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Fri, 13 Sep 2024 17:02:08 -0700
Received: from orsedg603.ED.cps.intel.com (10.7.248.4) by
 orsmsx610.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39 via Frontend Transport; Fri, 13 Sep 2024 17:02:08 -0700
Received: from NAM10-DM6-obe.outbound.protection.outlook.com (104.47.58.100)
 by edgegateway.intel.com (134.134.137.100) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.39; Fri, 13 Sep 2024 17:02:04 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=svAefeKnnAjyNWhoaCQNucmL/AdU9iI2ypfcUox3olF+Ho8hN9J1V1s5g8XDr4jupkNh2fZZTCUicsf0P8Bt4aPa1yr/X6zkqQkziD1cgzE7g75dnJKCnaCQDg+RJSi9L2cdQat864YaxJAT4bM3YvdXDNrbr9LnnykN/7eET+8g7pb3UQh+FJ90Q5+IJiuo5mh+brdoNIiPJvrqPYHH3ghTGCdO/EtVDMzZNwJfF8B6Rt732Guu0Aiq6t94SxZC6TO6ZmaAc3Jtq9r2X+x8JiR+i5O2KG3gIiZ4AESMfBeHqJkh+NCED9zcOy3SJbiaggusj1mhQWYglGQStBWkYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2ahcpCcw04Q9e/sQSCRT5fGv02+goqXp5UCVP9c+xXk=;
 b=gvIrPYhQ8KjesaS8GAFD7e+wuevcQ/NAfKheRmtKTh9SzYUPW7d5rfS4F/yZWz+A3OKfSifBipN1y5QCl4lyQLccQM7WYmsHp79iNq0U2F1MzDSBFvVp+l+2ktItJqloZYwVBhsdOxPZXuxY4I28vqPLroI1voGudCpVA1+zdOW3WAhEmE5tZ8/askTodQGcKVO4N3hIk4YzaZxDPu6r4EDK3EhAKKw6aM9lCBoF11Nu0IZ2IAp6/oRU1NEEUBrbJBnOUmPvsguH32Ozarh+oHx7EvB0EK/2xrRsOL9CSf+Gx1X2TRAfEdxPeMxkF2t3LBT0Mm/RS9id+wq/TsijqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by MN6PR11MB8103.namprd11.prod.outlook.com (2603:10b6:208:473::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.19; Sat, 14 Sep
 2024 00:02:01 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%7]) with mapi id 15.20.7962.017; Sat, 14 Sep 2024
 00:02:01 +0000
Date: Fri, 13 Sep 2024 19:01:56 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 <thomas.hellstrom@linux.intel.com>
Subject: Re: [PATCH v13 4/4] drm/xe/vsec: Support BMG devices
Message-ID: <d6baown7x4de6ysyjkwp6dacwcknqmfcasp63hszhhehp7hqrm@2eg7q6gng3zu>
References: <20240912184210.914612-1-michael.j.ruhl@intel.com>
 <20240912184210.914612-5-michael.j.ruhl@intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240912184210.914612-5-michael.j.ruhl@intel.com>
X-ClientProxiedBy: MW4PR04CA0137.namprd04.prod.outlook.com
 (2603:10b6:303:84::22) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|MN6PR11MB8103:EE_
X-MS-Office365-Filtering-Correlation-Id: 6375d745-16a9-49dc-12d1-08dcd450755d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dXhJcVE0NnFJUmh5aXQySFQ2d3lXKzh6QW1mdXFBMUFzL2lvaTZETklUSmYr?=
 =?utf-8?B?K21OZytnRklDYkY2ejhqMFVnNExBRUxldjVXQzI1eVlkT3l4VHJHTXR6eGFI?=
 =?utf-8?B?MW5sS1pmMmZJNk13S0liM2hjd2VENW5DR0NFbXZaa0hwOWxSUFRuVmxUbGZF?=
 =?utf-8?B?dUdEN2tHS2NpRmM2SkwvcUJpdWJFODBKeHBBemNLS21JazNNdWs3dWN0VG1y?=
 =?utf-8?B?bVJxUXAycXB3Ynl0anYxcS96T1lFcGhpQ1crQUpRVEk1NmxDTUF0cFQ5SnZj?=
 =?utf-8?B?TGxwc29HSDNyUzhFZzBoSXZKT1B5VU1lV1NYaFFBNVBvd3pLaE5WSXdpM3FJ?=
 =?utf-8?B?MGFUSm5QQ1VBVm1RRTNYeUE2VEY3VUJhOHh1dEx4STNjZ0xicnNUZHBHM0pi?=
 =?utf-8?B?K1RYaXRvNXVQcUxrTTdCa1IzMXVINTRoNExmZGJoMmkxU1R0YUZ4YVJBbGlX?=
 =?utf-8?B?TWpJTk50ZXFCejNCKzlTVHkyY0h3UU5oMmt4aW40RGRYQzdzNGlGRmgwMUxY?=
 =?utf-8?B?NWp6TkxBa2dxWVFBNVRoVStQd3JkNVZ5Q1cydFVHWEFkd0d5NytqNXFmNHlr?=
 =?utf-8?B?bkpUT2x3N05sTUg4S3htM0RSTGJVUVlXSjR2eDRvRjZQa0h3WUVnNFZxYkZy?=
 =?utf-8?B?c2VXampVS0pTTFFJUHJ2bUV6RlZxMElGcXIzQVdUUHRGa2p5cHpiQjRyc1RO?=
 =?utf-8?B?dXUxV2txYlhVZ1RZbmovdGZOSWsyWU9pdzdIb1dWYWc5emlHNWtBSU9DRlZQ?=
 =?utf-8?B?ckp2cDNpOXhiL0ZzL2Z1V09FVlo4K2Z4NzNkcnVUR2ZGU1cyU3F5Z0FBdnZD?=
 =?utf-8?B?d2RLbFJSQUpoaXhaWGRDMG1zT2tBRWoyYkk1emcvVXBXcFFtZjZ3YXpZOW4z?=
 =?utf-8?B?d1VRL0J5QUM2MG1FWm85OEhOM1RNeXJHTmgwVnAvcmV1NDRkWTl3Y2EwcTZw?=
 =?utf-8?B?NXJ5a3NvSHd0UGN2eGx1QVF2LzVQejlKdlB4TTk5WDlUMW5nZlA5WFl0TEdE?=
 =?utf-8?B?a0ZYS3AxWGlJbHBtZ04zUWU2U0xtdExiYmpzQ0ZhbjQxZVRQMTMvM0dSS2JW?=
 =?utf-8?B?anlqaWhQd1ZNdndtSW0wMGszYTZ3UzFIdTI4enhxT05FeVdOR2pKWkRDWktl?=
 =?utf-8?B?cDVuV3IzMGRnSEFHb1RUdTZ3R3FPK0VXaytKRThSTEs2SmFkQ1RrME1KVjE0?=
 =?utf-8?B?NHZmWWs0V3A3eno4d1QwL0tHYXNCSmdicWVEZlR0M0g0b1pTUDBvaFpXMG96?=
 =?utf-8?B?aFhNRGZOaWNqOFZ6MUl6aWNQaWNLNXdPNGQ4aEcxUkNZWUY4OHZ5MFpoMGtD?=
 =?utf-8?B?MFo4OVZtOVlsZ00zc09xSkpIZ08rY1hORGwzYVByYWJzeHhUbHlCZ014SnV4?=
 =?utf-8?B?RFcvazJoRks3UllGRjVRM0ZuaDBCNU1pb0NPWXFJM0VnL1gzS3RzbGUzQ2J5?=
 =?utf-8?B?RGp5bnk0NmZMSGFyYXR3WnFhbTQwUWFKUmRBbDF2NUNLOWYvbUVZVU9oc0FG?=
 =?utf-8?B?cHBSUGFuVXlmWmZNc0U4c3ZtSkdNTk9RczV4b01JMFFiM1JNVlZpVlRNckpX?=
 =?utf-8?B?YmhxN3p4dDVnR0dCbXdzVStmK0kybEJERVdRbmJSMkpxak9lUjNwNVNiVCt5?=
 =?utf-8?B?dGRLVS9pbmRRR2s3eUt5QmF4T1p6Y2hYSVRUOVd4bTdxRllpc21kRG5IUTA0?=
 =?utf-8?B?Uk1QSlFiaW42NnV1OHpKMCtPZzFtVkhLdWpYd1hQNWVhdFZnMzhTWks3K2xS?=
 =?utf-8?B?RFMzdGFGOTVsbE4ycWExQk5mQ1M1QlpaOVI2N1hlckRtU3dnb3JQTW1zTFlD?=
 =?utf-8?B?cUF3Y3Z6YVNVR0VqNnZSQT09?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?akwxb3pLY1R3Z21nR3JESlBxTTlWTC9YenVpRDJYWGtkVXhMeFVzdXhGeW45?=
 =?utf-8?B?a0Y4Zlk3aGRPeUZERmw2VEg2M0Z6cUJLRTBKYXV4bExZeGxxUEVZZUZQMU8r?=
 =?utf-8?B?SmtwTkRWNnZSWTNNbTZncEFVbTNSTVRxckJnWmcwdXU3WExvaFBLWjJKOTQ2?=
 =?utf-8?B?emdoWGRBaEJLdGlDMk9BUEdQeVpQeDlhdkJJL010Qzg2RWhFQmJ5bFRnakNz?=
 =?utf-8?B?cU9MQ1FsOGRrUWIxbUVVZm9ZazVrTkJBSjJnK0psdE9QVHI2MmdEbUc0ZDFG?=
 =?utf-8?B?OFJzSzVMTVc4R3dpbFZnYXNjOHF5Nm5QaDVpRm5QWjhBYzRjYXVPTUZTYWg3?=
 =?utf-8?B?bmtRMmFnYVJPaHQwQ3ZGeFczN25EazAyL3ZmNWlaSVhnRXJzdFA0MCtnUVVu?=
 =?utf-8?B?alFDUlpaV25OaFhsd1dZN3V3c2REMWd1WTJhLzRpUG5hN1FIMDVuME9INlpP?=
 =?utf-8?B?K1JWQnNUZWIrL01qdlhzS05HTlpDVU0xRVpKUXBpZnRaNE9DRXMyUDVndzYz?=
 =?utf-8?B?WjErbGhTZ205MTdYS29wRTZsT2t1aVVBMHcrQXVOMFV5aFVNWDlranVOME5y?=
 =?utf-8?B?UW1ROWl2bE5NcDRJaE14M3RaNElGMmtaL2RYU2loSHZqYU4zYzI5RWFzVjlr?=
 =?utf-8?B?WTNUZTMraWRXakc3SFdUZWdLdTJEL0hnbnhsYkpqYnRJN1VtRmlaNm5mNWlO?=
 =?utf-8?B?RXhjUXdwOWVJMmVhUVl3Q2pKRXFCMjRUTHB1b29TRlhVQkx1R3g4OEd5VkZ1?=
 =?utf-8?B?TTRoYUQ3cGZTUUo4ZWVHYklVMHlzMEEyaWNmVFBubWNHVVpnd3pkWnNtTWMw?=
 =?utf-8?B?TGFNSWJZOGttL09tazFleGNHeEJPVXh4dlk0WDMwanMxbGNHVGxzYmFCdDMr?=
 =?utf-8?B?a2QrY0xkVnZGam5nRk1qU2dnbUhPR0lFWCtVT1QyUDhXdmlOWER4dU96U0h4?=
 =?utf-8?B?eEdHQnBDVy9PUDNwSzhMZVNiSm9UbkZpRTAreGozMGZPYzZGTTdBS2dRRUZB?=
 =?utf-8?B?c05rMFhsemRtZnY0NTRYWU85V0RzYnVPLzNYWTM0d01UekZkak9ZbXNvdFZx?=
 =?utf-8?B?RnhIQXo0QWY0cER4UEVQTk02U2RjQU1iQzJ0eGFTdGNSZUtvTEh2N0dlNFk0?=
 =?utf-8?B?K1NOSm83UjM3emNTcnFiMEMxL0E2YW1EbjhnVkNmQkI5bTNUZCtmMTBMOTJo?=
 =?utf-8?B?K28yMjk3b3hiS3RrS2FYR2luQ2pKazlQU0lOSjFjbU02RFBCcWptckJndmt4?=
 =?utf-8?B?MHNDYnlaT0UvNHpFZ1VERGM5NnBYY2tRZVNQZ0h2NTJPNDBTcEp3YWp2VEV5?=
 =?utf-8?B?V0t4ajh6bldlNXR1c2g1azlJUG9WMWVKSDI2ZGVDb1dzRlRkM2xQbjVuVHY2?=
 =?utf-8?B?aXZzc0tBQ0x4WHhGSUs1T0g4VmpYRlliMlBXUGxiZmQ1SldQSUlhTGhOb3FN?=
 =?utf-8?B?NUhLdWJpQWtCWndNb05WS2V3cFczZkZiV0UwbncwMjJQR29wYzRYdENVU3ND?=
 =?utf-8?B?em14eXU0N1kvMlVRLzh5RjZsV3JkNnRuV3JhUTYzOFFCbTB6VWlZTWcwQXUy?=
 =?utf-8?B?Z0lnV05CeUhoVVBHdVdLUXAvWTlLYkhsZUlwVk1OcTZrUFpjM0ZyOUduTkM3?=
 =?utf-8?B?Z3RoYkRoT29neGlsbFB1TDdOcE5TUlpOK2xyMDJMQVNtQXRpMTAyam0rM0NK?=
 =?utf-8?B?Z2VzNHFkMFlBajZCZ0wzWGhQQUh0SlVPOTVyOElqVHZscHJQR0lSK3NRck56?=
 =?utf-8?B?T3hocnYwVS81eUU1NTkyL2QyUStFVS9YRTJ0cUpQSDczQkEzMTUraWFYMWVj?=
 =?utf-8?B?Q1h2T2ZpekpZZGNHRFRQbEJWcjBHVy9XVzhvWklFUzA1MUsxejBxUGFmTGlt?=
 =?utf-8?B?T2NXdGoxclQxZW1ZZGE1aDAzQklqRUdIUDR1K0RNdlZYSlFXMlkyQURHejhW?=
 =?utf-8?B?ZG5EZzlRdWNndlFwSFZYRXdPUGE0SE4vWmsrMzd0YS8zUzB3aEhBNFEvb0Rs?=
 =?utf-8?B?S1N5TUtVNHNGUTJUUEUwRW9hMHplTUZJR3YvcWZLdzVTdllwSU1ZRzVnRjMr?=
 =?utf-8?B?YjFGQm51WkI1S252aVh5MUZLdXVvQUlKMXlpcFM1bE9ycEQ1ZkR5cW0wSmYr?=
 =?utf-8?B?RGtjc1gwcElKQklVVGV3Q1lUeit2TEljazVPK0VhMmhRdHFJRUNBaWMxcHR5?=
 =?utf-8?B?d3c9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 6375d745-16a9-49dc-12d1-08dcd450755d
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 00:02:01.3375 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fPyqkdpMbsW4MyxrsS8Xz34Zdeo4wFpSegz4q7Xz8j5N2ZTfDLWMdHcdTonLMRqOFwa7snVQ7I8ENU1pRmfGYyyzAr6NB8s3uCVAhv99Vjs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR11MB8103
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

I was looking at some possible way to split this so we could have it
for 6.12, but I don't see a way. Even if this was 1 or 2 weeks ago, it'd
be hard since the first 3 patches are going through the tree.

So... I think this will have to wait 6.12 to be backmerged in
drm-xe-next. Cc'ing Rodrigo and Thomas to know if they see it
differently.

Some additional review below.

On Thu, Sep 12, 2024 at 02:42:09PM GMT, Michael J. Ruhl wrote:
>The Battlemage (BMG) discrete graphics card supports
>the Platform, Monitoring Technology (PMT) feature
>directly on the primary PCI device.
>
>Utilize the PMT callback API to add support for the BMG
>devices.
>
>Reviewed-by: Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>Reviewed-by: Rodrigo Vivi <rodrigo.vivi@intel.com>
>Signed-off-by: Michael J. Ruhl <michael.j.ruhl@intel.com>
>---
> drivers/gpu/drm/xe/Makefile          |   1 +
> drivers/gpu/drm/xe/xe_device.c       |   5 +
> drivers/gpu/drm/xe/xe_device_types.h |   6 +
> drivers/gpu/drm/xe/xe_vsec.c         | 223 +++++++++++++++++++++++++++
> drivers/gpu/drm/xe/xe_vsec.h         |  13 ++
> 5 files changed, 248 insertions(+)
> create mode 100644 drivers/gpu/drm/xe/xe_vsec.c
> create mode 100644 drivers/gpu/drm/xe/xe_vsec.h
>
>diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>index edfd812e0f41..ce4da2b30db3 100644
>--- a/drivers/gpu/drm/xe/Makefile
>+++ b/drivers/gpu/drm/xe/Makefile
>@@ -109,6 +109,7 @@ xe-y += xe_bb.o \
> 	xe_vm.o \
> 	xe_vram.o \
> 	xe_vram_freq.o \
>+	xe_vsec.o \
> 	xe_wait_user_fence.o \
> 	xe_wa.o \
> 	xe_wopcm.o
>diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/xe_device.c
>index 4d3c794f134c..c3edb0f36d05 100644
>--- a/drivers/gpu/drm/xe/xe_device.c
>+++ b/drivers/gpu/drm/xe/xe_device.c
>@@ -54,6 +54,7 @@
> #include "xe_ttm_sys_mgr.h"
> #include "xe_vm.h"
> #include "xe_vram.h"
>+#include "xe_vsec.h"
> #include "xe_wait_user_fence.h"
> #include "xe_wa.h"
>
>@@ -373,6 +374,8 @@ struct xe_device *xe_device_create(struct pci_dev *pdev,
> 		goto err;
> 	}
>
>+	drmm_mutex_init(&xe->drm, &xe->pmt.lock);
>+
> 	err = xe_display_create(xe);
> 	if (WARN_ON(err))
> 		goto err;
>@@ -759,6 +762,8 @@ int xe_device_probe(struct xe_device *xe)
> 	for_each_gt(gt, xe, id)
> 		xe_gt_sanitize_freq(gt);
>
>+	xe_vsec_init(xe);
>+
> 	return devm_add_action_or_reset(xe->drm.dev, xe_device_sanitize, xe);
>
> err_fini_display:
>diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>index c92df0a2423f..cf37af207210 100644
>--- a/drivers/gpu/drm/xe/xe_device_types.h
>+++ b/drivers/gpu/drm/xe/xe_device_types.h
>@@ -487,6 +487,12 @@ struct xe_device {
> 		struct mutex lock;
> 	} d3cold;
>
>+	/** @pmt: Support the PMT driver callback interface */
>+	struct {
>+		/** @pmt.lock: protect access for telemetry data */
>+		struct mutex lock;
>+	} pmt;
>+
> 	/**
> 	 * @pm_callback_task: Track the active task that is running in either
> 	 * the runtime_suspend or runtime_resume callbacks.
>diff --git a/drivers/gpu/drm/xe/xe_vsec.c b/drivers/gpu/drm/xe/xe_vsec.c
>new file mode 100644
>index 000000000000..1d82ef980b80
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_vsec.c
>@@ -0,0 +1,223 @@
>+// SPDX-License-Identifier: GPL-2.0
>+/*
>+ * Copyright © 2022 - 2024 Intel Corporation

just 2024 should be fine.

>+ */
>+#include <linux/bitfield.h>
>+#include <linux/bits.h>
>+#include <linux/cleanup.h>
>+#include <linux/intel_vsec.h>
>+#include <linux/module.h>
>+#include <linux/mutex.h>
>+#include <linux/pci.h>
>+
>+#include "xe_device.h"
>+#include "xe_device_types.h"
>+#include "xe_drv.h"
>+#include "xe_mmio.h"
>+#include "xe_platform_types.h"
>+#include "xe_pm.h"
>+#include "xe_vsec.h"
>+
>+#define SOC_BASE		0x280000
>+
>+#define BMG_PMT_BASE_OFFSET	0xDB000
>+#define BMG_DISCOVERY_OFFSET	(SOC_BASE + BMG_PMT_BASE_OFFSET)
>+
>+#define BMG_TELEMETRY_BASE_OFFSET	0xE0000
>+#define BMG_TELEMETRY_OFFSET		(SOC_BASE + BMG_TELEMETRY_BASE_OFFSET)
>+
>+#define BMG_DEVICE_ID 0xE2F8
>+
>+#define SG_REMAP_INDEX1		XE_REG(SOC_BASE + 0x08)
>+#define SG_REMAP_BITS		GENMASK(31, 24)

we should probably move these to regs/xe_soc.h or regs/xe_vsec.h or
regs/xe_pmt.h. Then please follow the same format with added spaces for
the bit definition.

I don't like the defines here since it's hidden and it's often accessing
the register in a weird way.


>+
>+static struct intel_vsec_header bmg_telemetry = {

we prefer prefixes with the IP rather than the platform. Is it possible
here?

>+	.length = 0x10,
>+	.id = VSEC_ID_TELEMETRY,
>+	.num_entries = 2,
>+	.entry_size = 4,
>+	.tbir = 0,
>+	.offset = BMG_DISCOVERY_OFFSET,
>+};
>+
>+static struct intel_vsec_header *bmg_capabilities[] = {
>+	&bmg_telemetry,
>+	NULL
>+};
>+
>+enum xe_vsec {
>+	XE_VSEC_UNKNOWN = 0,
>+	XE_VSEC_BMG,
>+};
>+
>+static struct intel_vsec_platform_info xe_vsec_info[] = {
>+	[XE_VSEC_BMG] = {
>+		.caps = VSEC_CAP_TELEMETRY,
>+		.headers = bmg_capabilities,
>+	},
>+	{ }
>+};
>+
>+/*
>+ * The GUID will have the following bits to decode:
>+ *
>+ * X(4bits) - {Telemetry space iteration number (0,1,..)}

what's the meaning of the X here and in the lines below?
Maybe just document line by line below

>+ * X(4bits) - Segment (SEGMENT_INDEPENDENT-0, Client-1, Server-2)
>+ * X(4bits) - SOC_SKU
>+ * XXXX(16bits)– Device ID – changes for each down bin SKU’s
>+ * X(2bits) - Capability Type (Crashlog-0, Telemetry Aggregator-1, Watcher-2)
>+ * X(2bits) - Record-ID (0-PUNIT, 1-OOBMSM_0, 2-OOBMSM_1)
>+ */
>+#define GUID_TELEM_ITERATION	GENMASK(3, 0)
>+#define GUID_SEGMENT		GENMASK(7, 4)
>+#define GUID_SOC_SKU		GENMASK(11, 8)
>+#define GUID_DEVICE_ID		GENMASK(27, 12)
>+#define GUID_CAP_TYPE		GENMASK(29, 28)
>+#define GUID_RECORD_ID		GENMASK(31, 30)
>+
>+#define PUNIT_TELEMETRY_OFFSET		0x0200
>+#define PUNIT_WATCHER_OFFSET		0x14A0
>+#define OOBMSM_0_WATCHER_OFFSET		0x18D8
>+#define OOBMSM_1_TELEMETRY_OFFSET	0x1000
>+
>+enum record_id {
>+	PUNIT,
>+	OOBMSM_0,
>+	OOBMSM_1,
>+};
>+
>+enum capability {
>+	CRASHLOG,
>+	TELEMETRY,
>+	WATCHER,
>+};
>+
>+static int guid_decode(u32 guid, int *index, u32 *offset)
>+{
>+	u32 record_id = FIELD_GET(GUID_RECORD_ID, guid);
>+	u32 cap_type  = FIELD_GET(GUID_CAP_TYPE, guid);
>+	u32 device_id = FIELD_GET(GUID_DEVICE_ID, guid);
>+
>+	if (device_id != BMG_DEVICE_ID)
>+		return -ENODEV;
>+
>+	if (cap_type > WATCHER)
>+		return -EINVAL;
>+
>+	*offset = 0;
>+
>+	if (cap_type == CRASHLOG) {
>+		*index = record_id == PUNIT ? 2 : 4;
>+		return 0;
>+	}
>+
>+	switch (record_id) {
>+	case PUNIT:
>+		*index = 0;
>+		if (cap_type == TELEMETRY)
>+			*offset = PUNIT_TELEMETRY_OFFSET;
>+		else
>+			*offset = PUNIT_WATCHER_OFFSET;
>+		break;
>+
>+	case OOBMSM_0:
>+		*index = 1;
>+		if (cap_type == WATCHER)
>+			*offset = OOBMSM_0_WATCHER_OFFSET;
>+		break;
>+
>+	case OOBMSM_1:
>+		*index = 1;
>+		if (cap_type == TELEMETRY)
>+			*offset = OOBMSM_1_TELEMETRY_OFFSET;
>+		break;
>+	default:
>+		return -EINVAL;
>+	}
>+
>+	return 0;
>+}
>+
>+static int xe_pmt_telem_read(struct pci_dev *pdev, u32 guid, u64 *data, u32 count)
>+{
>+	struct xe_device *xe = pdev_to_xe_device(pdev);
>+	void __iomem *telem_addr = xe->mmio.regs + BMG_TELEMETRY_OFFSET;
>+	struct xe_mmio *mmio;
>+	u32 mem_region;
>+	u32 offset;
>+	int ret;
>+
>+	ret = guid_decode(guid, &mem_region, &offset);
>+	if (ret)
>+		return ret;
>+
>+	telem_addr += offset;
>+
>+	guard(mutex)(&xe->pmt.lock);
>+
>+	/* indicate that we are not at an appropriate power level */
>+	if (!xe_pm_runtime_get_if_active(xe))
>+		return -ENODATA;
>+
>+	/* set SoC re-mapper index register based on GUID memory region */
>+	mmio = &xe_device_get_root_tile(xe)->primary_gt->mmio;

this doesn't look right. We recently moved away from using gt as the
target of all mmio operations. This seems more like tile->mmio.
Cc Matt Roper.


>+	xe_mmio_rmw32(mmio, SG_REMAP_INDEX1, SG_REMAP_BITS,
>+		      FIELD_PREP(SG_REMAP_BITS, mem_region));
>+
>+	memcpy_fromio(data, telem_addr, count);
>+	xe_pm_runtime_put(xe);
>+
>+	return count;
>+}
>+
>+struct pmt_callbacks xe_pmt_cb = {
>+	.read_telem = xe_pmt_telem_read,
>+};
>+
>+static const int vsec_platforms[] = {
>+	[XE_BATTLEMAGE] = XE_VSEC_BMG,
>+};
>+
>+static enum xe_vsec get_platform_info(struct xe_device *xe)
>+{
>+	if (xe->info.platform > XE_BATTLEMAGE)
>+		return XE_VSEC_UNKNOWN;
>+
>+	return vsec_platforms[xe->info.platform];
>+}
>+
>+/**
>+ * xe_vsec_init - Initialize resources and add intel_vsec auxiliary
>+ * interface
>+ * @xe: valid xe instance
>+ */
>+void xe_vsec_init(struct xe_device *xe)
>+{
>+	struct intel_vsec_platform_info *info;
>+	struct device *dev = xe->drm.dev;
>+	struct pci_dev *pdev = to_pci_dev(dev);
>+	enum xe_vsec platform;
>+
>+	platform = get_platform_info(xe);
>+	if (platform == XE_VSEC_UNKNOWN)
>+		return;
>+
>+	info = &xe_vsec_info[platform];
>+	if (!info->headers)
>+		return;
>+
>+	switch (platform) {
>+	case XE_VSEC_BMG:
>+		info->priv_data = &xe_pmt_cb;
>+		break;
>+	default:
>+		break;
>+	}
>+
>+	/*
>+	 * Register a VSEC. Cleanup is handled using device managed
>+	 * resources.
>+	 */
>+	intel_vsec_register(pdev, info);
>+}
>+MODULE_IMPORT_NS(INTEL_VSEC);
>diff --git a/drivers/gpu/drm/xe/xe_vsec.h b/drivers/gpu/drm/xe/xe_vsec.h
>new file mode 100644
>index 000000000000..3fd29a21cad6
>--- /dev/null
>+++ b/drivers/gpu/drm/xe/xe_vsec.h
>@@ -0,0 +1,13 @@
>+/* SPDX-License-Identifier: GPL-2.0 */
>+/*
>+ * Copyright © 2022 - 2024 Intel Corporation

just 2024 should be fine.

Lucas DE Marchi

>+ */
>+
>+#ifndef _XE_VSEC_H_
>+#define _XE_VSEC_H_
>+
>+struct xe_device;
>+
>+void xe_vsec_init(struct xe_device *xe);
>+
>+#endif
>-- 
>2.44.0
>
