Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DAD2ACCA476
	for <intel-xe@archiver.kernel.org>; Tue,  7 Oct 2025 17:00:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E56310E2AA;
	Tue,  7 Oct 2025 17:00:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="ZA/0x4RZ";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9689A10E2AA
 for <intel-xe@lists.freedesktop.org>; Tue,  7 Oct 2025 17:00:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1759856449; x=1791392449;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=bTSjkMMaBuREgbOp+rIJmkxva8xR3gZ7YrsA+s0JxeA=;
 b=ZA/0x4RZLkOBZJQmgTvcN/afrFJT1nfDnNkUhfavdQ3vWDxv2Ndiac91
 nErEeBKGsmoDjVeohGD2JDwx4gAGTcbsxirZ2cAAUusiBjGpbRiPnZEBp
 7w3oDPw/gTDHIgCmNf+DXSWkv52U/Se/u+ityv6JZnJm1q6PM97x9HFfH
 wqdMdTLZmyOWMC0cb4m3Smk+fjO//W3HIQP1KwGxlHaHtJyLEbEw2SqN3
 QUxB+AWhrhsthab8tqUSjFkjMxPwCg/ksZ4OCXGC3izL0Fe5bm/xBcG9A
 pNLjFTS5TYa+P6YHDeHYK9yGg7b/yyEHJCyXH4KHz7Lht/+c4FWb6lyZE Q==;
X-CSE-ConnectionGUID: ZkaSFnK5SjO9t9yZepJszA==
X-CSE-MsgGUID: AcOrPD3kT2e6wD22WYo6/A==
X-IronPort-AV: E=McAfee;i="6800,10657,11575"; a="73147406"
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="73147406"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
 by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:00:48 -0700
X-CSE-ConnectionGUID: NnrSfY2xQVyTKMRo+PocsA==
X-CSE-MsgGUID: AWB4cCU7S46MwG87xaAdnQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.18,321,1751266800"; d="scan'208";a="179330895"
Received: from fmsmsx903.amr.corp.intel.com ([10.18.126.92])
 by orviesa006.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Oct 2025 10:00:48 -0700
Received: from FMSMSX903.amr.corp.intel.com (10.18.126.92) by
 fmsmsx903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:00:47 -0700
Received: from fmsedg901.ED.cps.intel.com (10.1.192.143) by
 FMSMSX903.amr.corp.intel.com (10.18.126.92) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Tue, 7 Oct 2025 10:00:47 -0700
Received: from PH0PR06CU001.outbound.protection.outlook.com (40.107.208.6) by
 edgegateway.intel.com (192.55.55.81) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Tue, 7 Oct 2025 10:00:47 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Dr346fuaVtaxnZ/rAfLWGTyH6LO01JODueMYGpSzBVeB43ilq4Y08G4UTi7RdezABvoFL5NFokDlZ3in0MVVGFeKegHkO3lBI2olcGFL9b5v9lCOZGzZvzSOvyWvyTLAl7Cjr7cU0MgowfBTRPovkKzOZW+yDI/rQ2c0XHalc3Bz4pH5yn3y433/Jx6cuoxzbC2GX7lP9j0MY/w/zRlxo9xJYB+wp+bWdx3S6BG8hF4WuE2qBqhjZhjf3Rs2H0SZ6hDEYubzc47/6iY3h+1eA4ShBm/gwPebzGPW4Pk6poqAfvXi4GfbIJurVt9MDSgxz2Tvz5zrZVXTMiWfWlbSPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DDrojIspDfXbo+Pu5SGH6XXotugs5mSQcwaRnI8X30s=;
 b=qZdxCoKuHStHKuKb1yq7O9xNSpB+ZWlr7yTF2YYSvokhaKi7VS0ujUiINEx1FB8I9P29g25vlXqDST15gpuwrK+WCKGgfO4yQPtUdFXPGpinam6nNV4qMKonmj1IxAHvZgMAbhQzMe8IfCF9qjuYkNz4kakh7prmHbk9x0RLup9J4Ljwh/vaQ0dCfosAR1h+TlY2HEJBJ20lOlf6M5GYVVf1YdFn6sK2w05ykoI8iSsNWIRCm6jL374YP2j4Xu9EpY02jkzLVIEITVGgIS6I5KLTfw6Jkil6oMsO48S/+jGWKQWK15hf7v3kIFN8qvKIwgBeA8BJYtyf7AYJnJZFgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by PH7PR11MB5766.namprd11.prod.outlook.com (2603:10b6:510:130::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9182.16; Tue, 7 Oct
 2025 17:00:36 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::7141:316f:77a0:9c44%6]) with mapi id 15.20.9182.017; Tue, 7 Oct 2025
 17:00:36 +0000
Date: Tue, 7 Oct 2025 12:00:32 -0500
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, Matt Roper <matthew.d.roper@intel.com>
Subject: Re: [PATCH v6 27/30] drm/xe/vf: Use primary GT ordered work queue on
 media GT on PTL VF
Message-ID: <h4mwspqv5chueicgkrvd4grucstgev3vfkuavaeqbweqecvznc@wjpe5lk7tkr3>
References: <20251006111038.2234860-1-matthew.brost@intel.com>
 <20251006111038.2234860-28-matthew.brost@intel.com>
 <t6aytzfw5frhua2ojrz3xyrobi25p424exjagpmovtvif5jwhw@ocmceysqldql>
 <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <aORH4NrjGSNcCxi/@lstrano-desk.jf.intel.com>
X-ClientProxiedBy: BY3PR10CA0027.namprd10.prod.outlook.com
 (2603:10b6:a03:255::32) To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|PH7PR11MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 488eb4d7-dcd3-4e84-fcbc-08de05c308bb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCsrYmFqTnI1dExTcFBIZG1vckR6ZFh6eEo3NnFYc3IvVHR1cVVYNG5mV0M5?=
 =?utf-8?B?TTdmN2UyZ3ozUEZvTmFHOVVmbWRTdExqR0Y4SmMwRlltanNwaGlUUEx5N1lQ?=
 =?utf-8?B?clN3aTFWaFJDeGVXVE1tS2tCeVNDZW9iTUFscllRWEdISE9Ka2hqenRQRkpM?=
 =?utf-8?B?Vm5FaVY5Y2N0bWlUQjdLYlpGNngrVm45ZXJVV1ZCekp2VnFwS0NjQXRHNCtD?=
 =?utf-8?B?WGczMHBzR2dXSHk2OStVUzBRazlxZW5CbFVlRzhRYjlUK0ZaMW5HK2NqMWN6?=
 =?utf-8?B?VC9UcG42QWdsOWZtVG5SbHhDcEJ5dGgzQ1puTHJvdGI4cU5pTUNvZ0V3dWtL?=
 =?utf-8?B?SFBUM3pTRUZVb3NYWU51ZGh3OEcyTE9wekp5RzZBb1ZOU0FHcUo2VXhxeFhh?=
 =?utf-8?B?bE9HRnFPMVR6UE9XdWJJWlNvNmdEdE44QmRwMTE0c3ZKdmVPbUNVZFpnQU1X?=
 =?utf-8?B?ZUpSc2JOQm9wdTZ4eUpjOFljWVBTc2w3ckZWdFNBb1U1VW9DTDhROU10aTM0?=
 =?utf-8?B?ckFRYXJQcURXS3Qrbk81ZXQvd1RvQ2FnOEV1aVpMRTZ6emRpSStYdEVkUFAw?=
 =?utf-8?B?SkpxNVh0dHRnYWIyelJ2ZytoSUZsV3hzWG1RblVSZVc3eDBubGtua0tHNERY?=
 =?utf-8?B?UmhQM3JKL25tTWpacThIWG5IckNsYzc4aDhIR2ZjVW1wajB0U21LU3lqQ0w3?=
 =?utf-8?B?SVdjK3RGb1h3MDhicVRLZXplV0ptUm81cXNWV3hESVNKNXZBSDN3Nnpsc1hI?=
 =?utf-8?B?UnVaaERCT2tSdlpvZkI3ZlZPQ3RoR1pDcWZ5S3FCN0Q0RWdxTWpzdCsvWCsz?=
 =?utf-8?B?SnpVbDEyTDViZ09mRXVwV2l1YzBMSVlwejFVUVpPcmlhMUc5WWZPRGVVT0xz?=
 =?utf-8?B?dkRuSW9jczlHVFlkT2sramlnTVBuMVB5UVN3MVJFZytob1hUT3ZZTm5FUE9G?=
 =?utf-8?B?RkRtbHRuM3pqUkF6T1YvVkRZVkg5eDh3OE1mVG1mR0ZvbS9nOTF5UGRsS3FN?=
 =?utf-8?B?U1R2U3RNWGk3Ym1ESVFPM3E3dDBpd0lSaXBVUml3aDZMdnNxU1RnYmdHZU5Z?=
 =?utf-8?B?YVA2WVlmVGZvRVpVb1IzYmtHWVR1b3FVTUwrOFBuRTI2YzdTcWFOT2NMWTRh?=
 =?utf-8?B?UDdleFQwV1Y1Z0V4cEdmbWN2b3M4UDdXMFNwZi9STUljeHFBcllnblZYQXdC?=
 =?utf-8?B?ajc4SDJxcHo5ckRYR0sxRTc1SkZYWUthQ0ZkcWZRbm9GSlNyanJVdUxTelcz?=
 =?utf-8?B?UEF4bFZNK2FRY0xFOURyMEVpdVRGTndqMUVjUkloc2srUDJDc25xb3VTN0Rj?=
 =?utf-8?B?bFpBQmpiRHlnZDJXeHM0R0FoQWxEYS9CNnBQRzNJTGJxSGp3dlJnQml0UWIz?=
 =?utf-8?B?SWNQNCtERjBwOHFsODc1QWZta3dBM084b1krQnp2WFJCdlR1akRiWTVBS3Fi?=
 =?utf-8?B?VHNZb29STVRKYXRuNXpQVVp2OXpDd09lWVI5d2FLVjY1WFZvM1NNOFVkVWVw?=
 =?utf-8?B?RC9ZL2FNR25aRERQRFdsZklEZlIyNGczbmY0MWhkaWRndzJlTmFJZzBwVEdP?=
 =?utf-8?B?eVFoSXY4Vkd2ZlM4b3Rva2h5N1h3MldaekIzSTd0RTFJdTdYSlg0b1U5UVJW?=
 =?utf-8?B?QmFZM1JMQWxiV1hvcW9sMTA4c0MxSW5Yd2w5R3Y1UG9ZWHpSdGF6YjZ5OXdI?=
 =?utf-8?B?MFZETDNMRTBZV2FJei9sNXhwOVFWb1pSbXJXL3h0N2dZTE96bGx2cEFhU28w?=
 =?utf-8?B?N1liaXlMR0NxazlHTmlMSDRqM2pQQ0QvOVNHaUhIbkJkZldrREFhUGJpb1h1?=
 =?utf-8?B?UjlYUzVUNVpRT0xMNmh3V09qSEI2eFJxanZiOW5lMlNkdGEzaHVKTldzZTE2?=
 =?utf-8?B?QUJJN0RHaXVuYzBvUTltcE13Ylp4aCs4bmtqRjMyZ3c4U2c9PQ==?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TWh4R2RLTFg0Q3hrS3hCcGpyZXNzSmZzbzk4VmdnZk5QdFZyS0JZQWZPcWdt?=
 =?utf-8?B?enBET2Fqd0xXdXNwSGU2K1d1QVpGRnpOV3RycHMzcTk4U3d5ZnN6MSsyc2Va?=
 =?utf-8?B?SmdBL0l5SVdGQ1dtZDg1d1hIK2hGRS9UdTA0djdyMVpUTElGOEdObXZ0YXQy?=
 =?utf-8?B?NmZBN1RCeEVhK2ZVeFJQblcxSk5oNmcrRHdGTDUxQzRJbXF1N3NLZFIray8r?=
 =?utf-8?B?R1cycGYrSmV3bm80MXB0MVNNWFhCMEhYZzhuYmRsSjlOdjNMaXkvdW54WnBo?=
 =?utf-8?B?cE82TkhqUndaSDFNMncrZzNVZGRFencrZWNsS2FYbHhDOFlicWY1OTZBbFYw?=
 =?utf-8?B?TVBady82QzN5ZVl4RFZSZkNHT0pqNFNaZVdaMCtrUXB2dTZwcDJZaGVkK1NF?=
 =?utf-8?B?S0VYeEJJanN3emtHcm54WWRXTVM1WElrd3VGNDBlYU1Meis5RUFWS3lnVEp6?=
 =?utf-8?B?T0lUVDdZZlE1MTF5NzJTVElWYm4vVE16OUNSNzlScmJ3aThvV0ZYL1FQWTRq?=
 =?utf-8?B?VjV6UUtyZVRjL1dqYTQ1K0UyQ2lnd3lnSkRVTzdxUHB5WDR1RkxLbklCbWh1?=
 =?utf-8?B?TE40dWhtc0pmLzZnWHZXSlY3ZFA4eElNTzVCOVhXOEpCNUFPWTJWWS9wQ2Jz?=
 =?utf-8?B?eC9jdEJnY1J1L2tRWGp2R0Z4ZXNhaXk4b3FEbHhZYTdTb1Q5S3VmYWI4b21V?=
 =?utf-8?B?K3EyVE5FRWJjYy9xZ0I3aGkrUTh2MHZLRTBiSERwYXN4bVFJVXU1T3crakt5?=
 =?utf-8?B?TnIvZWtqY21uOGZhQk85eWJKNTJOcEhmNVJVQVFXVlNNVzgwNXE1WUhVUkY5?=
 =?utf-8?B?WkhPcUJvK1RwZks4cXYrWDdld09NOCtlUFBWamlSNnRjZ29MekFJZ09SOXcz?=
 =?utf-8?B?b3EzSEg5MERNdW9mTUovVXBkYzdvbTRQWlBvNUdyRkQydzNXeW9CUTF1L1Rh?=
 =?utf-8?B?RXZ1ZXJaRDBLcnFqMS9jelhUYW1vYmdxSEJma0FhcE9oclBYL3BORGVnbWQr?=
 =?utf-8?B?M1prNlUya2tmWGppL1Y1NXRZMEpaQS9xVVR4aTZVUnRjcGg4S3Nza21JVExL?=
 =?utf-8?B?SkhHWUJUbnIzeXUwT1pxaER4eEx1Y1pvbDcrNThrUEZ4N3BBVDZwZnowQS9B?=
 =?utf-8?B?SHhyYWVkeEFYczFvbEZlRG84QWhrZzBRTHQ1NjVBMmxGY0FTZHR6TUZlREZ6?=
 =?utf-8?B?ZDgzU1ZqalQvUkxrNnJ2OFpndzN0dHF3STgyMFZKVklkZGI4OGIyN3BSZDNu?=
 =?utf-8?B?L0JmNTU3U3JCZG1uVVRFbHNBckRxZXRnSGpWK3lZV1JRc0dmWUI0ZmFaTkc1?=
 =?utf-8?B?Z0poQjdTUTdxOHZ3bWd1djcyd2ZWZmdSTEtlanZCWkp6b1hOa0FZMGpiM2hh?=
 =?utf-8?B?TG9PcmdGYUs3UXpiMGZOQUVpZTFpeGc2cmd6MlB6TjdaOWlHdDVaaS9rbUJj?=
 =?utf-8?B?STkwQkNHTmJDbDRHNWs5Tjd5dmg0TE1iM0xuVzRzQnJzODZwTEdJdmk0Vm1x?=
 =?utf-8?B?REQvTEZiRjIvNWIxdW40dHZmM0NCcW1UMnVlY2RmS2loKzVxY2xzVnR1M2Uw?=
 =?utf-8?B?QmRXMWFhdE1HaVl4NUxPU3hYMjZxZXd4bVh3aUswNG1IQjhMNlBnS3ZRNjdP?=
 =?utf-8?B?RHJjVERCczJQb2RidmljUUtvZFQra2dUdDl5UFlHR0dCdCtNcXhDU08yQndR?=
 =?utf-8?B?NG1IN1pyT0dwWUl4dUhuYlByMkU1SWVjYXY4V3ZNblp0ODhndGNoWnlnRE90?=
 =?utf-8?B?WDJuQWovY2ZUSCtPbjVrRnF5OFR0VUpqUGl2RzJjdDFNVGZZa081aE02Qmll?=
 =?utf-8?B?Z2ROdmdqQ05qbmxGWVg4SjgzQTA4NVUyMFg1eHNvOW5VRHc1N3FQWWJtTXZL?=
 =?utf-8?B?cW1ZdFNlR3hSYTdJdkN6d3luVC9MRWNMNzkwZGRiSmhrcTBLWXk1Ykg2VDd5?=
 =?utf-8?B?S3BiSGN3NmRSY2F6ODFyMWFDOUhDc0o0T2RZaG1BZU1ITjc5cllDQzZSU0Jn?=
 =?utf-8?B?VEF1b0pDYnhVNnZUQlJIMldzZmhRK0xGcEtCaFFJcDhpV2xHQzJFMXUyUWt6?=
 =?utf-8?B?REtjdVBlQWszbzFINjZUVFdpQnRDeDl3Mjg0V1F3T3ZUWlVNY281K0dsQVlH?=
 =?utf-8?B?YUxGdkJQSXAvWU91YjA2VXczYWtraVpzU3Q3UnNxcGZzOUhDdXBSWXhoTGZH?=
 =?utf-8?B?dmc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 488eb4d7-dcd3-4e84-fcbc-08de05c308bb
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Oct 2025 17:00:36.0276 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ssh217LOhEj1yd0CNePNlxrOq5gokCkVvnyTuD0N/kvdA1hLnSwQ7lQhsoFrCH3q/lXKDwIKbjz88Gy+4RJ4cXnZpA9t2hC+DOaAIkd4hnk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB5766
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

On Mon, Oct 06, 2025 at 03:51:12PM -0700, Matthew Brost wrote:
>On Mon, Oct 06, 2025 at 05:24:55PM -0500, Lucas De Marchi wrote:
>> On Mon, Oct 06, 2025 at 04:10:35AM -0700, Matthew Brost wrote:
>> > VF CCS restore is a primary GT operation on which the media GT depends.
>> > Therefore, it doesn't make much sense to run these operations in
>>
>> I'd need to double check the previous patches to see the entire
>> picture, but this seems weird at a first glance. The VF CCS restore is
>> not the single work we queue in gt->ordered_wq.  To me it seems more
>> like "in what ordered queue we are going to queue the VF CCS restore. If
>> it's global per device, why are we not using the device wq rather than
>> making all the GT wq point to the same thing?
>>
>
>This is where things get convoluted. Four mechanisms manipulate the
>scheduling state by starting or stopping the DRM scheduler:
>
>- Job timeouts
>- GT resets
>- VF restore
>- PM resume
>
>All of these paths require mutual exclusion, or the scheduler design
>breaks.
>
>The first three ensure ordering by scheduling on the same ordered work
>queue (GT-ordered WQ). The last one is guaranteed by holding PM
>references in all the right places.
>
>Another issue is that the first three items are all in the reclaim path
>— the GT-ordered work queue is designed to handle this.
>
>This patch [1] explains the entire scheduler design in detail.
>
>Only PTL has the cross-VF/GT restore ordering requirement, so I figured
>the path of least resistance is to just point all GTs to the primary
>work queue.
>
>[1] https://patchwork.freedesktop.org/patch/677980/?series=154627&rev=4
>
>> > parallel. To address this, point the media GT's ordered work queue to
>> > the primary GT's ordered work queue on platforms that require (PTL VFs)
>> > CCS restore as part of VF post-migration recovery.
>> >
>> > Signed-off-by: Matthew Brost <matthew.brost@intel.com>
>> > ---
>> > drivers/gpu/drm/xe/xe_device_types.h | 2 ++
>> > drivers/gpu/drm/xe/xe_gt.c           | 7 +++++--
>> > drivers/gpu/drm/xe/xe_gt.h           | 2 +-
>> > drivers/gpu/drm/xe/xe_pci.c          | 6 +++++-
>> > drivers/gpu/drm/xe/xe_pci_types.h    | 1 +
>> > drivers/gpu/drm/xe/xe_tile.c         | 2 +-
>> > 6 files changed, 15 insertions(+), 5 deletions(-)
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> > index c66523bf4bf0..02c04ad7296e 100644
>> > --- a/drivers/gpu/drm/xe/xe_device_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> > @@ -334,6 +334,8 @@ struct xe_device {
>> > 		u8 skip_mtcfg:1;
>> > 		/** @info.skip_pcode: skip access to PCODE uC */
>> > 		u8 skip_pcode:1;
>> > +		/** @info.needs_shared_vf_gt_wq: needs shared GT WQ on VF */
>> > +		u8 needs_shared_vf_gt_wq:1;
>> > 	} info;
>> >
>> > 	/** @wa_active: keep track of active workarounds */
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.c b/drivers/gpu/drm/xe/xe_gt.c
>> > index cf484a2da35e..05465f358c96 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.c
>> > +++ b/drivers/gpu/drm/xe/xe_gt.c
>> > @@ -65,7 +65,7 @@
>> > #include "xe_wa.h"
>> > #include "xe_wopcm.h"
>> >
>> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq)
>>
>> If using the device wq is not an option (possibly because it would queue
>> with other undesired work going on there), then I'd rather drop this
>> bool passing here and make the decision inside this function:
>>
>> > {
>> > 	struct drm_device *drm = &tile_to_xe(tile)->drm;
>> > 	struct xe_gt *gt;
>> > @@ -75,7 +75,10 @@ struct xe_gt *xe_gt_alloc(struct xe_tile *tile)
>> > 		return ERR_PTR(-ENOMEM);
>> >
>> > 	gt->tile = tile;
>>
>> 	if (!xe->info.needs_shared_gt_wq || !tile->primary_gt->ordered_wq)
>> 		ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> 	else
>> 		ordered_wq = tile->primary_gt->ordered_wq;
>> 	if (IS_ERR_OR_NUL(ordered_wq))
>>  		return ordered_wq ? ERR_CAST(gt->ordered_wq) : ERR_PTR(-EINVAL);
>>
>> 	gt->ordered_wq = ordered_wq;
>> 	
>> ... or something like that so you use the xe info to decide it here
>> rather than passing it down as a function arg.
>>
>
>Sure can refactor this as you suggest.


another option that would avoid a bool arg would be to actually pass the
wq from the caller.

	wq = NULL;

	if (xe->info.needs_shared_gt_wq)
		wq = tile->primary_gt->ordered_wq;

	xe_gt_alloc(tile, wq);

>
>>
>> > -	gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> > +	if (use_primary_wq)
>> > +		gt->ordered_wq = tile->primary_gt->ordered_wq;
>> > +	else
>> > +		gt->ordered_wq = drmm_alloc_ordered_workqueue(drm, "gt-ordered-wq", WQ_MEM_RECLAIM);
>> > 	if (IS_ERR(gt->ordered_wq))
>> > 		return ERR_CAST(gt->ordered_wq);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_gt.h b/drivers/gpu/drm/xe/xe_gt.h
>> > index 5df2ffe3ff83..9545c0c93ab6 100644
>> > --- a/drivers/gpu/drm/xe/xe_gt.h
>> > +++ b/drivers/gpu/drm/xe/xe_gt.h
>> > @@ -28,7 +28,7 @@ static inline bool xe_fault_inject_gt_reset(void)
>> > 	return IS_ENABLED(CONFIG_DEBUG_FS) && should_fail(&gt_reset_failure, 1);
>> > }
>> >
>> > -struct xe_gt *xe_gt_alloc(struct xe_tile *tile);
>> > +struct xe_gt *xe_gt_alloc(struct xe_tile *tile, bool use_primary_wq);
>> > int xe_gt_init_early(struct xe_gt *gt);
>> > int xe_gt_init(struct xe_gt *gt);
>> > void xe_gt_mmio_init(struct xe_gt *gt);
>> > diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> > index 3f42b91efa28..25a1d96a68e7 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci.c
>> > +++ b/drivers/gpu/drm/xe/xe_pci.c
>> > @@ -347,6 +347,7 @@ static const struct xe_device_desc ptl_desc = {
>> > 	.has_sriov = true,
>> > 	.max_gt_per_tile = 2,
>> > 	.needs_scratch = true,
>> > +	.needs_shared_vf_gt_wq = true,
>>
>> as per above... I think this needs to be detached from vf. There may be
>> other reasons the wq needs to be shared.
>>
>
>I’d prefer to share the work queue only when absolutely necessary — such
>as when PTL is on a VF and migration is supported.


I missed that you left the VF condition out as an && for the allocation:

>> > +                                       xe->info.needs_shared_vf_gt_wq &&
>> > +                                       IS_SRIOV_VF(xe));

IMO a better way would be to call it `needs_shared_gt_wq` and then
override the condition in the vf-specific function:

sriov_update_device_info()

Lucas De Marchi

>
>> If we just make them point to a device wq as suggested above, then
>> there's no extra issue with the ongoing work to disable GTs that Matt
>> Roper is doing (https://patchwork.freedesktop.org/series/154739/).
>> Otherwise we will need to think on how to reconciliate them.
>>
>
>I don’t see how it would ever be possible to disable the primary GT and
>still do anything meaningful. You can’t allocate memory (e.g., for
>clears), perform VM binds, or handle page faults without a copy engine.
>
>Matt
>
>> Lucas De Marchi
>>
>> > };
>> >
>> > #undef PLATFORM
>> > @@ -598,6 +599,7 @@ static int xe_info_init_early(struct xe_device *xe,
>> > 	xe->info.skip_mtcfg = desc->skip_mtcfg;
>> > 	xe->info.skip_pcode = desc->skip_pcode;
>> > 	xe->info.needs_scratch = desc->needs_scratch;
>> > +	xe->info.needs_shared_vf_gt_wq = desc->needs_shared_vf_gt_wq;
>> >
>> > 	xe->info.probe_display = IS_ENABLED(CONFIG_DRM_XE_DISPLAY) &&
>> > 				 xe_modparam.probe_display &&
>> > @@ -766,7 +768,9 @@ static int xe_info_init(struct xe_device *xe,
>> > 		 * Allocate and setup media GT for platforms with standalone
>> > 		 * media.
>> > 		 */
>> > -		tile->media_gt = xe_gt_alloc(tile);
>> > +		tile->media_gt = xe_gt_alloc(tile,
>> > +					     xe->info.needs_shared_vf_gt_wq &&
>> > +					     IS_SRIOV_VF(xe));
>> > 		if (IS_ERR(tile->media_gt))
>> > 			return PTR_ERR(tile->media_gt);
>> >
>> > diff --git a/drivers/gpu/drm/xe/xe_pci_types.h b/drivers/gpu/drm/xe/xe_pci_types.h
>> > index 9b9766a3baa3..b11bf6abda5b 100644
>> > --- a/drivers/gpu/drm/xe/xe_pci_types.h
>> > +++ b/drivers/gpu/drm/xe/xe_pci_types.h
>> > @@ -48,6 +48,7 @@ struct xe_device_desc {
>> > 	u8 skip_guc_pc:1;
>> > 	u8 skip_mtcfg:1;
>> > 	u8 skip_pcode:1;
>> > +	u8 needs_shared_vf_gt_wq:1;
>> > };
>> >
>> > struct xe_graphics_desc {
>> > diff --git a/drivers/gpu/drm/xe/xe_tile.c b/drivers/gpu/drm/xe/xe_tile.c
>> > index 6edb5062c1da..e9bcff2de563 100644
>> > --- a/drivers/gpu/drm/xe/xe_tile.c
>> > +++ b/drivers/gpu/drm/xe/xe_tile.c
>> > @@ -157,7 +157,7 @@ int xe_tile_init_early(struct xe_tile *tile, struct xe_device *xe, u8 id)
>> > 	if (err)
>> > 		return err;
>> >
>> > -	tile->primary_gt = xe_gt_alloc(tile);
>> > +	tile->primary_gt = xe_gt_alloc(tile, false);
>> > 	if (IS_ERR(tile->primary_gt))
>> > 		return PTR_ERR(tile->primary_gt);
>> >
>> > --
>> > 2.34.1
>> >
