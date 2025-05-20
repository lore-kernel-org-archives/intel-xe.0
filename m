Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D0F2C3ABDD
	for <intel-xe@archiver.kernel.org>; Tue, 20 May 2025 09:46:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D49D710E497;
	Tue, 20 May 2025 09:46:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="LgTJanvE";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F83410E43D
 for <intel-xe@lists.freedesktop.org>; Tue, 20 May 2025 09:46:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1747734381; x=1779270381;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=DffT1NuCHR7dUV0Gp1gVHYqIN5v82L0SAS4EnloVzZ0=;
 b=LgTJanvEaIlC7gOz5MJtLZ+5f0tlKsS99SE4n7ovRRNbK+yftO/EHjQT
 K2LxSsxeEuqMMucat4/u+HfnfQmoGhuAowge5E5vuP67jOrQxRcHCb/7E
 Mm69RZGWFO0+zMQlaT5SjVjcovn8M5+bHAhDa1X7MBhueaLGI72k+7pcW
 B9qoAJjYyR8Bd3WhAz90zgTXra0Mww8/dIahTzq1c3oG7znkfpW3YFACP
 +wyzy3Z+zgjWlh6Tcs9mig2WpmAl6/gwEsHsn5oSbxkqs/5vIlmjBa5F9
 /Ji+kxpy+jYEBPJaGbKhwVad4zwft2y3Ks1mQb3Lvt5yvbIe8yE9bZmFE Q==;
X-CSE-ConnectionGUID: HvFFv7XhT52X7rZtV8Q2gw==
X-CSE-MsgGUID: sIjFPGg5SluEt5lyTfuc0g==
X-IronPort-AV: E=McAfee;i="6700,10204,11438"; a="49759901"
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="49759901"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:46:19 -0700
X-CSE-ConnectionGUID: qKc8XW/oQmuaH+RWP+V7kA==
X-CSE-MsgGUID: qFmaPpqtQuiwJULmHH33gA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,302,1739865600"; d="scan'208";a="140059443"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 20 May 2025 02:46:19 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25; Tue, 20 May 2025 02:46:18 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.25 via Frontend Transport; Tue, 20 May 2025 02:46:18 -0700
Received: from NAM11-CO1-obe.outbound.protection.outlook.com (104.47.56.169)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.55; Tue, 20 May 2025 02:46:18 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FZ5uDYSW+FyZZg8mert7YmStdS0MIMFu4bdTfFZoV8nRsGr98FPI3QyNhpik7TbiZikzAcki60lwM3CwWbHmtDiWF085pKxXFvnS5ZjCmdWSbgmShrIiiBbvJRN7lv/taTkVYRZuq+znHJt1ImY7TjKU2nMBbzK82BKoVarNqw30odWjP6hq7LlGpcHj8IkBUC58z4sebtZ+OM92cXCGG3iRmWQp+Nuz58f4pEOvUjD/Atv+Ox0fFXD3shLybtRpfT80wbjqNPvdgVXzCnzTch36rC5+WlUJcx7u9MagQ2jdQJ20Foqu1DzEUMszXdbARU2MIrPtni0jemN37sgP4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mz18+n2IdtJmPFCO3fvgxnbt9HK7GAXh9qGqzBW1Jzs=;
 b=vNufV89B8jHCv/KUtQPlzt+2Ou53Z2eReDucQfujxFCgHBlfnXf0j6HEEcVMZBzLkHFOsxs7qA99gFIysucBGbg9A6TP3ggvYjpNgbJugmmTHiEenv8qpuHPv0FSARryULHpRO/fMS8rjFzFOF9Q162tGIsXZ0tmGBoNOIstZbiKF28Cmk4nWTjtah5cYbSjE+aUnj2CO9fEONH0cj9bSVwu5pLJZy2kFUvpO12C/IM591xMBrPXtmPBO8BMefOIf+dVEnDKem6fuG4EauEU8Kx60NyzdADfJlMRNHQCeDkcnODi7PGfuTfY4Xh8Rtu2tq8ZggPqt8nH09GCeAlKbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from MW4PR11MB7056.namprd11.prod.outlook.com (2603:10b6:303:21a::12)
 by DM4PR11MB6096.namprd11.prod.outlook.com (2603:10b6:8:af::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Tue, 20 May
 2025 09:46:16 +0000
Received: from MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5]) by MW4PR11MB7056.namprd11.prod.outlook.com
 ([fe80::c4d8:5a0b:cf67:99c5%7]) with mapi id 15.20.8699.022; Tue, 20 May 2025
 09:46:16 +0000
Message-ID: <6f560d6c-dcb3-4f0b-babc-a1d2b803c8ed@intel.com>
Date: Tue, 20 May 2025 15:16:10 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 22/32] drm/xe/svm: Split system allocator vma incase of
 madvise call
To: Matthew Brost <matthew.brost@intel.com>
CC: <intel-xe@lists.freedesktop.org>, <thomas.hellstrom@linux.intel.com>
References: <20250407101719.3350996-1-himal.prasad.ghimiray@intel.com>
 <20250407101719.3350996-23-himal.prasad.ghimiray@intel.com>
 <aCTojH5BA0qM5tFv@lstrano-desk.jf.intel.com>
Content-Language: en-US
From: "Ghimiray, Himal Prasad" <himal.prasad.ghimiray@intel.com>
In-Reply-To: <aCTojH5BA0qM5tFv@lstrano-desk.jf.intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: MA1PR01CA0151.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a00:71::21) To MW4PR11MB7056.namprd11.prod.outlook.com
 (2603:10b6:303:21a::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MW4PR11MB7056:EE_|DM4PR11MB6096:EE_
X-MS-Office365-Filtering-Correlation-Id: 4be5a547-eb3a-4a3e-be4a-08dd97832a14
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WmtEL0FsQmRzQmJ1N2pQOUt3U3RpZnNLeEVRb291aGlFUlhlL1JRc1NQcUZa?=
 =?utf-8?B?Y2RpTnc0OC9hU3UxandrUGpTRnF2ejRKVy9aRjVLSXg2WlZmYWFaZWc1eHEy?=
 =?utf-8?B?UThzdnFzWXNkdy94MXFFandjR0dQYWRick9oYmdnYnNFc0JJVWpUQTRmY28w?=
 =?utf-8?B?OVhkdmNZUWl4Q2RkSDF3NXdTTjhLbW9Sbllrc3pVMExWOFVWZDRTTzFzMS9q?=
 =?utf-8?B?ajR0UXA3V0llc1NUV3g5cnVKOXBCSzlnSERVbDdWZkxkeEdRMUFYQ1dtVlZE?=
 =?utf-8?B?cmkrQkF2emVKY2R3WUpqOXoxNDk5SXFBSVJJbGRSamRBWlQ4Qi9NNTVjbmEr?=
 =?utf-8?B?V3Z6bzZCekw0Y1pkU0owbXVXM1habG13Zi9NN1ZRN096RXY3bzN5VjVnNDNM?=
 =?utf-8?B?c2pHK0xaRDQxdjkyV1FZdnd6VDIybkVveVBZK2ZYeWw4ZmRIbVFrTSs2SUlp?=
 =?utf-8?B?ZUFVQmltWVgrc2dJQWVwZXpsaW9ueEZueGJtTitVQklOK2VGMzU1Tyt4alpD?=
 =?utf-8?B?ejRqWDVFRUtsamFYdUJXcFQyN1FNVGhWR1NrcTIwUGo1OFlNY3Z4aU9MNDRr?=
 =?utf-8?B?VUwzdnFCeXB5RjBEaDA5WTExNjJPK0w5V3doKytmNEJmaDJobllMdnlRZ25R?=
 =?utf-8?B?VFNJRXltdXBwVXRsdzJIeklBQ2tTTi9wOVpHNEpZdEQwRGRvOXRpMnJMK0dl?=
 =?utf-8?B?dElxbnUyWHQxNzZkNkEybE0wc3ErNUdtNllsWnU0M2JXeVJjejM3Z3Rwc0h0?=
 =?utf-8?B?cEFESS9WTkhzdjJTWlBlM1hvemtYM0hmODI0czc4SlFscURZNUtSZldGUytx?=
 =?utf-8?B?NGtLb2VpWUVxMkoxcjAwL04rRUdzb1hySXl1dGVaTmlwaDRYbHJwUXJEdzhC?=
 =?utf-8?B?aUZHai9HZDZSVnFyZERaNG5DWHZ6bzcwdGM5bjR3ZUZSa2d4U05HL09LTDY2?=
 =?utf-8?B?S1h5VEpsMEpSTG1BRWs1SzJTRENyWTZCYm5nd0IvOE1aQ2I5amZIeGk5OVcr?=
 =?utf-8?B?ZFJONTh4ZVJQcmRJYllOR2hBd0VJaHRSeHBXKzVrK1BUL2lPc0FLemF0bzVh?=
 =?utf-8?B?MXFIajdTYnhGWEZSMkMxTW5uVVN3TzRUVWs4L09sbnlRMTNNSlA1TDhpVFNn?=
 =?utf-8?B?cTlQcjk4MTV1ZHRaTWRtU0hheE9wOW1qMHlhUHNYY0wwY3pQOS83bkFNRW9I?=
 =?utf-8?B?b3JWcGdpeEUwdDFQZlNZK0FKRlNsZnQvR0F3MGF6ZEh1RklJNTRGNnhIcVhM?=
 =?utf-8?B?VmJlSVJoN0k0MzBMdGJ4cHl1dWpGSXNWbFhuOEJoUDQzVEh6QTVaN0xrLysv?=
 =?utf-8?B?bDhoL2ZMWmtEZXBueThzSk85djVpaHhLdk1wRVFtQ0NJc04zOEVNR25QR0Iw?=
 =?utf-8?B?cXdZQUxHSWJHajBpK2UxY2tKV1BhUGdtbE96Yk4yWDRadEtYWDR0VlpJYjMv?=
 =?utf-8?B?YjBLQXhQYkVUbzJGS0JUWFYxWlVnMFFHV2xObXlYUGUrR1NadU83T010clE0?=
 =?utf-8?B?b2pVWU53cDVKZTMzckR2T2R4TkJVcmFDNGxEK1h3VWFzRDdma2RHR1dnNmFq?=
 =?utf-8?B?ZnhNclYvUGZWZGhUbDBZVFFOMTN5Q1I3UG9iUFNEdWFxeEVtekhaQU44SFho?=
 =?utf-8?B?U2ZXaHVGUmJVUGx6NStIVThoYU5tazJpWHhlUGRNMytMSFIrL245V2l4OEMx?=
 =?utf-8?B?YS9PNVZwVmFzcDdmN0V6bUo2MkF3cjV0bkM4L0dCQ2xoYTZldklPY0RxdC9q?=
 =?utf-8?B?aXhuRmdaT1lnREVnWlVrbWMzOGk3a28rWXdvWHEzcko5MzdCdWhid2Y5K2tW?=
 =?utf-8?B?bGlqbWlSdktHYU5NNkliVVVEMlhGU0lWaE9YNU56NHRRNkJwc0w0TEpxU1lP?=
 =?utf-8?B?RnlvQndMOU9HbzJ6cjk4elpNdGJST2dSTnRRWnlQM2x4VXR2czE2UWRxcklQ?=
 =?utf-8?Q?cJH8EQBROKU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW4PR11MB7056.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YUxqV09zdG9MNXRHODFUdVRySGZRSXYwd0ZCeVdqSlExUHMwMHhPRm04TWFR?=
 =?utf-8?B?NTFCUm44RFZQRUtVUjJFUjAvd1RVSTJKbGZhSUJLRGo5NGJpUTcwbnMxeVVS?=
 =?utf-8?B?QWQrOWdBaTQrelY1UEw5RHYyOWhrY1hycXF5aXZDYk9mM3oxQTZxT0pKR2Jn?=
 =?utf-8?B?TW9wdFdIVFl2NjJqcnBVWjNSam9HZXFNYWg5TVMrUHE3YzMxaVREV0xML3Jx?=
 =?utf-8?B?ckE5eTZJZXpDYnFJa0VjQzAzaVFoUzY3Z1d4MWJ0elBkMmFna0dlTUNQa0Mr?=
 =?utf-8?B?cTZaYktmOUZBRUNKOGNYSEZiZGVXQlM4L0VQb3VmejR3YzVsUEZQZ3Q5K2lG?=
 =?utf-8?B?L0lSQ2JxNGVJUGNZbGsvTG91d0FDa2lFQXZKdFVGYWZtTkxQSWEzTm5OV2tD?=
 =?utf-8?B?cVBLSGZjaUcwa0Fkc3NHN1pYNjZMTnppcHcrTHJjRGJQeHp1MGU1OFBYUWpY?=
 =?utf-8?B?VzY4YlZTNFhwT3o2U0dxanF2YnFDR3NvdUREa3dBbGFlbzZjNE8zWGxGWlM0?=
 =?utf-8?B?RlJkU0hrLzR5MnA3UGVBVlMzblZ6OGhGQzRSMWtwMTVrdXRPc0t0VE5iRWxt?=
 =?utf-8?B?V25oK2pZOW1vV0NiaDVyR3g3Q01oRW5ocnNHZ3RUbEU1dWlEUmp4QkVEeWxk?=
 =?utf-8?B?NDJtSHova3BKQTFJbUlyMThMaGp0MkZQSTNvclVaWGdxc3ZEZGVJQjI0SENO?=
 =?utf-8?B?VjkyaUJSVTZQVk85dmlpcW5ZYkxGRHNNOTFrdTNzd01iMlVmaEhhdkk4L3V0?=
 =?utf-8?B?YTVOWXd0QzFoSHVFTUNzem5KTGFKaHRCdCt4K2VxcVo3eFBBSEU5UlI4eFFy?=
 =?utf-8?B?OHZFb0U5Y1diRmk5R1lQZHFYaHpSY2FpN2dneURiMkp2WlRWakdvK1NUU0sx?=
 =?utf-8?B?eE9WUHltNXhzemIvdmdlYkxZZUdYTm5HSkk2UnpubzAvZFhEaXJpc25YeGN6?=
 =?utf-8?B?dlJzY1JXYzlJemNsY3M2bTdURUMwbGFmVmRrM0ZzSk1XVzN4TUlkVjBmNUdy?=
 =?utf-8?B?Q0NkT1BBSnJxeTFEc0xZbHZDelZxRzBoZVNXeDZuR0RxdjRJenlhVjdYRjh2?=
 =?utf-8?B?cm1RQm02NjdOSUJxL2crd1lOU0RueWw0NkNNQmU5M05XK2pleStjQ3hLcVll?=
 =?utf-8?B?THYvNmZYUDgxcXpuaTc0OXBiaUtEV0xLRGF1dmtNMnNKb2xtR252QVlSVWxi?=
 =?utf-8?B?dy9qZFU4VThwczh2TGtEY1A1a2tMRitvcTAxNmlrZnFadGszQTFDNHpFVkNz?=
 =?utf-8?B?VkZyamhiaTBPYTFGd1k0MGJVdlBPbW1ZQTJMTDU4MURRMFhMRmtmWUdyU25Q?=
 =?utf-8?B?WHJTRWp5TzBPV1l5Q3p6TENsQUxZc0FjVG1ZYTd6ZnF4YktnRGIybGxLRFZo?=
 =?utf-8?B?VXJNZVVaK3ZQVXBOZE1IMjFHSjZsN1RwREc1UkdyeWJDYTRJSGhSVURKdlVV?=
 =?utf-8?B?SGVXcTJzRlR2U0NENmM0Y1hyOGpKeTJwcW5zU3RUSHVmRHQ2V0NRMVJTWGZz?=
 =?utf-8?B?VFhWekQ1L3FaZmxuSFd0TDRuTFR3cEhwTVRwQldVTnE5NkRzTTJtUGRFR3Na?=
 =?utf-8?B?azNjUXJQSmVNaE1kbUNkS3hkQkZnb0Jyc2txTXRBSExmRjRIa2EvRUxXSEZL?=
 =?utf-8?B?dzlKUTNlL0R2OUJZRjlzbHFob0tMWm9jbXpIQjU3M2loY0M3NFFWQXNwZk02?=
 =?utf-8?B?ZEt1MWkrNGxJYWJZWEZhRTE0NTZiOUxPMGIxMFY3ZDV5T0Jjc0tXUzQxL0dX?=
 =?utf-8?B?Y3ZMK0FFTXFZY0RGNXBIVFdXRjQwMndMZ0RaUUxiOWpHMEVvK1htZUVGT1o1?=
 =?utf-8?B?UjdCWnJwODV6blVmb3Z6eXlFSExLdUsvUlFHdVVJRXNvc2tvVmhGeVAwZG5X?=
 =?utf-8?B?MHU5OW8zcDM5bGwrMXRLQmIzdnM5SlNkNG1mUmdUem9MaWNmRTlKUGhHWmZT?=
 =?utf-8?B?M0RhTWNRU0dNSVBpaVVjaDUySHNtS1V5OHZ6Nkp4WUpFYUJ2emdLVFV3Lzd1?=
 =?utf-8?B?ZzdZdHJwMGxqRVdiUFY0MGY4VUFCbFI2ZW1ya1RQWDRkemU1djkyQVVXK0NJ?=
 =?utf-8?B?YnU5cGZETWNKMkZId1ZOWVQ2RW5sVUFPM3pTdXMwbncrb2VXaHZwMGJ4TjJt?=
 =?utf-8?B?T256OW9qYm90NVk4Y0c3cVlucS9Sc3FUNXIwS05RaThGV3k4cTNYQlZEVzdz?=
 =?utf-8?Q?HJ+7mI81y3hXNO2yb9mJgIo=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 4be5a547-eb3a-4a3e-be4a-08dd97832a14
X-MS-Exchange-CrossTenant-AuthSource: MW4PR11MB7056.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 May 2025 09:46:16.1965 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: O2cq1Asv86y9l6tecNLFLPJFEEb1zTuEeb0hyf0wEHlQsvqZfZ1pQ7Cjd887BruPRSHDoyjNFlmrnYtPuv8O1LvShXxQkg/WCJ8nGjCKPfg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR11MB6096
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



On 15-05-2025 00:31, Matthew Brost wrote:
> On Mon, Apr 07, 2025 at 03:47:09PM +0530, Himal Prasad Ghimiray wrote:
>> If the start or end of input address range lies within system allocator
>> vma split the vma to create new vma's as per input range.
>>
>> Signed-off-by: Himal Prasad Ghimiray <himal.prasad.ghimiray@intel.com>
>> ---
>>   drivers/gpu/drm/xe/xe_vm.c | 84 ++++++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_vm.h |  2 +
>>   2 files changed, 86 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
>> index 6e5ba58d475e..c7c012afe9eb 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.c
>> +++ b/drivers/gpu/drm/xe/xe_vm.c
>> @@ -4127,3 +4127,87 @@ void xe_vm_snapshot_free(struct xe_vm_snapshot *snap)
>>   	}
>>   	kvfree(snap);
>>   }
>> +
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t start, uint64_t range)
>> +{
>> +	struct xe_vma_ops vops;
>> +	struct drm_gpuva_ops *ops = NULL;
>> +	struct drm_gpuva_op *__op;
>> +	bool is_cpu_addr_mirror = false;
>> +	int err;
>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE IN: addr=0x%016llx, size=0x%016llx", start, range);
>> +
> 
> lockdep assert for vm->lock, I assume we should have it in write mode
> here.

Noted

> 
>> +	if (start & ~PAGE_MASK)
>> +		start = ALIGN_DOWN(start, SZ_4K);
>> +
>> +	if (range & ~PAGE_MASK)
>> +		range = ALIGN(range, SZ_4K);
> 
> We discussed this - not needed as UMD should align to GPU page size.
> 
> BTW - mismatch of PAGE_MASK, SZ_4K - they mean different things as
> PAGE_SIZE depends CPU arch. We do this all over the driver but let's not
> make this worse.
> 

Sure

>> +
>> +	vm_dbg(&vm->xe->drm, "MADVISE_OPS_CREATE: addr=0x%016llx, size=0x%016llx", start, range);
>> +	ops = drm_gpuvm_sm_map_ops_create(&vm->gpuvm, start, range,
>> +					  DRM_GPUVM_SKIP_GEM_OBJ_VA_SPLIT_MADVISE,
>> +					  NULL, start);
>> +	if (IS_ERR(ops)) {
>> +		err = PTR_ERR(ops);
>> +		goto unwind_ops;
> 
> You don't need to unwind here, you can just return.

true

> 
>> +	}
>> +
>> +	if (list_empty(&ops->list)) {
>> +		err = 0;
>> +		goto free_ops;
>> +	}
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +
>> +		if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			if (xe_vma_is_cpu_addr_mirror(gpuva_to_vma(op->base.remap.unmap->va)))
>> +				is_cpu_addr_mirror = true;
>> +			else
>> +				is_cpu_addr_mirror = false;
>> +		}
>> +
>> +		if (__op->op == DRM_GPUVA_OP_MAP)
>> +			op->map.is_cpu_addr_mirror = is_cpu_addr_mirror;
>> +
> 
> I think this is right, but it took a minute to remember why this code is
> needed. I think we need a comment here on is_cpu_addr_mirror usage.

Sure

> 
>> +		print_op(vm->xe, __op);
>> +	}
>> +
>> +	xe_vma_ops_init(&vops, vm, NULL, NULL, 0);
>> +	err = vm_bind_ioctl_ops_parse(vm, ops, &vops);
>> +	if (err)
>> +		goto unwind_ops;
>> +
>> +	xe_vm_lock(vm, false);
>> +
>> +	drm_gpuva_for_each_op(__op, ops) {
>> +		struct xe_vma_op *op = gpuva_op_to_vma_op(__op);
>> +		struct xe_vma *vma;
>> +		struct xe_vma_mem_attr temp_attr;
>> +
>> +		if (__op->op == DRM_GPUVA_OP_UNMAP) {
>> +			/* There should be no unmap */
>> +			xe_assert(vm->xe, true);
> 
> xe_assert(vm->xe, true) will pop. How about...
> 
> XE_WARN_ON("UNEXPECTED UNMAP");

Ok

> 
>> +			xe_vma_destroy(gpuva_to_vma(op->base.unmap.va), NULL);
>> +		} else if (__op->op == DRM_GPUVA_OP_REMAP) {
>> +			vma = gpuva_to_vma(op->base.remap.unmap->va);
>> +			cp_mem_attr(&temp_attr, &vma->attr);
> 
> See my comments about cp_mem_attr in a prior patch.

Yup

> 
>> +			xe_vma_destroy(gpuva_to_vma(op->base.remap.unmap->va), NULL);
>> +		} else if (__op->op == DRM_GPUVA_OP_MAP) {
>> +			vma = op->map.vma;
>> +			cp_mem_attr(&vma->attr, &temp_attr);
>> +		}
> 
> Also perhaps ref the comment above of why copying the attributes is
> needed.

Sure

> 
> Matt
> 
>> +	}
>> +
>> +	xe_vm_unlock(vm);
>> +	drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return 0;
>> +
>> +unwind_ops:
>> +	vm_bind_ioctl_ops_unwind(vm, &ops, 1);
>> +free_ops:
>> +	if (ops)
>> +		drm_gpuva_ops_free(&vm->gpuvm, ops);
>> +	return err;
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_vm.h b/drivers/gpu/drm/xe/xe_vm.h
>> index 99e164852f63..4e45230b7205 100644
>> --- a/drivers/gpu/drm/xe/xe_vm.h
>> +++ b/drivers/gpu/drm/xe/xe_vm.h
>> @@ -171,6 +171,8 @@ static inline bool xe_vma_is_userptr(struct xe_vma *vma)
>>   
>>   struct xe_vma *xe_vm_find_vma_by_addr(struct xe_vm *vm, u64 page_addr);
>>   
>> +int xe_vm_alloc_madvise_vma(struct xe_vm *vm, uint64_t addr, uint64_t size);
>> +
>>   /**
>>    * to_userptr_vma() - Return a pointer to an embedding userptr vma
>>    * @vma: Pointer to the embedded struct xe_vma
>> -- 
>> 2.34.1
>>

