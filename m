Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010FFCCF9E3
	for <intel-xe@archiver.kernel.org>; Tue, 11 Nov 2025 10:58:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1ACE10E551;
	Tue, 11 Nov 2025 10:58:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="QI9a2/Ts";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A234610E551
 for <intel-xe@lists.freedesktop.org>; Tue, 11 Nov 2025 10:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762858692; x=1794394692;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=F5qn99jWb0WJXqrn4OQG66HvGk5En/UFNUtcLF7zT5M=;
 b=QI9a2/Ts3TKimgRnuXjk6NT1b/IhYpaikCjYgJ94kUp0LH6NNUZqnfiO
 5+jDjCec0/Pm9tMQcFqe8I6lBfjYOkXJdvv3i5bwFqR+8SCXoZ9lkDYyV
 7sDCYFeNJaMEm4n3Y6nnnQD1aUGMgZ4opaWfB+dhjHOht4U0/3Wm56WaG
 BcIASuylDTc/b106mVkwYkCSXeD7jWqfUNFxdide0stu7nMA6h51DoQ5V
 qsNg1Ync3kjgGPBFAHRT6QJWv0oCL0Lrm2/rERdxuXMRCg1lDAiDeRrXG
 LxcysIWHVI2mMhYkgThl8w8buplZc1dZFUdKkT9ZsOysADj2xQcFFnQXX g==;
X-CSE-ConnectionGUID: WXwNpvA6RwCU+Y1ChSbq6A==
X-CSE-MsgGUID: icM2YEo5SjytHDfA8GpEWw==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="64621781"
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="64621781"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
 by orvoesa112.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 02:58:12 -0800
X-CSE-ConnectionGUID: XBrvoQtuRq2fbmXelnynbQ==
X-CSE-MsgGUID: 4UXVibLBRFiemrJ1RGALGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,296,1754982000"; d="scan'208";a="189674700"
Received: from fmsmsx902.amr.corp.intel.com ([10.18.126.91])
 by fmviesa010.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 11 Nov 2025 02:58:12 -0800
Received: from FMSMSX902.amr.corp.intel.com (10.18.126.91) by
 fmsmsx902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 02:58:11 -0800
Received: from fmsedg902.ED.cps.intel.com (10.1.192.144) by
 FMSMSX902.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 11 Nov 2025 02:58:11 -0800
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.50) by
 edgegateway.intel.com (192.55.55.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 11 Nov 2025 02:58:11 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UGRFvOgvOhnJzEC3bZxD5y3kVWFHux7FwPMbfBob3J3gESkaJRHrfWnKAUyNP/5uV7fZYCZx/38Hl5sQJl123UN+L/Jg3ichlGgFEaIkwLdoFRMRKgISf2uT3GrbtkkYTgDwISZQA+6bxy1IezSaoDVfKmuHhJ14Z25146UtCLsS3IxdG0AqmzARehEh1vFW+dZWbkW00TrvqNERvhecTaDH6CBqzVFPbR1/uYUUpbu2bfaB06wOjYa4bv0uKnaz/wwqsGc/x1OCES9ygI8Mz2V3EdUnBlhHd+K+XzaT5sxdbENLbL5w22i7eoDqYzDWylLft52pQkKrhohpePNwsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=F5qn99jWb0WJXqrn4OQG66HvGk5En/UFNUtcLF7zT5M=;
 b=TOBeNVYNm+LGllWVgByEnGKtxx/DPQ6tqjdXcEH86PymcBKdWWV82ZCRKmxRwLqiTV5IRb2oxk/PwmiJEEhDBc79K2RHJ5r3LDQZ7UcZuwMS9UZL+4zH9K+fqvTrcV2aUapkCenKWspah/b/ivyw/PWiaU4Qba9Boh08aapufI/GTtBfNzmGzbW0Np/9XDV3M6F9piBIl80AHsQRSnbNqpnh5rI9MMk9BSf5H88viuokIJaU8FwCtSJHPkpu33jQytAwJySJpuw3RII7xAT4iu9dNCYQH5NybbGAUocxmzx59u9Kq3yHwl4KP4z7epoyOCsv3gKgmLNpipS28pO4zA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from CY5PR11MB6366.namprd11.prod.outlook.com (2603:10b6:930:3a::8)
 by PH3PPFD80FA6330.namprd11.prod.outlook.com (2603:10b6:518:1::d52) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.16; Tue, 11 Nov
 2025 10:58:04 +0000
Received: from CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201]) by CY5PR11MB6366.namprd11.prod.outlook.com
 ([fe80::22af:c9c9:3681:5201%4]) with mapi id 15.20.9320.013; Tue, 11 Nov 2025
 10:58:03 +0000
From: "Usyskin, Alexander" <alexander.usyskin@intel.com>
To: Jani Nikula <jani.nikula@linux.intel.com>, "De Marchi, Lucas"
 <lucas.demarchi@intel.com>
CC: Jani Partanen <jiipee@sotapeli.fi>, "intel-xe@lists.freedesktop.org"
 <intel-xe@lists.freedesktop.org>, "linux-mtd@lists.infradead.org"
 <linux-mtd@lists.infradead.org>
Subject: RE: Possible bug?
Thread-Topic: Possible bug?
Thread-Index: AQHcUkei6Lo1KS3V80GUCdJROfCGsLTr7REAgABI9gCAANZZEIAAE1QAgAAvhzA=
Date: Tue, 11 Nov 2025 10:58:03 +0000
Message-ID: <CY5PR11MB6366FD61EF0FC69D077F80E0EDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
References: <caca6c67-4f1d-49f1-948f-e63b6b937b29@sotapeli.fi>
 <75a84e116f2f1120a02e8ff81ca5343621bd04fc@intel.com>
 <zh45kns66vc62eldccyoefrjtylkqpexns4hli2j7jqpwwhvzn@viqinx2he3il>
 <CY5PR11MB636652A1A7F88249BD81047DEDCFA@CY5PR11MB6366.namprd11.prod.outlook.com>
 <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
In-Reply-To: <98df450751f934f3a5c20ec09a08b72ef8fa2763@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR11MB6366:EE_|PH3PPFD80FA6330:EE_
x-ms-office365-filtering-correlation-id: 42dd2868-aa2f-4116-2c5a-08de21112fd6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|366016|1800799024|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SkNtMDk5dDRDU0dodU5lcXZhMzBKaHZJL3pQTkxmUFVDWEtud0NidGZ0dTdB?=
 =?utf-8?B?ZVpxeDJweCt5M21TbGkwRTNzbnZnSFVLTC9CYnkwdStPeWlvaFhhY2NHWTVz?=
 =?utf-8?B?cm9USURhaHQ4VnRnYUhYVzZpek1VMXJzcjE5bkZ5VTNVWk5HbjJtcjBibk5t?=
 =?utf-8?B?RE9YOWI2NW1XNkM1NHhsYzBGQ0RvYjkvSkl6TmcyOGZQc3V4QkJSbUt4T0t5?=
 =?utf-8?B?T05OMjQ3S0QyTUxwRUtBZ0k3citGWnJId0p3WVhkVWRtNkpTaHFvL2pHaytZ?=
 =?utf-8?B?R3Zldmx4OFQ4RGN6dzFDSHl3QWJsVG1sNWxTMHFleG84NlZzVWFEbGNWUG5w?=
 =?utf-8?B?Mmoyb0FtdG5MVUREU0g0WU5ac0VaNlFtdVFkRFAycWZqdTl6SXBTamtLRkU1?=
 =?utf-8?B?OEZXRDZEQUFNQ2pDNFRDaFBiVGNVYWk3eUlub00ySHo5UEhQeW1oVFo3dm1n?=
 =?utf-8?B?UXRIZzhpZU1Lbys0Wnh3TDl5anVzdEZBd3lmcTgrcldMelJ3U1hRbTU0Z2o0?=
 =?utf-8?B?M3AyQkpwaTllUmRnMElBUXZYRTFzOWdZSFlET2I5WUlvdmh5R3I0S2xmUGxC?=
 =?utf-8?B?Z0hEaWg1d1lCR0NXd3BkRHJOdDhEYnEyb2VVSDEvRTFTV1Znb2hqeWR0RU1G?=
 =?utf-8?B?OW5tMDM4d3NKblN3ZXpTeDVXc09sbjJ4ajV1SXNybFA1TGNzbmRSQWRGUUkx?=
 =?utf-8?B?MjU1WXJEVGhDcGlkMTdHWTUzcHVsMFp5NUIvZ3lIbGZVelk5QjI1aDgxREZl?=
 =?utf-8?B?WVJIUTNUZlFKcG1JSDA4eTU4Tk5CYngrOVFmczRJZ1F0MWgxU0QrVVdMd2dz?=
 =?utf-8?B?Q3VsWFpuMTFGTjA1TlRBQ1R6NkQ1bVFXcFN4Qm05N0syRUM5L2xRNkpjMHlL?=
 =?utf-8?B?WDhDOWNlVXd4cVB4NnRiM21YVWlBTjEweG9MaWxaZVgvMGZ3WDNxWGZ6UFFq?=
 =?utf-8?B?NWxkY0tpc3doVktUVFZITG1ENDYrOEY0WlVQSFM0TFQzcWFBN3JlV3RuLytL?=
 =?utf-8?B?UXlrY3UvanNWRWl5YnVONGMzNHpaVjdZNmJESUF6eWk1amozVUZlU2gwV0dx?=
 =?utf-8?B?aEwvU3pvRHpnU3JyeWloOEU1clp3a1U0bVNCSTYvOXc5c3EzQW83cHBCa05E?=
 =?utf-8?B?eVRSSEdCZEFGQkVsOWNLTXhoYlJLZDlhVS9qbFIwa1pUT3JScHVET3NKYzFn?=
 =?utf-8?B?aFJqVGNhSEx5S0xWc1NSV3FIUkMyRDdXTDc0dXZmV2lyVnFFZUFxTmxYKzhS?=
 =?utf-8?B?U1RjcjdJQXZSSlViRjFjUGtXdnJjK1pZK205c3UvVUI4bk8yMklSc2lDdWtW?=
 =?utf-8?B?bVBtUVJ2MnkvWkVGR01ZeUpJWHArL1g1SEt3MURaSzZFeUIxWEh4ck1rSkIz?=
 =?utf-8?B?NXpyWDdzQ3NKUnhWVDdsak0zMk00NjJlQjBrcXdrZnpYN200WnB4Z1dBY0Qy?=
 =?utf-8?B?S0kwVXFDZkxTbUtJbng5NkwvLzZSajd2Rmt6NFpubGdxTWZtZjRVVGNtRkdO?=
 =?utf-8?B?VFJrTG9NUmNYVHp3Zll6U0YvL0h5SUJBYncxMDFSdXdvb3pYaEI5d2p5U3pT?=
 =?utf-8?B?ai9LL3I1WXJkZVk5TU9aUnp1bWFxVDRtYzlDQXRQMW9RVXB4QlVZVTJxWGND?=
 =?utf-8?B?T3g2aDhJT01seDNmNjBWUlo4VkdZREp2WHA2MTlaRklETFdhY3VvS0dZSHgr?=
 =?utf-8?B?aGFnVDFTbnhqYmhCS00yUW9BWFNHQ0FFcGdieWRla09jdmRQN2tsYjBLLzZr?=
 =?utf-8?B?Y0VXdXd6SkpscXBmb25OMFdpdWM1TUZBeW5zbG0wVXJoSTA3LzBXaXRVbnZ1?=
 =?utf-8?B?d3kzYkxnZEs4ZWs2SlBLb20yMDJuMEw1cG5SeW55eXZsSERlSEVpSnRkYWFG?=
 =?utf-8?B?QkhwQ05kdzlhT3RaZ1NZUmxoU1J5elQyVzYvRnkzbGg4V3l0enpFTlo5ajR4?=
 =?utf-8?B?TkR5cFMwZlhJWTJKc1N1MjRQT2hoYmFYMVpoeUhqUW8yY1FzUThJOWNaWkVS?=
 =?utf-8?B?djViTU9sZzhPbXRuZmgydG4vYW51Y0RSeXd3Znc5QUVLSEpuSXNsY25nY3V4?=
 =?utf-8?Q?jrH90E?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6366.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(366016)(1800799024)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T2VUWUg3ZWY5ZndZSHZMaWJsQUxYMnVrVitGUnpoZTZQbWJaOXQvaFhIYVRC?=
 =?utf-8?B?Y0drQSs2L1dhRnhXaFZKZ2huWVd6UHBwUThjZHVvZ1pKUkhUT1FYUGpydTly?=
 =?utf-8?B?ZE1NRVR0Ry91cXZuZEpCWDd0M3A0VDA4c1dYZm96R01WOS9Ea2orK3RQSDNV?=
 =?utf-8?B?NG5PaXV0bDBBNUpvU3Z2dTl5RWRUdmJkcnZRMGI4bVJ0S245OUNDZllsQWR4?=
 =?utf-8?B?QjZXMFpaRzRIWTRQaUd6SHA4WlY0akdJdlF3dXM4cTJZdW5SS0NFZDBNS1pC?=
 =?utf-8?B?L2MzcldIZkFrTWFaYVlqZ3RvNEtrL0oxMHV0Z0ltaCsvb3NaSGcvYitjRFdH?=
 =?utf-8?B?azBoZnRQa1dFR2R4dEFuZXVweC9OS2VvcU5sdllkUWwzZnhoZ2pzSHc5QW5C?=
 =?utf-8?B?cjZER3Q0a0R0ZVZOY0tPc24xVzlNM3ZBeWhRR3pxMnJkdFBMSkM0YjExN3hv?=
 =?utf-8?B?TVBGMzRQV0I1am1LVXRmZXZIN25tVXVtUHlPK3lhMjFsNGptallNcm9kME1x?=
 =?utf-8?B?T1NPL2orYTlDcHgwS3ltc2JESk5FRSs1OWNyV1Y0R2VleHBtbzF5Vjg2d1ZQ?=
 =?utf-8?B?NmdjWUFoNHRhUjhwQ2hMdENCdVQ2eEhhWUxLaUlPcktNQVl6NnJWTzFzV1dG?=
 =?utf-8?B?ZU9MR2lPdzBIWFYvTkxOUmpGYnJGT1V1MWNseVNFT2Z1VnA5NnhJVUZ2bzBH?=
 =?utf-8?B?TUQxV3B1RnZHRVJhR0hBa2gyMEFxNWZwSHVLNXVNTElXQkNYdEQ2ODVaa204?=
 =?utf-8?B?S1VXYlpQTGE3ZXRlcVRaejFoVXRIbjVPdHRhVW4zVS8xMUxZVE9TWWVjVVZp?=
 =?utf-8?B?bjc5VzRYcWREM0c3ODZ1QjVQUFFzNHh4SXl6VXB5Rjl2TFJNZE95Q2RwNW54?=
 =?utf-8?B?SHFIeWlISW5oMTAwdTVnYjRPZ2k3ZksvRHRyekFVcUp1MFRIeWI1MkRvUmxp?=
 =?utf-8?B?cVpYdmN1Nk9nU3d3WnV4K2Y5djNRdkZycDFwS1VMa1IxV2tmek8zZDg4SXNK?=
 =?utf-8?B?YUpkWlNFeUJZZEVkc2tHdTByY2JBcklycUxvQmFscVZ3emdtQnpZaFF4cmUy?=
 =?utf-8?B?cHIya0RCcjI4anhjM1RRcHlwV0REZEZDVE9IUG1Ea2QxaFlnenZEOWZyN2xm?=
 =?utf-8?B?MUU0UTY0dXJLYTEwdHN6THFqMFBtQm9CdURic0w2WE5xNGJrUTZGZzgyNmRQ?=
 =?utf-8?B?b0o4SkZDWmNFUE5vYkhaSUVXcFQ3a2wzY01ueVRUSUJjVXdTTG1Kd0VYZGdW?=
 =?utf-8?B?R2hCMUZ1Y1JtREpQZUdNSStUeXFrNGNUSW0rRTVpcjFEcEJJWmdwQzRsVzQ1?=
 =?utf-8?B?dXFUS3pkeWFScG5McDcvY1pCMCtVMzdadUNQaXdMSkNVZlU2eXNpemVmeDQz?=
 =?utf-8?B?azFxTkovNHpvL3duMEVNUjJrbTNKazdVcEkrbGUrZlBtaFRLTEVZVDU3YkQ4?=
 =?utf-8?B?RUd3MCs1cjJtWXlPSzNBV3lmR24ybDNUYU5uWk1HUWpkaER5S3BkNUpSRVQr?=
 =?utf-8?B?dE84eFVtUDhJTG4zejdUOGVyNFlxUXB3azI3bjhRV2VIRTRXOGJ0enE4RTBW?=
 =?utf-8?B?aHAwUEYvU1NMcDVaN1h5ZkgyVjFoaWozV0ZNaXdVa1h5RjBTZ2tsNmZpYXF2?=
 =?utf-8?B?TkN6UGcrR2N1RkFtTDNlRWhZcGVWNDQrcGRTSEhPaS9vYTFrWWlyYTNDSlhi?=
 =?utf-8?B?WTIyZExodGdJbUZ2cGlmaGF1V1VsK3BuWlZoc2doSDJlamdUcFlGNzBmRHhj?=
 =?utf-8?B?SUhoeVFsK21LWjZtUkkwalVQRWcvRVIvUnlYSmVKeGd5bGRvVHVzVEZCbzBi?=
 =?utf-8?B?SUV5ekVORHJFcmR3NEpONS9heEN1TE41ZUU2d1g2dlcxWlpZS0N2aEorRTlB?=
 =?utf-8?B?V2E5aThyT0w5czduSVNGbWF0Vng2bDhuYzZvaHBRdzNWdWZsRzU3MVdTdE05?=
 =?utf-8?B?WDZsTUJtZkVod0x6RDNhNERpUFRZSFE4WDZZKzFuaGF1dkpDaVlWOFJvSkJ2?=
 =?utf-8?B?RjVDVDQxOXBIdnQ3VHdjTUoxY0UwWTdhVnl5KzY1TG55L0p0T2ZSZHhYQmp4?=
 =?utf-8?B?NjBCSW1uSFFpMjBPekxWeG51RTVxZjBwMnBqYngrLzBEQSt0YjZKWmtodVB0?=
 =?utf-8?B?bkdHVVgxR0k1TkdxMzlISGwzdks2ZVlxdDZXVmI3dFFBelpWejE4Nkt6Rk9t?=
 =?utf-8?B?Z2c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6366.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 42dd2868-aa2f-4116-2c5a-08de21112fd6
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Nov 2025 10:58:03.3621 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Xsfg+B3h/3w9RCGGQzvQq7rVNPvwgL4FNIK0ybjJhUnOXuXIs4X+V9+dzKf6GpQqSplf2oIWDUOlDgPNfKuIeK13NPVWUGDvtS85pyw6Vb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPFD80FA6330
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

PiA+PiA+DQo+ID4+ID5JdCdzIHByb2JhYmx5IGR1ZSB0byBzdHJ1Y3QgaW50ZWxfZGdfbnZtIHJl
Z2lvbnNbXSBtZW1iZXIgYmVpbmcNCj4gPj4gPl9fY291bnRlZF9ieShucmVnaW9ucykgYnV0IHJl
Z2lvbnNbXSBpcyBpbmRleGVkIGJlZm9yZSBucmVnaW9ucyBoYXMNCj4gYmVlbg0KPiA+PiA+aW5p
dGlhbGl6ZWQuDQo+ID4+DQo+ID4+IHllYWguLi4gYW5kIHdlIHNob3VsZG4ndCBzaWxlbnRseSBj
b250aW51ZSBoaWRpbmcgdGhlIEVOT01FTS4uLiBTYXNoYSwNCj4gPj4gc29tZXRoaW5nIGxpa2Ug
dGhpcz8NCj4gPj4NCj4gPg0KPiA+IEluIGdlbmVyYWwsIGxvb2tzIGdvb2QgZm9yIG1lLCBidXQg
SSBzZWUgdGhhdCB3ZSBjYW4gZmlsbCBsZXNzIGVudHJpZXMgYmVjYXVzZQ0KPiBvZg0KPiA+ICAg
ICAgICAgICAgICAgICBpZiAoIWludm0tPnJlZ2lvbnNbaV0ubmFtZSkNCj4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBjb250aW51ZTsNCj4gPg0KPiA+IExldCdzIGxlYXZlICdudm0tPm5yZWdp
b25zID0gbjsnIGluIHBsYWNlLCBvbmx5IG5lZWQgdG8gZml4IHRoZSBjb21tZW50Lg0KPiANCj4g
WW91IGhhdmUgdGhpcyBpbiBwbGFjZSwgbnJlZ2lvbnMgYWxyZWFkeSBhY2NvdW5zIGZvciB0aGVt
Og0KPiANCj4gCS8qIGNvdW50IGF2YWlsYWJsZSByZWdpb25zICovDQo+IAlmb3IgKG5yZWdpb25z
ID0gMCwgaSA9IDA7IGkgPCBJTlRFTF9ER19OVk1fUkVHSU9OUzsgaSsrKSB7DQo+IAkJaWYgKGlu
dm0tPnJlZ2lvbnNbaV0ubmFtZSkNCj4gCQkJbnJlZ2lvbnMrKzsNCj4gCX0NCj4gDQoNClllYWgs
IG1pc3NlZCB0aGlzLCBzbyBvcmlnaW5hbCBmaXggZnJvbSBMdWNhcyBpcyBvaw0KDQotIC0gDQpU
aGFua3MsDQpTYXNoYQ0KDQoNCg0KPiBCUiwNCj4gSmFuaS4NCj4gDQo+IA0K
