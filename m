Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA2E4CCD195
	for <intel-xe@archiver.kernel.org>; Fri, 17 Oct 2025 10:43:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD4A10EBAC;
	Fri, 17 Oct 2025 10:43:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LPxzSFs4";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0E8E10EBAC
 for <intel-xe@lists.freedesktop.org>; Fri, 17 Oct 2025 10:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1760697796; x=1792233796;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=zt4v8Eab9ToDBBcRzmXFy5/jomlarHBs8P19qArg1UA=;
 b=LPxzSFs4YhKPWVrcTB3XpLJshr0SYfnZTwp3zYUPt4dVVIHwHwT780Dx
 JqwXvgMmnto8bULO+S4hM1Y+f1iI0rAf8StxefoWslmbviZuBnXT3/sRT
 IRtoAYlhjRIbEpm4lYV9A3i2vt5m4SfWSNANRGw/S0156t1z5cA1jCkaJ
 i7oyL6/gCVLeqOKwv7Ex4UVcZ/H7Xd+Ma+tBNTSXRwr4TzpVmqwxEZXl0
 BFSCeQzpAi3NhFKmIT2nQAf0Epo00Hc0HNjvpi3z9e43lLagh/Ae4vrrw
 KnboJlL/gFlWp1wNpU5jpEJD8HshOAWflzIatuJJ87IpZMrwNJ9uVtV5W Q==;
X-CSE-ConnectionGUID: RDt+FUlmQkSP3sh7mvkNrA==
X-CSE-MsgGUID: +X7PwXpHTeC/Q+4BNEZFBA==
X-IronPort-AV: E=McAfee;i="6800,10657,11584"; a="62116191"
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="62116191"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
 by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:43:15 -0700
X-CSE-ConnectionGUID: 9pyEkJ71QvuF9v8Tdv2ctA==
X-CSE-MsgGUID: h08ouI3MRI6Ermnp4rIoBQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,236,1754982000"; d="scan'208";a="213673537"
Received: from orsmsx902.amr.corp.intel.com ([10.22.229.24])
 by fmviesa001.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 17 Oct 2025 03:43:15 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX902.amr.corp.intel.com (10.22.229.24) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 03:43:14 -0700
Received: from ORSEDG901.ED.cps.intel.com (10.7.248.11) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Fri, 17 Oct 2025 03:43:14 -0700
Received: from CO1PR03CU002.outbound.protection.outlook.com (52.101.46.36) by
 edgegateway.intel.com (134.134.137.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Fri, 17 Oct 2025 03:43:14 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ly4Gd4BFFyMosY7c2z773lWKczX7H1jgF4dHgIuvXPijJXM4ieI656mGQUeweUWWjv3fEYPuAFIPkdgFJa6lENzHUcC9Ix2eZftCYEBI6Pgiw8csXFjNt9HBpP+BodaoaUpOfYDOvbqVjKRR99rSxwz26NFKWvsv180jxgJut+RpeeiMERaj9fwA7om0lzYNq8OzhB6vzamZZttORfW+AKwhZo9ogTc/obZ6dh1u4Rvy4R4PXb3FOp3H+0aunOG7fVBLxBE7yHH+JYDAxMwXMy/qpgp6QZj2SODDvbZH6hxNnWZ/UmtC//NF1s4j4qDfqyvTxUFRbwjN4sfd3/zmrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4+paRChY+jSofAezcINghOJ6ES3ho8xzBZ635qaY94I=;
 b=CzJfeQm9LHcBdfaY5y6xGp51ZK1o6q3sLQjomkI2pxst5GDD3e68w0HTyL5pbiz9aqr4ip2+UrjAPxazLA/OEGK150WeTbB/WWfuzPbErjuQNFpNO29rqfILveO44XnlkCHFxQAqePhoY0+turUEOxbkUpP7IYYGCFCPGN3F03jSJhnjStJReiivbQZUJZO5wVdtF0MUxYgQwe7R3XU1RZLivx5mzVeSNgPWv1QF+tpRbXFfgrEQHtNrFGoujK+MZgMKcqylGzcwhJ6ehfUxTiTckp3XIw9W43zXZVN19UZJQBUV796BHLD3yDS60lfZYa8zgfyS+SDDSoybc5euRw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN9PR11MB5482.namprd11.prod.outlook.com (2603:10b6:408:103::16)
 by SN7PR11MB7115.namprd11.prod.outlook.com (2603:10b6:806:29a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Fri, 17 Oct
 2025 10:43:07 +0000
Received: from BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229]) by BN9PR11MB5482.namprd11.prod.outlook.com
 ([fe80::158b:b258:5e7:c229%5]) with mapi id 15.20.9228.011; Fri, 17 Oct 2025
 10:43:07 +0000
Message-ID: <dbaa050e-696d-4938-b192-e0456f1f0a29@intel.com>
Date: Fri, 17 Oct 2025 12:43:04 +0200
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] drm/xe/pf: Always expose VRAM provisioning data on
 discrete GPUs
To: Michal Wajdeczko <michal.wajdeczko@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <piotr.piorkowski@intel.com>
References: <20251016122233.3789-1-lukasz.laguna@intel.com>
 <d973e543-d348-4360-a8d2-a140fc1a6628@intel.com>
From: "Laguna, Lukasz" <lukasz.laguna@intel.com>
Content-Language: en-US
In-Reply-To: <d973e543-d348-4360-a8d2-a140fc1a6628@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: WA2P291CA0010.POLP291.PROD.OUTLOOK.COM
 (2603:10a6:1d0:1e::16) To BN9PR11MB5482.namprd11.prod.outlook.com
 (2603:10b6:408:103::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN9PR11MB5482:EE_|SN7PR11MB7115:EE_
X-MS-Office365-Filtering-Correlation-Id: 1100bd67-bd2a-4258-e18f-08de0d69f582
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MTlXdWRDd2gvWDFJdGF3bm1LU1VtRmVxRSs1V2hQeWJIQXpzZkR1UW5paVNn?=
 =?utf-8?B?d1dPdkxJa2x2d3dpRGt1a1ZXbzhGOXpjRjBLak9vV1FHbTRtVHp2ckhyY2Rx?=
 =?utf-8?B?VjNJQ3BEbW9Kd2N4RXZrR0w5UFhVYmtIOWg2SVRLYktxR3AzdDhMNFU0bUNl?=
 =?utf-8?B?K1lJZXpSMWZTQzE5YkdqUVNrYTRhTFA1ZHlIdk5KelcrRFlUMDc4SXFkaUFN?=
 =?utf-8?B?Yk1OZlRrQmdxc1gyMjl1MWtORWhMdXFPc0FpakdOdXQ1NTU5YW9ZNG9vNFBy?=
 =?utf-8?B?QmsxTk80ckI2MEFvRWZURkk1SjZxTFZ5N1Z2dmhValUycTBoZGh3eWlIa0Fq?=
 =?utf-8?B?RlFLRldIVmYvWmpoN05HL1EwYk5JN1RtNDAvNU12Znl6bGJyTWFYNWdEU2JG?=
 =?utf-8?B?SnhRVmlYL3VyRVc3RlhOYnFQOGZzTkxmZDJ4RUp0bnZuMjI1TXJCeWdSYWFm?=
 =?utf-8?B?Si9Uc1daMmdrWUlpaW1MM3BFdjI0K0t3NFdtQkZxTGQreWJhQ1dUQ2ovYTI2?=
 =?utf-8?B?cGlCTFlma2dUZCtvWVp3SHNCaEVFb2dqT1dqaHFUc3JLdUJOL2hFNUlNQTNj?=
 =?utf-8?B?Wlg2ZWdGalM3QzJ6eC9NMUVZc1VSQXRiN3JvUGY2T1V1Ukh5WFNYcy9tcC9V?=
 =?utf-8?B?czFxMDdpYW00bnBtV2hBYWttRXpLcmxxQ29wR2lWYlFZNFlRNnZKUU82dFdX?=
 =?utf-8?B?VE4vV0NGbzdmV1k3SHpEYllCZzllSkp2SVdieFlVcXZWWkc4MGhYSGQrRWhM?=
 =?utf-8?B?U2tTOUE4TUQ5QWgra2xaUDhMODRrdS9jT3IybTZkT1ZkZEdMcnRLM1RMQXVD?=
 =?utf-8?B?eE9uNDBTc2thUUpzeVJzMkhPczR0c2JsUDgyWXN5aFEvSFh0RmFQZDZtbDU5?=
 =?utf-8?B?ekxWb3ZNOGh1d09OQXRZZVFma1NqZ2JtYUlDVXVDUGpZZjdpbFBUUDhWK0Zw?=
 =?utf-8?B?eVVJRGtFZGV6dWV5SVhwZC92K09HREUwbzFpTzJCQXViUkZBZnhIRk9tRmwx?=
 =?utf-8?B?cksySWNtOTJTakVFSzFGVEpYelR1MWFod2s5dFVNdU5lMEtQUnF1S25IdjlE?=
 =?utf-8?B?cThiVGNZTUF4em9qMjlFS1kzcjY3WTFhMWRUMFYxd3FMVWk0WGY2SWRkTy8y?=
 =?utf-8?B?bURGZjF2Rnl6MU1ZM3VUaTg3WTk0R210QXdXVDhBMmluNk1nd3BaSWJpSHEr?=
 =?utf-8?B?ZjZ0NnpjOUNvanBqMnl5QnN2bmlQSW0vazV1d2NBSDB1RE84bm40MDUzTnNt?=
 =?utf-8?B?RVRFV3d2ZXNHOG4yUk40ciswK0dtRG1zZlBRanBWdzBINDNBcmVJYUs5U3U2?=
 =?utf-8?B?Z3ZJNnhlMlZITkJCZFU3bk9ndm1ndDRkR3Z0cVg5d1BmOUpZZmZCTVlPNEhh?=
 =?utf-8?B?UWw2RWJxcElka3phZDhjNkhLcE5kL0RwazAyZmthSms0QStQWUFYNXc5R1lz?=
 =?utf-8?B?bm85eFQzVUZuZS9TM1FXWExaZ3l6dks3elFwVXVNNURjUWpvNnkwSVdJYlFl?=
 =?utf-8?B?K3d5RXRYQmdyZklwOFl5T3JYK3dTcTZRR1RxNHNldm9xZ3J1TmhielZGN21D?=
 =?utf-8?B?RlhXK3hlTU1nL0VrcktyU3o5UG5sMGdDbWdROWJ5cEdJeERmb29UZmZ5RUJH?=
 =?utf-8?B?b3c0QU9DZjBOMkpwc3ZYa0ZUTmFmc3kwRWF6eXhqN09sazRaQXhEUWJQb016?=
 =?utf-8?B?eHVDMFJxanIrcGlZU1pubU4wemtKQkNnTGxhc1lkcDFLSTltTUE0ZXZjY1Rp?=
 =?utf-8?B?MW5yb0t0RHlvM1F1QlBENDYrS2FzRmREd3VDS2lta1ZJWDNqSCtQS2lzWDh0?=
 =?utf-8?B?aEZsWTlIY0RaMkZ5dG1QM282cUhQbVVhT1FJTlYxN2piamJFUnRBZW9vYVI5?=
 =?utf-8?B?eVdKMWx0OVJhRCsrNGhaM0ZPVzV2N2h4cFk4YVRMakdoc2ZzMHpUMGc0SVRQ?=
 =?utf-8?Q?JN7/UetidudURnXGAnJMoF+iT/5eq8o0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN9PR11MB5482.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWZPYXZ4NmVGRlRhcFlIQnNmR3dSMzNrc2Z0LzNVU2lLTUhobmRKUEkvMWlG?=
 =?utf-8?B?UDVkaTdNVE56TUFHdkxTRUlQcWFrTUhuYTBDVE5PazJMR2duWmRKZ1VEaCsz?=
 =?utf-8?B?UUpHeG1HSDhvK2tBSUs4YytKTVhTUm5YVHhkRCtNdjVYNDV0R1F1ZGM2WGkr?=
 =?utf-8?B?QWJURFQ4RkdjdU0zTCt4clFhUEpsazhXL1RkUFZyNnVVWGlFaWRhMDVjZEds?=
 =?utf-8?B?WVBkY0Q5ZVF2aUY2MnBqQXZ2Q3JDY0ZkaDdkeXdNOUd5U09mWGhFVEVuNTJJ?=
 =?utf-8?B?SU9ocHB3SjdZTjRZUnY5Z09acWVZUzZrNGlidk0wcTdJaSs2dVhCTDFLUlZH?=
 =?utf-8?B?TCswM0dXY3l3V09lbkw4eCtWd0pwaVBsUFAyZUl0alQyaW1adFdmZ1lJaFZq?=
 =?utf-8?B?Z3h1OFd3NGtKTG5iUkJ3Q3hBajdMamI5V3BSdjJtNklVaFVCcEJ3ZkhDdWgw?=
 =?utf-8?B?Q2xvdTJZRWxIa1krOXBDUHFvTllRdVJVUnM5YVZZUGtCTXd5eGlCczE3Tm90?=
 =?utf-8?B?RjZUK1hPeFNHYzR6OGlqb3p2K0pGQTJtcmxvVUlOcDFPV2dIdmZFbzN4SHNs?=
 =?utf-8?B?amUzL3VtNFo4VkU0OHRsSWtCZEp2K2l0NEJwU0VjME91OXFiczVIVmQ4Mmlm?=
 =?utf-8?B?bUYvclRQN0hSRURLSDJNWVZ1dUt0UWZhMDBaS2FCcm1hZFJHSFV4VXJoRmVr?=
 =?utf-8?B?NnpZQ1liZzJoT1huUGY1ZTFaVmx5ejFaQng2bFI3U0lsZlpsVkwxQnlIaDB2?=
 =?utf-8?B?TlJ5SkdKMzBEQk8xLzkwdGZ5U0lHK1U3YXhXSjZvWWhkMUtlK3ZtV3ovRSs3?=
 =?utf-8?B?RmpzdVp0Zmo4WHZwajNoOWU0NjNKQW5aYWNQWGdLUzMwVHUxK2ZrWkxYd0ZD?=
 =?utf-8?B?UVBmYnU5RzFNaDFIbm44V1F2TUYxcnRSSWVxRE1SNk9hS0ZvUkVYWGsrVlNl?=
 =?utf-8?B?MldBOGxkT0dlTTdNRWpLK0s4NHhXa2NhQkVObW53QVBNcVphWXhlYnZLeTRB?=
 =?utf-8?B?OWhIOHJLV09wbjZrMFdjaW5OSDBOUDQ1bkFUeGR1VU5GK1k0dUFNdGIzcWMw?=
 =?utf-8?B?M0p5S2xURDl0SHpibG1iTGptcXZsY0pJcjlZQWJUaStwOXA5OHM4amZCaStw?=
 =?utf-8?B?bWRmRFo4aGtSQ2dqMEp4K2lxTzFXSEZZbjlhNjF5bWhmRStIVFpoVWlXZnVO?=
 =?utf-8?B?RWlqaEZzVHBJclVUanJzTkx5NHNEUHFjY1J0dzF1OEVkS3VOUmpRMU5LZXNr?=
 =?utf-8?B?TmpUWTRibTUrNDhVQWREaG1ZcktUSU90dGFxNVRtZ0Rzaml0NFliNEZCUXlz?=
 =?utf-8?B?ck9Ddkg4dFZ2bkNmZHNIK0ZkK3lvZDZUZWNuZ0xXV3FIcEN4S0xreGRpcWFl?=
 =?utf-8?B?ZExMdkxKdVQwRGRsTXMrZm1kTU5sWVNRdldtVzV5bit1eU9yNjhtdnpDb3pw?=
 =?utf-8?B?RjdNTTFBY1ZjNXlIZnJiQnoya2ZaYjlLdGpoU293YU9RelEremNVZWh6b01C?=
 =?utf-8?B?QVgxREI5QUFidUkwQnM1dUJEdjJaOHRSQnlsZlJmb21sVjcvR2hPMUx5TlZJ?=
 =?utf-8?B?eUJIVEQyeWkxRjA1c3BneThTT3pPdWJlWVJocVJQaWxTN2dKa3B6YmJscFoz?=
 =?utf-8?B?QWt1WXdEZTlSZGI1SkJEY0tjbVJzV1VFT09IOFpzTGF0alFLK2JpRzNqYWVO?=
 =?utf-8?B?NUJjVE5weDFiVStkQk5QcmZ0S0hJanA3SHNSUDhwUjlDekRhRU1VM0p1L3Bn?=
 =?utf-8?B?SHNlUjhLcXFJOTBrQVNTSEk1TEtWQlRRakJ4RlRRRStua2xwYWdkTXQ1Zmpy?=
 =?utf-8?B?elJRK3FXbnpsMU02clZQamVJektEYlRKS0dIT3ZIUXdBeWY0ekVZQW45T0Qr?=
 =?utf-8?B?Qm95bkFJRGZNUUNVbFFOYUs1YXhpditWaGxPTVVWemt6REZOUzFmNW1ENEli?=
 =?utf-8?B?WDJ4N3ZxVHJxZFVlemVZS2lQayttaHF6enY1dENnZUdZQXpIUDNHeGdDQ1hM?=
 =?utf-8?B?QXRuKzJremtMaXRBbzZwd1BVejJvcFpNU2dscVdrb0d5Q3B3QU5keFhxYnps?=
 =?utf-8?B?ck9aNENYUnhhUW5RbjFRVzFkZEcvS3E5T3NTeURKb3FLczBTam5lcjVzRFFj?=
 =?utf-8?B?amJkc2R1bDEyZDBQS3oyMXdyMWVWZW45SWZjOXA0Uk1jdE51NE40THpiOWVn?=
 =?utf-8?B?WHc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 1100bd67-bd2a-4258-e18f-08de0d69f582
X-MS-Exchange-CrossTenant-AuthSource: BN9PR11MB5482.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Oct 2025 10:43:07.7513 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: inXc2hHoF/AoF/GaunU9EG3mItqlnRnbkeHGdEFia2fxdGpJvscITdVzjMnYsoHlj7Kx4+XHOe1gB/j+Ebikow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7115
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

On 10/17/2025 12:27, Michal Wajdeczko wrote:
>
> On 10/16/2025 2:22 PM, Lukasz Laguna wrote:
>> Currently, VRAM provisioning data is only exposed if the device supports
>> LMTT. While it should not be possible to modify VRAM provisioning on
>> platforms without LMTT, it is still useful to be able to read the VRAM
>> provisioning data on all discrete GPU platforms.
>>
>> Expose the VRAM debugfs attributes whenever running on dGFX, adjusting
>> file permissions to read only when LMTT is not available.
>>
>> Fixes: 921ddb37d87c ("drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device")
> all our current DGFX SR-IOV platforms are using LMTT, so IMO there is nothing to fix

OK, we can remove the Fixes tag.

>
>> Signed-off-by: Lukasz Laguna <lukasz.laguna@intel.com>
>> ---
>> v2:
>>   - add extra protection against changing the LMEM provisioning (Piotr)
>> ---
>>   drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c    | 3 ++-
>>   drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c | 9 ++++++---
>>   2 files changed, 8 insertions(+), 4 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> index b2e5c52978e6..c0c0215c0703 100644
>> --- a/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> +++ b/drivers/gpu/drm/xe/xe_gt_sriov_pf_config.c
>> @@ -1548,7 +1548,8 @@ int xe_gt_sriov_pf_config_set_lmem(struct xe_gt *gt, unsigned int vfid, u64 size
>>   {
>>   	int err;
>>   
>> -	xe_gt_assert(gt, xe_device_has_lmtt(gt_to_xe(gt)));
>> +	if (!xe_device_has_lmtt(gt_to_xe(gt)))
>> +		return -EPERM;
>>   
>>   	mutex_lock(xe_gt_sriov_pf_master_mutex(gt));
>>   	if (vfid)
>> diff --git a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>> index c8df18af4d00..6ba2332c77d4 100644
>> --- a/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>> +++ b/drivers/gpu/drm/xe/xe_tile_sriov_pf_debugfs.c
>> @@ -165,14 +165,17 @@ DEFINE_SRIOV_TILE_CONFIG_DEBUGFS_ATTRIBUTE(vram, lmem, u64, "%llu\n");
>>   
>>   static void pf_add_config_attrs(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>>   {
>> +	struct xe_device *xe = tile->xe;
>> +
>>   	xe_tile_assert(tile, tile == extract_tile(dent));
>>   	xe_tile_assert(tile, vfid == extract_vfid(dent));
>>   
>>   	debugfs_create_file_unsafe(vfid ? "ggtt_quota" : "ggtt_spare",
>>   				   0644, dent, dent, &ggtt_fops);
>> -	if (xe_device_has_lmtt(tile->xe))
>> +	if (IS_DGFX(xe))
>>   		debugfs_create_file_unsafe(vfid ? "vram_quota" : "vram_spare",
>> -					   0644, dent, dent, &vram_fops);
>> +					   xe_device_has_lmtt(xe) ? 0644 : 0444,
>> +					   dent, dent, &vram_fops);
> for platforms without LMTT, does it make sense to expose PF's "spare" attribute?

In my opinion yes - if it's exposed we can check the size of the region 
assigned to PF.

>>   }
>>   
>>   static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned int vfid)
>> @@ -188,7 +191,7 @@ static void pf_populate_tile(struct xe_tile *tile, struct dentry *dent, unsigned
>>   		drm_debugfs_create_files(pf_ggtt_info,
>>   					 ARRAY_SIZE(pf_ggtt_info),
>>   					 dent, minor);
>> -		if (xe_device_has_lmtt(xe))
>> +		if (IS_DGFX(xe))
>>   			drm_debugfs_create_files(pf_vram_info,
>>   						 ARRAY_SIZE(pf_vram_info),
>>   						 dent, minor);
