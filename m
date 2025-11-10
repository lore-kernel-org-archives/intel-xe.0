Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4006CCF9E3
	for <intel-xe@archiver.kernel.org>; Mon, 10 Nov 2025 23:33:19 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A4D3E10E0FE;
	Mon, 10 Nov 2025 23:33:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="DbVuaaVx";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED53010E0FE
 for <intel-xe@lists.freedesktop.org>; Mon, 10 Nov 2025 23:33:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1762817599; x=1794353599;
 h=from:to:subject:date:message-id:references:in-reply-to:
 content-id:content-transfer-encoding:mime-version;
 bh=YkoxAzL2zsycwZ4exwfr4rpVPy+ZhMAqILNw7AynzPg=;
 b=DbVuaaVxh6MNsuJfDEt7mTWOzkloLzGiIeA0ttiqN+jYM/Hp9E7gHIlW
 UohDTnicQukDZCQxpuJ3zagjTnWLJyhA+5SNuddwvXbw2TgQHed+UWP/h
 vG2eG7deN6AI7tGz6lgIpsbtdx6tLackjroUHRqpjhvS4M4c1OcbCR5t4
 0KZ5Qh4ZYGCXtl2uFLykU5r3jV3wdArBfJUtkAxL/SVBknGq7LJGsJkQ9
 SpyA8wa24DnU2ze210DX3wreyFJOXMP1jcfm1Nx4aclfL5TX4zxb4YdxU
 G69YRFpX69jNWa74tCI3/MZr+TGrm4oJYcp3lyDVcy9AjEYjb1Wk4sMpH A==;
X-CSE-ConnectionGUID: td88YxgKRNOV6Wu6DVGf4g==
X-CSE-MsgGUID: UivWgPTDQxSM1rlQDBfF1w==
X-IronPort-AV: E=McAfee;i="6800,10657,11609"; a="82502070"
X-IronPort-AV: E=Sophos;i="6.19,295,1754982000"; d="scan'208";a="82502070"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
 by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:33:18 -0800
X-CSE-ConnectionGUID: Oh52ANGnTvq3A4eb7Yg+Rg==
X-CSE-MsgGUID: iyo+2nTWSDua9mN95oVPDA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,294,1754982000"; d="scan'208";a="193806023"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa004.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 10 Nov 2025 15:33:18 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 15:33:17 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27 via Frontend Transport; Mon, 10 Nov 2025 15:33:17 -0800
Received: from SA9PR02CU001.outbound.protection.outlook.com (40.93.196.48) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.27; Mon, 10 Nov 2025 15:33:16 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=vr6Or2ajNVXqCun5sX3RIMcddGjF9fev3EvI4T5UdVeK1LxQmpk8flKhiWGeh2ZxG7SpiEodngDYgJf+Si7I2uyCPsiZuElomJzojjZAsQHIMYhx0FNjKf4skMPUAJ0hvtWB7SlnwUURP4CAt7Ja+czj4ivad+6Kvp76RrGLB2HOTRUmXPR+DFfP/Q/KlHw+T4CwSv1YJcbhdN+PF3eD2FbWPE2PJI7XoIpaHCHKoE5orV041Xb4WVM7CwSbhyzVx7Wjvrbt2msMRtcapjDd3w3db8pQxCoQ5YIYg7TTZxijSHKuOF4M1xk1P79sdtq7yF5MLGXGcS3hjeV8Qp/DFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YkoxAzL2zsycwZ4exwfr4rpVPy+ZhMAqILNw7AynzPg=;
 b=iUjwsYJ1MNR5wvEDocUDPKFyoK8ETzFTP0GJkN9Hk6OOLLH0hlVcO4UIIcFF0idCvuBQP5r9YmqaM2Vkb7h6yRZ7sKnghYpCeMcTGQ+FoDs62m4HoKQbmqxo//Zjvorelv0YR4zMLJcEehcZzbgIBuP88JY0WZt6NbE04yabIv+ETb7TtrKdiJM3l2cDqZ5WrzYDzus83qP+3JqiRypmOLjxIYykCY6WkqoxhxE9QM5oNIDh7yriPJ5JUMxqc7UpyoF+8lPebDtvntHH0jaWdDVC7nb5cgnvKgf6/Eirs1WR5DEfwAEaHyqRtuDmIiUBFwgmpLiS3+7tXg/UwHugIg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Received: from DM8PR11MB5573.namprd11.prod.outlook.com (2603:10b6:8:3b::7) by
 PH7PR11MB8251.namprd11.prod.outlook.com (2603:10b6:510:1a9::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9298.16; Mon, 10 Nov 2025 23:33:14 +0000
Received: from DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b]) by DM8PR11MB5573.namprd11.prod.outlook.com
 ([fe80::3f64:5280:3eb4:775b%5]) with mapi id 15.20.9298.015; Mon, 10 Nov 2025
 23:33:14 +0000
From: "Summers, Stuart" <stuart.summers@intel.com>
To: "intel-xe@lists.freedesktop.org" <intel-xe@lists.freedesktop.org>, "Roper, 
 Matthew D" <matthew.d.roper@intel.com>
Subject: Re: [PATCH 01/33] drm/xe/forcewake: Improve kerneldoc
Thread-Topic: [PATCH 01/33] drm/xe/forcewake: Improve kerneldoc
Thread-Index: AQHcUBJGtHNOk828+Eucg7Cgfy3IzbTslJ0A
Date: Mon, 10 Nov 2025 23:33:14 +0000
Message-ID: <e989e18a66bba20c7540d1a1b2eae8b5999606c8.camel@intel.com>
References: <20251107181315.631642-35-matthew.d.roper@intel.com>
 <20251107181315.631642-36-matthew.d.roper@intel.com>
In-Reply-To: <20251107181315.631642-36-matthew.d.roper@intel.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM8PR11MB5573:EE_|PH7PR11MB8251:EE_
x-ms-office365-filtering-correlation-id: 441b3f53-3f07-4006-3cc2-08de20b18501
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?b2c5alFHbGF1bkZ4eGQ5eDhwUVdJVkI4VXFZS3ArdWlZMzZQeHZiK1Z2T3Vl?=
 =?utf-8?B?QitkVlJlNHVlU1dzSDQvRWhBTVdCUFpqTU5QVzNqUDdEcVlJZkhPUi84ajhP?=
 =?utf-8?B?b1BPTjA0aEZXb3ZwczU2Ukk4VWQzYXNXMzBZYVVQU1pJdXJLRHZlNjVySHJh?=
 =?utf-8?B?eFdKck1kdnJRN2ZkTGhKRlRoNDRsWElJTGtRcXN1WGJwRHJWMWlRTDdsWm13?=
 =?utf-8?B?am1vekdkMnNlUHp5bXZ3UjVuakpQZVpZTjhVWHpTWUF1Z0c2RWl5bHgvQkcz?=
 =?utf-8?B?ZG1TL1RWYVdNU0s4cFhYR1o3MFRPc2VUSERRWGRZRGx6cTJVVXBDNzl0d1Jz?=
 =?utf-8?B?TGxuWExJeUxWSDdYREYvUGRONFpzUGY2bkNJeEFLcUJGU0lRTys4RStIcU9i?=
 =?utf-8?B?SEUzSXJEZ3hpQlhaYy9sbzF0RVY2QkxFNElkWGNHTWVvaDhRZmZGMzRsREJL?=
 =?utf-8?B?YldHK0w0TGZ6Wm9lbzFUQ1Q1TnpBY3NKNm1aTytmV1JxZlY2WDFIZitWZGN3?=
 =?utf-8?B?VzN4OVJnWWxnR1NVVDV0NnJOTDdzaTc3RXczZkRMcjVBQVZkcldHNnU2Sm5X?=
 =?utf-8?B?VmF5blpqYlFUOUhOSTlOQkNGbENNcVNRakhnZk9xTG41SFE0K3ZJQmthbjZT?=
 =?utf-8?B?RTVSZm1lcDFEWGhLeGt4TlgxN013Y3RRbURMZzVhcmVhN0J4OVNDNHFWYUdv?=
 =?utf-8?B?b0ljWERLMElCd2xJYWNwYTFCOUdmT3QxSXNiaU9UOUROREhMVktVOGt5am41?=
 =?utf-8?B?dkZwaDJBRE1Pd2w2ZmorT0R6MlV3RFNHZ0tna0NGRCs1eXVSVEgwNlkvc3NT?=
 =?utf-8?B?MG9nQkZ2ZlZEbTdvV2ExS2ljTXU2RkZiYjdpenhXUlJobit0eGdtZlVLaTht?=
 =?utf-8?B?MmlLSndNdGgzRU1CWE5qdWVDL1YrN1RMRGZ6djhCVGtseDR3TVlyRVNUalZB?=
 =?utf-8?B?eU1JZGIzbm13aVdMYVEzN04wQ1lQcDlNVTIzUXA4eWluSjJ1Y2VobTNKbXlD?=
 =?utf-8?B?YVEwUFk0UGVsVEh4VXllS3NtUE1WdVlYTnNKeXU1QU5LMjlweVNxYmNwT2ZI?=
 =?utf-8?B?S0RObk5oMlRmRFhRS2wxd3IxUjNOTnQ2aCt5WHdrK2Z2OWJBcy9HUWVSZEYw?=
 =?utf-8?B?MmtXT1R6bFdISGpkUVdUWnpuVFdtVVNqRDNnZ1RSZGdBOXUwVnBHVHd3ZUh3?=
 =?utf-8?B?VGtDekMvZjJLSXJpY01nVzlTYTN2S3VZelhiRE1YOXF3ZkNXR2U5TGlDOXpH?=
 =?utf-8?B?REx2RFU3am5ld2d3cDc1QUR2NUVmdm5ZZGltSU0vTUo1alBLVEJFWkNVa1RX?=
 =?utf-8?B?ZFdtQkl1RjVEODE0WUFvQ240b3JvRHhVdWpGNGFtc2Y5SmZpVHJheTZlRjh1?=
 =?utf-8?B?OHlvWk9ldnNpYUdUTVQ2bDFMVlpveU55NUpuM2FKb1BJZURxR2pYK3FBWXFt?=
 =?utf-8?B?d2dPZ3NlTDFMV3ZONWhnSU1mYU5vOXpDdllRb0o0THczWXIrNEVXWlZZeVIw?=
 =?utf-8?B?MkI4S09DQ0xhS09BTnFWTkRaaVZFR3JvZnpmSmNtOHl0YmxmK05Qd1RLNSsw?=
 =?utf-8?B?Nlg2dW9EL2U3T01EcGxTSlI3dHczZ1ZaR2pMTnQ2b3BxQ3N3RzRmZDNQMkRD?=
 =?utf-8?B?SWoxNUFJSlFBVnZhNzJZV0t3UkpYRHlJeDNyam5uQllIMkNRVFY4UVltU3VW?=
 =?utf-8?B?a1ZZS3JYanhhblB2cHdoNVNXdlE3VzUvTWxXanJ1TUNob0FPc3NvT1M2NTYv?=
 =?utf-8?B?VWd0TXMrREgzdHo2OWI1UXcrNW1VUHhoUjJWcFUwU29IUVRJSUV2QWIwVVI5?=
 =?utf-8?B?bkxVMU50THM3VFlGMTk0OU82QUhrS0pZV3NpVkRRdVB3QmZBK0hoU3M5UUhv?=
 =?utf-8?B?b1ZLZ0ErSExFdlh5dGpRUzY1S1hua3lTN1JYYzVrNitqeWRpYWlCSDZockhB?=
 =?utf-8?B?QllEZENJRVBtWVN2ZmVhckVKdTBtenZHSkNYWjNwSmt3eWh1amk4THZtWWxq?=
 =?utf-8?B?ZWVEcHpsVHpLTXhrZ0VuMHhOSXpqYVRiS2Q3dXA4UkMzMFJMT2JybHpuRlA5?=
 =?utf-8?Q?5stXu4?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5573.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TWJNUUh3S3NNTTdrTkFrYVhxUThZK3h1QVBNUThZVFlXS2oySlRPckt4bzR5?=
 =?utf-8?B?WnFBUFdqYnAwTTUya2t3b3d2aTd6ZlBsVUU5Nm5iZ1NYZFg1R0xoQm4wRGJS?=
 =?utf-8?B?L28ySm5JdmIzMENmdzBGK3c3ZXBRd2pIWEFINktUS3o3Z0FwdjlUSkd6RHVW?=
 =?utf-8?B?QWNRdjAvc0NFeDFzN21TSmxTaGhTV0h1cHNyMWtIWlR0SkcrYmVBOENrVFZx?=
 =?utf-8?B?eTQza1ZvaFRHdUtNYlVIcmJwa1c2TzcwS2JQVHZONDNLVm5Ha2crQmZjRXZH?=
 =?utf-8?B?dENFeTl5TFh5SnJzTWtuWS9OUVdRRTNVd3R5aXJiQjBHcHhYZGxFVENrVitl?=
 =?utf-8?B?WGk3UE9NYUJ0eUxYcEpCdUdOV0c1bjFXZk5uRnhSMlVkaDNXVEx5UWhmYlJO?=
 =?utf-8?B?cjlKZElIYkw1aHFrdGlmdWN1QWo0Znp1dktmUWZkNzFBMFhqQTlHVG9JZnIw?=
 =?utf-8?B?YVZNc3dobyt1OU1qQUpyTlY3d3ZCZklHSzVrNWdjdGRnK2QxWlZjNStWT1BO?=
 =?utf-8?B?RnB3NmlwRXR3TDN1ck5SR3R2UGlTM085aE9UMXhFZlZ3NzRRQ2lwbFZ4YzU0?=
 =?utf-8?B?WVZMdWp0aFRGb2k1ZjdKenQwZTBWMlRiN3lBMm03WXVrU2MrTlpMT2ppallx?=
 =?utf-8?B?d0U2RkNDNTY2WXNjcjZURjBaNk1BbGFkclRheU1QL0ZJd29lOWdxcG9qWmZM?=
 =?utf-8?B?MllPczc5aTFEVmdRcEZMcGxzZXhiRm1xdTFWU2NIcStyWEc3eE9DWmk3YWVP?=
 =?utf-8?B?ZUJoVmpwWjR1eVJaUG5MajRQNFhQVFdjYmtwb0dQUHkrZnlJTUllWkpJVDJh?=
 =?utf-8?B?Q2UrSVRmMmd1YkxWNXNQN0dSdmczaXJjTnlKZ0VhYWhoeldaTG9NMmxRMEdl?=
 =?utf-8?B?d2RtQnVHWVRGSys1aVN3T05vWER1VkFDUTIzT2F2dzZiM3dCVkMwVktKN1U1?=
 =?utf-8?B?MnNLZFdQTXRPZE92QWJ0eHdMdkxGRDlUa3h2TkM1L1UzckxSUHJDSVZ4SzB3?=
 =?utf-8?B?a25nTUsrMDFaeHFxZSs4NXNIajFWTDJwTUM3UFp2TFZ0SEx6QXpzQ1FaenpE?=
 =?utf-8?B?WjJWU3hZWUF4QkIwa0tFVThUbVlyNnEvNHdMK1NpdzJFMDdYUWMwamVJSWJG?=
 =?utf-8?B?YlVlTUFtUjBXY0NHdjBmQ1ZnNWYyZGR2NVk2UW14Y2gxVHVKcVF0NVB1SThi?=
 =?utf-8?B?QkluTnVFYVVXRU9UYWU3VUdnNGd0S3pBcUpqVit0WUxEcG5VSzR1STV0c2FS?=
 =?utf-8?B?QkRxZXNwcEZPUkFrTnZwZm51UzQ4VEMrcXBRNVpLRkJxREMyKzJJT2NXaGsx?=
 =?utf-8?B?UkxTaDZaNHp2dW0ya2FiRDIxdkZ4d3NCTDlncUp2YUFVZ3JJTzcrZTdaRHNM?=
 =?utf-8?B?cW55RGo5dHVxa2pLeXFBN2hlOE0ydzl0NjBjNGU2dW4xQlJERFNkOEJYSVA0?=
 =?utf-8?B?WHFHR0V1bUlndkxEZ3ZiWHVhR2VuOXQwT3I4T3ZHenVsSFlheEVUSjFrMzlz?=
 =?utf-8?B?U09aUkFqcHFCQzdpaDhHbzBPcGREa3ltRktMd2pNM0lyTGNjVnd3WHpCUEZk?=
 =?utf-8?B?MitvekVCYkFLbUVJMW1jRS85eTAzcjFYUWlxalJQKytrYVNYWUZXc2U1Y3FS?=
 =?utf-8?B?blRhaS9zaS9qYlR2eFltOUhYU3ZuL2w4ZUNoa1Eray9oSWJDVHM1V0xMZGRi?=
 =?utf-8?B?WjFVNG9MN0N6cGNsNmszTFRReTZBNkVwcWZodDFlc1NObkFqNXFPVjFZTkd3?=
 =?utf-8?B?RjVNYm0ramRmMGJTZ3p4Y1pjdUpDSWxqTkJ1dUF1UVdDTkwyMjRNdW9vTmsy?=
 =?utf-8?B?VFQ4c1pRbzkvQmlRdkZnN3AyT1o3YnJqeEtGNjY5OVZHekFlTEFMMVVzbGZX?=
 =?utf-8?B?eERVNHdFSjE4NStEK1p4ajhaSytvUVJGUE1xR2FueU9MNHNlRk94YzlPSklj?=
 =?utf-8?B?aC9CSDdXcmZyYm1QOEFheWp0dGdZazY3OTg3Vm5KT2RhYlp1dC85UkVzTkYy?=
 =?utf-8?B?RVRPcVYycXpIcDFaNW40YlZYMTdMR3hoQ2QxT2YreHhvNGxaSTREK3JIUGFD?=
 =?utf-8?B?ZkJQclNWTFVWcS93WHF1R1JRRFhrUldTRkMwVGhEa0dna0FCb3VqVFV6OHhj?=
 =?utf-8?B?QmtZS3pVSUJUQzBUbGlHZWNPZGl5ckFDY0ZMYUlkQmRVa3hMMDg1S0JZeExJ?=
 =?utf-8?B?K3c9PQ==?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <BAB0194A72E1E947A5887AC85277AAE6@namprd11.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5573.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 441b3f53-3f07-4006-3cc2-08de20b18501
X-MS-Exchange-CrossTenant-originalarrivaltime: 10 Nov 2025 23:33:14.5394 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: E+h0WH3JyFgKv8775N+QXsoi9MvYQ44KKVgP6c7CS+Rq905RRVIgLsHDlT3KI+Q6LS2Ui1IRwbVwsMAnsZ95VyRWpoVmRAA/R4oues7G6I8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR11MB8251
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

T24gRnJpLCAyMDI1LTExLTA3IGF0IDEwOjEzIC0wODAwLCBNYXR0IFJvcGVyIHdyb3RlOg0KPiBJ
bXByb3ZlIHRoZSBrZXJuZWxkb2MgZm9yIGZvcmNld2FrZSBhIGJpdCB0byBnaXZlIG1vcmUgZGV0
YWlsIGFib3V0DQo+IHdoYXQNCj4gdGhlIHN0cnVjdHVyZXMgcmVwcmVzZW50Lg0KPiANCj4gU2ln
bmVkLW9mZi1ieTogTWF0dCBSb3BlciA8bWF0dGhldy5kLnJvcGVyQGludGVsLmNvbT4NCg0KTmlj
ZSwgdGhhbmtzIGZvciB0aGUgZGV0YWlsIQ0KUmV2aWV3ZWQtYnk6IFN0dWFydCBTdW1tZXJzIDxz
dHVhcnQuc3VtbWVyc0BpbnRlbC5jb20+DQoNCj4gLS0tDQo+IMKgZHJpdmVycy9ncHUvZHJtL3hl
L3hlX2ZvcmNlX3dha2VfdHlwZXMuaCB8IDI2DQo+ICsrKysrKysrKysrKysrKysrKysrKystLQ0K
PiDCoDEgZmlsZSBjaGFuZ2VkLCAyNCBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQ0KPiAN
Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9mb3JjZV93YWtlX3R5cGVzLmgN
Cj4gYi9kcml2ZXJzL2dwdS9kcm0veGUveGVfZm9yY2Vfd2FrZV90eXBlcy5oDQo+IGluZGV4IDEy
ZDZlMjM2NzQ1NS4uOWNmYTI4ZmFmN2JjIDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0v
eGUveGVfZm9yY2Vfd2FrZV90eXBlcy5oDQo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS94ZS94ZV9m
b3JjZV93YWtlX3R5cGVzLmgNCj4gQEAgLTUyLDcgKzUyLDIyIEBAIGVudW0geGVfZm9yY2Vfd2Fr
ZV9kb21haW5zIHsNCj4gwqB9Ow0KPiDCoA0KPiDCoC8qKg0KPiAtICogc3RydWN0IHhlX2ZvcmNl
X3dha2VfZG9tYWluIC0gWGUgZm9yY2Ugd2FrZSBkb21haW5zDQo+ICsgKiBzdHJ1Y3QgeGVfZm9y
Y2Vfd2FrZV9kb21haW4gLSBYZSBmb3JjZSB3YWtlIHBvd2VyIGRvbWFpbg0KPiArICoNCj4gKyAq
IFJlcHJlc2VudHMgYSBpbmRpdmlkdWFsIGRldmljZS1pbnRlcm5hbCBwb3dlciBkb21haW4uwqAg
VGhlIGRyaXZlcg0KPiBtdXN0DQo+ICsgKiBlbnN1cmUgdGhlIHBvd2VyIGRvbWFpbiBpcyBhd2Fr
ZSBiZWZvcmUgYWNjZXNzaW5nIHJlZ2lzdGVycyBvcg0KPiBvdGhlcg0KPiArICogaGFyZHdhcmUg
ZnVuY3Rpb25hbGl0eSB0aGF0IGlzIHBhcnQgb2YgdGhlIHBvd2VyIGRvbWFpbi7CoCBTaW5jZQ0K
PiBkaWZmZXJlbnQNCj4gKyAqIGRyaXZlciB0aHJlYWRzIG1heSBhY2Nlc3MgaGFyZHdhcmUgdW5p
dHMgc2ltdWx0YW5lb3VzbHksIGENCj4gcmVmZXJlbmNlIGNvdW50DQo+ICsgKiBpcyB1c2VkIHRv
IGVuc3VyZSB0aGF0IHRoZSBkb21haW4gcmVtYWlucyBhd2FrZSBhcyBsb25nIGFzIGFueQ0KPiBz
b2Z0d2FyZQ0KPiArICogaXMgdXNpbmcgdGhlIHBhcnQgb2YgdGhlIGhhcmR3YXJlIGNvdmVyZWQg
YnkgdGhlIHBvd2VyIGRvbWFpbi4NCj4gKyAqDQo+ICsgKiBIYXJkd2FyZSBwcm92aWRlcyBhIHJl
Z2lzdGVyIGludGVyZmFjZSB0byBhbGxvdyB0aGUgZHJpdmVyIHRvDQo+IHJlcXVlc3QNCj4gKyAq
IHdha2Uvc2xlZXAgb2YgcG93ZXIgZG9tYWlucywgYWx0aG91Z2ggaW4gbW9zdCBjYXNlcyB0aGUg
YWN0dWFsDQo+IGFjdGlvbiBvZg0KPiArICogcG93ZXJpbmcgdGhlIGhhcmR3YXJlIHVwL2Rvd24g
aXMgaGFuZGxlZCBieSBmaXJtd2FyZSAoYW5kIG1heSBiZQ0KPiBzdWJqZWN0IHRvDQo+ICsgKiBy
ZXF1aXJlbWVudHMgYW5kIGNvbnN0cmFpbnRzIG91dHNpZGUgb2YgdGhlIGRyaXZlcidzIHZpc2li
aWxpdHkpDQo+IHNvIHRoZQ0KPiArICogZHJpdmVyIG5lZWRzIHRvIHdhaXQgZm9yIGFuIGFja25v
d2xlZGdtZW50IHRoYXQgYSB3YWtlIHJlcXVlc3QNCj4gaGFzIGJlZW4NCj4gKyAqIGFjdGVkIHVw
b24gYmVmb3JlIGFjY2Vzc2luZyB0aGUgcGFydHMgb2YgdGhlIGhhcmR3YXJlIHRoYXQgcmVzaWRl
DQo+IHdpdGhpbiB0aGUNCj4gKyAqIHBvd2VyIGRvbWFpbi4NCj4gwqAgKi8NCj4gwqBzdHJ1Y3Qg
eGVfZm9yY2Vfd2FrZV9kb21haW4gew0KPiDCoMKgwqDCoMKgwqDCoMKgLyoqIEBpZDogZG9tYWlu
IGZvcmNlIHdha2UgaWQgKi8NCj4gQEAgLTcwLDcgKzg1LDE0IEBAIHN0cnVjdCB4ZV9mb3JjZV93
YWtlX2RvbWFpbiB7DQo+IMKgfTsNCj4gwqANCj4gwqAvKioNCj4gLSAqIHN0cnVjdCB4ZV9mb3Jj
ZV93YWtlIC0gWGUgZm9yY2Ugd2FrZQ0KPiArICogc3RydWN0IHhlX2ZvcmNlX3dha2UgLSBYZSBm
b3JjZSB3YWtlIGNvbGxlY3Rpb24NCj4gKyAqDQo+ICsgKiBSZXByZXNlbnRzIGEgY29sbGVjdGlv
biBvZiByZWxhdGVkIHBvd2VyIGRvbWFpbnMgKHN0cnVjdA0KPiArICogeGVfZm9yY2Vfd2FrZV9k
b21haW4pIGFzc29jaWF0ZWQgd2l0aCBhIHN1YnVuaXQgb2YgdGhlIGRldmljZS4NCj4gKyAqDQo+
ICsgKiBDdXJyZW50bHkgb25seSB1c2VkIGZvciBHVCBwb3dlciBkb21haW5zICh3aGVyZSB0aGUg
dGVybQ0KPiAiZm9yY2V3YWtlIiBpcyB1c2VkDQo+ICsgKiBpbiB0aGUgaGFyZHdhcmUgZG9jdW1l
bnRhdGlvbiksIGFsdGhvdWdoIHRoZSBpbnRlcmZhY2UgY291bGQgYmUNCj4gZXh0ZW5kZWQgdG8N
Cj4gKyAqIHBvd2VyIHdlbGxzIGluIG90aGVyIHBhcnRzIG9mIHRoZSBoYXJkd2FyZSBpbiB0aGUg
ZnV0dXJlLg0KPiDCoCAqLw0KPiDCoHN0cnVjdCB4ZV9mb3JjZV93YWtlIHsNCj4gwqDCoMKgwqDC
oMKgwqDCoC8qKiBAZ3Q6IGJhY2sgcG9pbnRlcnMgdG8gR1QgKi8NCg0K
