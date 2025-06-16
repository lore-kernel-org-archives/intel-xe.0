Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A5F8DC71136
	for <intel-xe@archiver.kernel.org>; Mon, 16 Jun 2025 12:07:02 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F8F10E337;
	Mon, 16 Jun 2025 12:07:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="dQ5/wndQ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642C410E337
 for <intel-xe@lists.freedesktop.org>; Mon, 16 Jun 2025 12:07:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1750075620; x=1781611620;
 h=from:to:cc:subject:date:message-id:references:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=AH9hE0FspeCnc/rqg0NSD68SvdpZI+ohWaaW9x0izyg=;
 b=dQ5/wndQGytwpp34d+dMt6ln8OC/02tNe58YZWwvaNcZzjlLtNNTMNG3
 /AY5M7e7sW35DUCKMQikNarCm3tGA1TozxRtCOIzfcAgDVuy3S16eTP0Z
 9SD6s8AwQGBE1rzX+InX4a1VHXMpBt3O6dAx3vcqDu48T7VpOHUK96pjD
 pANKehDC9uIxj0cEyaZ/z+LfnG6BZLkD59wstqxT1rOQirWMblzihKzbr
 zsFDfRAyoeGcarD3Hv96MAcCnyn10bwkpIay9F36pPyiAzsPm0re7YoHO
 69moJoFiaUDZPk9mpOsTiVvLSNSU58id3R8gbWfsLK8xZFqHq2nGeqXPK Q==;
X-CSE-ConnectionGUID: b86/ThEjTyCoIP9mRxdqBg==
X-CSE-MsgGUID: 8rn8Hg8OQUOxlg1PjAzJgA==
X-IronPort-AV: E=McAfee;i="6800,10657,11465"; a="51324293"
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="51324293"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 05:06:55 -0700
X-CSE-ConnectionGUID: b41ChD8tSq2v407MwHJ6gQ==
X-CSE-MsgGUID: 12oQDCKCTACk+YtlcEaqmg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.16,241,1744095600"; d="scan'208";a="148827531"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Jun 2025 05:06:55 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 05:06:54 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Mon, 16 Jun 2025 05:06:54 -0700
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (40.107.237.63)
 by edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Mon, 16 Jun 2025 05:06:53 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jcI0qv9O2E22HXC1cLGVLRU9hF4GlmZX3xzByBEDFgylB2U/F8vfi4RFjCy3tzBfGHiaHtR55QasohPbATKlXqN+fgqxfOkCcIZeY8peOjROXsQINwjf0BAFPZ6EQSD+SOxC76ztRBvC7TOL2/baTw4ANuFLDWzFk2ZDPveKPnGJBkMzzx76Cg6xyP6kbBUwVDAQaOOUv+TFRI7bvkCSMXcTpCrCRnZnr20y4E68Z8XRDeFict0Tw4IWA5bXatUhJnl1jNobr531K5Sb6xLfmM3o5qfWD8eI+5isG8CdFzsCBOiT5pPluACTrrVtqG5WWMjPAvgfIGGwyxBeLei1gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AH9hE0FspeCnc/rqg0NSD68SvdpZI+ohWaaW9x0izyg=;
 b=qHGxyhq+wX4nd/Z6Z95aapMWfxhV1K7A8F09b8vxmWGOsUURq/8VdO77Jriw6TweRrWowCuv+YOQfcvnQKDo292wgUVF2Z2IGGpkLcJevDiI24SMFgbXRqkh9dUklVvvrlCVqR1lIqjzju5TrG/szhC+fPw73kXwhy1I3DYiGzvLQUk0dDUY3+BexfdQaN9Ce4n6LdazufqoiIzuPXrYRPyurPe+5eH+v05Q/tQ1fTkzNzxDTZDbBucI+rYo8jsTe0PHogo6nJfyk6lMtl3B+kprj/WzGgdlzO73oPeSHKn1TWKTpOmyfu/RwhsoSBNEZ94CelefM689aZ7ieV+psA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DS7PR11MB6271.namprd11.prod.outlook.com (2603:10b6:8:95::6) by
 CYYPR11MB8385.namprd11.prod.outlook.com (2603:10b6:930:c1::22) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8835.29; Mon, 16 Jun 2025 12:06:51 +0000
Received: from DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17]) by DS7PR11MB6271.namprd11.prod.outlook.com
 ([fe80::3ced:5f14:c459:aa17%4]) with mapi id 15.20.8835.023; Mon, 16 Jun 2025
 12:06:51 +0000
From: "Mrozek, Michal" <michal.mrozek@intel.com>
To: =?utf-8?B?VGhvbWFzIEhlbGxzdHLDtm0=?= <thomas.hellstrom@linux.intel.com>,
 "Brost, Matthew" <matthew.brost@intel.com>
CC: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>,
 "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
Subject: RE: [PATCH] drm/xe: Thread prefetch of SVM ranges
Thread-Topic: [PATCH] drm/xe: Thread prefetch of SVM ranges
Thread-Index: AQHb3opM5bNTcTdwTEylPKY/GmZ/nLQFdCIAgAAIaoCAAAdLgIAAKjUA
Date: Mon, 16 Jun 2025 12:06:51 +0000
Message-ID: <DS7PR11MB62718C1EDB1F49C09FF47C18E770A@DS7PR11MB6271.namprd11.prod.outlook.com>
References: <20250616064712.2060879-1-matthew.brost@intel.com>
 <b1620d738130de216644d09722735607f0b1e35c.camel@linux.intel.com>
 <aE/cr2Eb/KJUIXnE@lstrano-desk.jf.intel.com>
 <9b68aa6f48644a383cb2e9ed5ca3a35a66546ac8.camel@linux.intel.com>
In-Reply-To: <9b68aa6f48644a383cb2e9ed5ca3a35a66546ac8.camel@linux.intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DS7PR11MB6271:EE_|CYYPR11MB8385:EE_
x-ms-office365-filtering-correlation-id: 6cc45508-35cd-45c9-a3a9-08ddacce472c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?UlFCZ3dtbmIyd0ZmVVpYWFlsM0E5L3NYS01uR1VkaXA0S0xOUUZwY3hPbXV0?=
 =?utf-8?B?TXFqMG9sQ3FzRzdMbnVyVmt6NU4zUXVLOGZnZS9seUpRU0JhRWJQck5kNTRM?=
 =?utf-8?B?cy84a0hQSnpTaVhtSW1ONnIwZlVSM3VKUzZqMjJSRURkKytFSk1rcVNzaVBX?=
 =?utf-8?B?M1dTa2pMQjBodFFxbVFTcys4OVV6ZVF6OWZJVUVUTVNlSTBGL0UwdFh3OE9v?=
 =?utf-8?B?UVpBQ2pPUUdWN3d5ZGJPcW5jbTV1NDlaNURFQXRDOWNQUm54RWwzMUFvcnFP?=
 =?utf-8?B?TG9zTzJxZktLOVRFZTBzYnpxdmVmOUpmbFduemRKRGNlZW9KYnFqY1haeUhB?=
 =?utf-8?B?MmZUMWpzcXRjUGl6dDV2bDlWTHc5VDBpc21tRFJ1L1VtUEx1WVgxSHYyTXVQ?=
 =?utf-8?B?ZmF6allJdVhuNWtIRU5JQnI5L1RkY1RTZFZ5cjBYNXBxaHZ1MklZOGZpK0h1?=
 =?utf-8?B?V0NlRTd0RStUWFR3WUdkblNBNGxZRmFpMDNhSVJBVEliT2NGcGVHa3pPYXJW?=
 =?utf-8?B?UURrSjEzUEVtUEZhZm1LdG43NnlHWlNQaURpOFIvRHU3ODBmU1NNUHlQcTdu?=
 =?utf-8?B?MCtXelIxRWdDQXllc3BIOFRFSzhRSUxnTU5jRllZMC80Z2dhelhQSmNQN2hw?=
 =?utf-8?B?Ri93ZXdwYXMwS0l0MGthZEVIWVVHTy9Yc0MxWHNmSXJOcGZPMWpEMVpjL3lo?=
 =?utf-8?B?dHdPMXFqakF5NHdrYkdGMnF5Y0ZaNjZlVGhpdkt6Rm5lN1pnY1VGRG1UWnM5?=
 =?utf-8?B?ZjlmMU5JTUwzSkhHUU5pdGRVbXhmWXQraHZZZWl1V2dYOWZwNFlkT1VmQUda?=
 =?utf-8?B?OU5maUVrTzdiWDZxSE1wM1BKUEJIazBPNlRyamtIeUNMYlk4N0JFWTNwSXJQ?=
 =?utf-8?B?YzdXdXFyM0Z3c3JpeGdZTm9ld3ptVEdIQjFIQUVUYTR1V2FhSjlJZDBjamJT?=
 =?utf-8?B?VGxNRUpWZFFYNDM0NzZkd21lRzA2ckF0M1A4QlUvM2F3c3ZIU3VjeXF4MXNX?=
 =?utf-8?B?Mm52MFNiM1ZTWnlOcTJ0bEphcklqb1dXWTRaMGV5eHFkY2xMcFVkemZLTkRa?=
 =?utf-8?B?MUZ0eFJ0bzBEZ1lKTkk3bG1TM1lrSEtJVEs5YitQM0NwLzNDSW5HQ2RjbThx?=
 =?utf-8?B?cGNtdW5EZDFvZTBJYWtTT2FEY1liWm1UTTUrdC8xSHRwRSs0WUVYanQ3L25z?=
 =?utf-8?B?dWN4NmNQQWRwbkFuWWRkWEIzQ0lhOG0xa1BweFVyeUc2c0hWNUFQVC9VMlhW?=
 =?utf-8?B?K0hVa1NqWjlNL1FPMjhQdHpEbXhtYklLQkJTVWVacmJRTnJ2ckdRTVN6NDBu?=
 =?utf-8?B?YXVYVGZORjNzTkh6TTlUc1pYaGd4a25YdTJHMVA0d3BLcjBMNUtoeHdEZkVG?=
 =?utf-8?B?ajNvZEZVY2N0aDNBTkRBRkdSNG1OOEs1aGZoRGloTzJsTXRYVlpadmFmbThr?=
 =?utf-8?B?ODJ5ZmFsTFN5TG9PenV4RHJYRjZpRDFqZndyczdrZStjRmJvd2MrenU3SStR?=
 =?utf-8?B?MTJhWGRVcTRQNlk4OUJLNzRPbTFNRlFSZmxFM29IeVdWWGxnR1Nqb2NhMllR?=
 =?utf-8?B?NU4ybWY2UVNEZDFnYTVXcE5LSkxhZVl2SFU0Zzc4bWhoQThmeXFZNnBzL21i?=
 =?utf-8?B?cTFzVDF6R3h2a01jRkYvTGM3SHhZb1Y3eG93S25EbVBrRGEvU1haWExoNWc3?=
 =?utf-8?B?cTh2MDRzbkk5QUkvY3ZFYng1d3paK0xUUlNqR1J2MERRMml1aEVUTm1QSDMw?=
 =?utf-8?B?K1phMXduN3JOYiswVjErbnhaUzE4U3Jqb0dZemEvY0RmRHlDWkZ3WkNzc1lD?=
 =?utf-8?B?UTlQTFltSzBySjNFTmNkZFJtdFNYejdTbUJWQW1JVUgzZ0lDMlVKb2RoTDUv?=
 =?utf-8?B?dklhS3h2WmhzbkVjd3FTSGl1QVUyckgwbUhyNjFTdUwrT3phWW9MMGpGTXQw?=
 =?utf-8?Q?nWfNKWc9IJM=3D?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS7PR11MB6271.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TjZYMDRUTnBwMDB2UGlmZytYWHpnRmpSamkvUVl2b0paMWRmZm0xK05TVFU0?=
 =?utf-8?B?eDlDWkplMFFSMU9RU29hc1dlRkdURVRXbWpjYjFjQ3Z1NFM2ZU83MFgxTEVk?=
 =?utf-8?B?a0NrUnBhbytLMFlYNmliVDlNcEZjb3d6OTVsZTBadCtqc3V0aDFUTDl0alVV?=
 =?utf-8?B?aFptOGpndTI2aWM4dEV1cDFDR1B4Uk5KaHY5RnV1anJzRmRCQ1lNSFBmNjJY?=
 =?utf-8?B?K29DWE9ReE1LV0cwQ0hOSkVIdDZOSUY4TWIrRFRONThZMHVLUWpwVjZKSFBt?=
 =?utf-8?B?eXBHU21BTHVTMVcwd0w1YmZSWFU5QVhMdGF5anZsMmQ0UFZlSTlyMTFrTGIr?=
 =?utf-8?B?bGlqeEV1OFJPN3FyZEJNZklYMlpZaGlFWHVuSkVLR3I5emg1SVA1TW04TG9C?=
 =?utf-8?B?K0xoeHFCZkgzZlB4eWVlWnhiTXBRNS8yekVMUGRDSm8wdVdXWjRQY1RoUzNK?=
 =?utf-8?B?b2ZsN3lzYnRmSkgyQVRPTGgvd0h4cVJZS05VSklJcUFpMWRBdVhVS3ZacVlZ?=
 =?utf-8?B?TTRNUU02WUlOdytadDFYcUdSK253STRHalgwblZLSm41K2tQTmZPOTF2YXNN?=
 =?utf-8?B?SlpENHVKT0U1SVhKZllHNEpLbzIwRzdTV0gxS1hEVlZPSGQyVVo3b0J0REp2?=
 =?utf-8?B?Z2dodjI3SHR2TlYvMWZiQkw1ZktwdGlMTm1POTVHSS92NlBtcTY5L0JvSHAx?=
 =?utf-8?B?R2Zqb3MyenpIaFlIZzZqVEZRYWxRQ3I0K0lCOHlOSDRoSm02dnRXN3FoSTE3?=
 =?utf-8?B?QVprQmpGeis4MkhFTmJvMWZreDhMdjBQRGd6ZmlOUy9DQnIwVEE2eklSeWEv?=
 =?utf-8?B?aExVUVl3TkZuNlVmM25JQ0dVbmxPZkE3UVRnaEpvQmFiL3VRMGtBUGtGd09C?=
 =?utf-8?B?Z1ZtMWFHcHY4NHhUa1FSZWg5bithQURGekpOQjYxRmh3bzVQZDJGdU9oVDhP?=
 =?utf-8?B?d2NORFBoUzgrQm4zTFovZUp5Tkh4T09zUXJBaTlxYmhVdU9aRWYzcHIxUjd5?=
 =?utf-8?B?NnY1NWUzZTFXV0Z4TWNYbHEzWThlblJNSlZidjRWdUtib1I0OTFtdnBnWklC?=
 =?utf-8?B?UjJ3YXFCV0NETXpNVEc2cngySDVpdHVGcnRpdHJhQjY4R1ZRZTFrOGJXbnNk?=
 =?utf-8?B?UlhMSXhON0s3cUN5ZDZoNStScDJGcHRHN09SWEFzcjA5SXV6MkxTY0IwTlBY?=
 =?utf-8?B?UUFTR2RwSTNaZEtoTXpyNnJDbm84L0htcU04S3huaFRyTEFCdXlpdGpzcXZU?=
 =?utf-8?B?RExHbEh0a1g0c0Y4b3NGQ3g2WHVpcXAwL1gySW1oVnBqV0F1QmRVcUwxTnNT?=
 =?utf-8?B?UDN1dlpseVBxT2ZPdU1pYjNzVFBSVGd1SU1jUWxwWGliQmYyck1oeDZvZ2dH?=
 =?utf-8?B?a1ZyakZXbG1UK2JUSWJraTVCcUpxR0UvVVBBalNqYkhnY050dmZjMFFFYnU4?=
 =?utf-8?B?bzhYTHBJTkNJR2F4ZkJKRzBlNVlKUGFJVWFHdVRPcVR6WDZPVVVqYjBUc2RH?=
 =?utf-8?B?ZWFXOEZ2UkFQVlAyZmZiaXFkaTNuQWdlVWtWdzR6RWxVNEdsc1d5bG9EeXNt?=
 =?utf-8?B?YnAybVNOTm40WkRaaGFlVktScHpHdzlsM3N3NldvMUZlMGgwa1c3TFdnYjd6?=
 =?utf-8?B?dHFTSWdJQ0I4anVZRDZVUHlUSk54elFUa2tUVGc3QkphYVlnUGNNOG1DVmlm?=
 =?utf-8?B?dHczek53eTA3dnFCSjZLajNCQ0w3TWZxUWZIZzgvZ3B6bEgyMm91cmU5ai9H?=
 =?utf-8?B?QVdqN3JFUmlYMlRaTm84cTZ3M04zTm1nMHVPYk5ndm8xM05aa3NtSndpNG4y?=
 =?utf-8?B?b3ZPN0Y3OVJVV203QjNVZlBhUjNaR0RkMVY0Ui9GQ1Bkbk5mN1BFeEUrNnRW?=
 =?utf-8?B?Z29MTkJZQ3FCTUttWVFXbkZCTFhsVm90RW94Rnd4Y3lnaG9RU2UwL2pUT251?=
 =?utf-8?B?ZEo4UCtaT1cxdERlYmZNeFlVWkpOTFlkbkl5RTBlbnV0TkltS3FQNFpJSS85?=
 =?utf-8?B?N0hOTGwrazI2OExUZVJJTS9vNjczTXpSZ3o1MjRxTG5pdGNSUzdlNmZNUlhy?=
 =?utf-8?B?N1Z1M3dSYW9NV0QxZDFRemcyN1hBcmV3a1BDQ0RyN0I3OHZKeUNCcFJBQTNh?=
 =?utf-8?Q?fKNUOwRDJghR0sZAIkhAF+FIb?=
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DS7PR11MB6271.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cc45508-35cd-45c9-a3a9-08ddacce472c
X-MS-Exchange-CrossTenant-originalarrivaltime: 16 Jun 2025 12:06:51.3531 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: OZcgw86AGEShSSjKYa749qWPVE54VPpR0n1BUG62I95et2HuduYi00Hd8kDjYZYZvURlUCLABQtOBKJU4fLmtQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYYPR11MB8385
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

PiA+Pj4gPiAyKSBEbyB3ZSBhY3R1YWxseSAqd2FudCogdG8gdXNlIDUgQ1BVIGNvcmVzIGZvciB0
aGlzPw0KPiA+Pj4NCj4gPj4+IFllcywgSSBwcm9maWxlZCB0aGlzIHdpdGggYSB0ZXN0IGlzc3Vp
bmcgNjRNQiBwcmVmZXRjaGVz4oCUNSB0aHJlYWRzIHdhcw0KPiA+Pj4gaWRlYWwuIEkgaGF2ZSBh
IGNvbW1lbnQgaW4gdGhlIGNvZGUgYWJvdXQgdGhpcy4gT25jZSBbMV0gbGFuZHMsIHdl4oCZbGwN
Cj4gPj4+IGxpa2VseSBvbmx5IG5lZWQgMiB0aHJlYWRzIG9uIEJNRy4gVGhhdCB3b3VsZCBwcm9i
YWJseSBnZXQgdXMgdG8gYSBidXMNCj4gPj4+IDjDlyBmYXN0ZXIgdGhhbiBCTUc7IGZvciAxNsOX
LCB3ZSBtaWdodCBuZWVkIG1vcmUgdGhyZWFkcy4gQnV0IEkgdGhpbmsNCj4gPj4+IHdl4oCZbGwg
YWx3YXlzIHdhbnQgYXQgbGVhc3QgMiwgYXMgdGhlcmUgd2lsbCBhbHdheXMgYmUgc29tZSBDUFUN
Cj4gPj4+IG92ZXJoZWFkIHRoYXQgbGltaXRzIGNvcHkgYmFuZHdpZHRoIGR1ZSB0byBzZXJpYWxp
emF0aW9uLg0KPiA+Pg0KPiA+PldoYXQgSSBtZWFudCB3YXMgSUlSQyBORU8gaGFzIHByZXZpb3Vz
bHkgYmVlbiBwaWNreSBhYm91dCBzdGFydGluZw0KPiA+PnRocmVhZHMuIFBlcmhhcHMgTWljaGFs
IGNhbiBlbmxpZ2h0ZW4gdXMgaGVyZT8NCg0KTXVsdGlwbGUgdGhyZWFkcyBvbmx5IGdpdmVzIGJl
bmVmaXRzIGlmIHdlIGFyZSBhYmxlIHRvIG92ZXJsYXAgdGhpbmdzIHRoYXQgd291bGQgb3RoZXJ3
aXNlIGtlZXAgdGhlIGhhcmR3YXJlIGlkbGUuDQppLmUuIGlmIHNpbmdsZSBDUFUgdGhyZWFkIGlz
IGFibGUgdG8gc2F0dXJhdGUgc3lzdGVtIC0+IFZyYW0gYmFuZHdpZHRoIHRoZW4gdGhlcmUgaXMg
bm8gcG9pbnQgdG8gaGF2ZSBtdWx0aXBsZSB0aHJlYWRzIGRvaW5nIHRoZSBzYW1lIGFzDQphbGwg
b2YgdGhvc2UgZHVlIHRvIGxpbmsgc2hhcmluZyB3b3VsZCBlbmQgdXAgbGF0ZXIgYW5kIHdlIGFj
dHVhbGx5IGluY3JlYXNlIGxhdGVuY2llcyBpbnN0ZWFkIG9mIHJlZHVjaW5nIHRob3NlLg0KDQpT
aW1wbGUgZXhhbXBsZSwgaWYgc2luZ2xlIHRocmVhZCBzYXR1cmF0ZSBhIGxpbmsgYW5kIHdob2xl
IGNvcHkgb3BlcmF0aW9uIGlzIDFtcywgdGhlbiBpZiB5b3U6DQotIHJ1biA1IGNvcGllcyBjb25j
dXJyZW50bHksIGFsbCBvZiB0aG9zZSBmaW5pc2ggYXQgNW1zIG1hcmsgZHVlIHRvIGxpbmsgc2hh
cmluZw0KLSBydW4gNSBjb3BpZXMgc2VxdWVudGlhbGx5LCBvbmUgYXQgYSB0aW1lLCB0aGVuIGZp
cnN0IGZpbmlzaCBhdCAxbXMsIHNlY29uZCBhdCAybXMsIHRoaXJkIGF0IDNtcyBhbmQgc28gb24g
YW5kIHRoaXMgYWxsb3dzIHRvIHVuYmxvY2sgY29uc3VtZXJzIHdheSBmYXN0ZXINCg0KSGVuY2Ug
SSB3b3VsZCBiZSB2ZXJ5IGNhcmVmdWwgdG8gdXNlIDUgdGhyZWFkcyB0byBkbyBDUFUgY29waWVz
IGNvbmN1cnJlbnRseS4NCkFsc28geW91IG1heSBleHBsb3JlIHZlY3RvciBpbnRyaW5zaWNzIHRv
IGRvIHRoZSB0cmFuc2ZlcnMsIHNhbXBsZSAtPiBodHRwczovL2dpdGh1Yi5jb20vcG1vZGVscy9t
cGljaC9ibG9iLzI3MjI5ZTA4OTU1NGZlZThhYzBhYzlkYTI4ZTU2ZmE3ZGM2NDhhNDUvc3JjL21w
bC9zcmMvZ3B1L21wbF9ncHVfemUuYyNMMzM0NQ0KDQpJbiBnZW5lcmFsIEkgd291bGQgYWR2aXNl
IHRvIGRvIGF0IG1vc3QgMiBjb3BpZXMgY29uY3VycmVudGx5IHRvIG92ZXJsYXAgb24gcmFtcCB1
cCAvIHJhbXAgZG93biBiZXR3ZWVuIGNvcGllcyB3aGVyZSBtYWNoaW5lIGNhbiBwb3RlbnRpYWxs
eSBnbyBpZGxlLg0KVG8gbXVjaCBjb3B5IHBhcmFsbGVsaXNtIG1heSBnaXZlIGRpbWluaXNoaW5n
IHJldHVybnMsIGVzcGVjaWFsbHkgZm9yIGxhcmdlciAyTUIgcGFnZXMuDQoNCkZvciA0S0IgdHJh
bnNmZXIgSSBhZ3JlZSB3ZSBtYXkgYmUgYm90dGxlbmVja2VkIG1vcmUgYnkgY29weSBlbmdpbmUg
aW5lZmZpY2llbmN5IGFuZCBydW5uaW5nIG11bHRpcGxlICgyKSBzbWFsbCBjb3BpZXMgbWF5IGdp
dmUgc29tZSBuaWNlIHJlc3VsdHMuDQoNCkFuZCBhbHNvIHdlIHNob3VsZCBiZSBwcmV0dHkgY29u
c2VydmF0aXZlIGluIHVzaW5nIENQVSB0aHJlYWRzIGVzcGVjaWFsbHkgaW4gaGlnaGVyIG51bWJl
cnMsIGFzIGF0IHNjYWxlIGlmIHdlIHRha2UgdG9vIG11Y2ggdGhyZWFkcyB3ZSBtYXkgaW50cm9k
dWNlIGltYmFsYW5jZSBpbiB0aGUgc3lzdGVtIHdoaWNoIHdvdWxkIGNyZWF0ZSBiYXVibGVzIGFu
ZCBjb21wcm9taXNlIHBlcmZvcm1hbmNlIGR1ZSB0byBidXR0ZXJmbHkgZWZmZWN0Lg0KDQoNCg==
