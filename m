Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 39CC2E9A049
	for <intel-xe@archiver.kernel.org>; Wed, 18 Feb 2026 14:48:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA2510E5CC;
	Wed, 18 Feb 2026 14:48:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="Vibk+PtK";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8910810E5CC
 for <intel-xe@lists.freedesktop.org>; Wed, 18 Feb 2026 14:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1771426110; x=1802962110;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:content-transfer-encoding:mime-version;
 bh=yqDUrireyE6v8igzkpXpt7K0xTixS6OsVWcWI+2hMgs=;
 b=Vibk+PtKSg8ISQ+TnlK7azPy/WI/9bbIeRVvYxokGJ9QJwyK6t4Nvuoo
 H+jmeEVvkmIbuIV2fo2wHILp1bd/WwAo6OQ6YKt9Hb97eF3IXmmhw+X4R
 X6bjMSVkd71t1xcAVEl1UjMq8EGipROkw+lEdIRhDuYQ0IoTcujHiuxGU
 4LrYA9m1TlIylPbJpUMPrLxxvNXgxJlUK63U/uMur5JNeUkHFzuogndwt
 rEPZVc4gMEPWx+dNzchRy7mf2orL3PlbrvrvzJ6xGTojEa6Mzo7Dc2Rb6
 CdpBTpqrL8PZrA6u41i+Wy/nIv3WthW2UVANuB12Y9RWbqDmp7Imm2RsS g==;
X-CSE-ConnectionGUID: fUx4At9FSaKGDHujpOoTcw==
X-CSE-MsgGUID: ZHQR1xVsRqG9nXJ9k04zMg==
X-IronPort-AV: E=McAfee;i="6800,10657,11705"; a="97962115"
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="97962115"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 06:48:29 -0800
X-CSE-ConnectionGUID: n28UvcPJRXqgKCnfQ1tYWQ==
X-CSE-MsgGUID: pzpkZU5uSLq/K0Rj7Vr+mA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,298,1763452800"; d="scan'208";a="213401743"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by fmviesa008.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 Feb 2026 06:48:30 -0800
Received: from ORSMSX903.amr.corp.intel.com (10.22.229.25) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 06:48:29 -0800
Received: from ORSEDG903.ED.cps.intel.com (10.7.248.13) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35 via Frontend Transport; Wed, 18 Feb 2026 06:48:29 -0800
Received: from CH1PR05CU001.outbound.protection.outlook.com (52.101.193.21) by
 edgegateway.intel.com (134.134.137.113) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.35; Wed, 18 Feb 2026 06:48:29 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=K4G4bC8kL1jqF+RimHrglhN1HNcD0S+n6HQQKyycv4cbu+55V8GMwcu8qLLvLZfmR10k8Mk67R7VsminEUwOp+44UeEZ0g4XoPAF135oU4TNcmdNfLtj2GF4FA/c5x6tG2Z7hu/RDaUAUKvWYiFlFIom176MLlYZ2qmjAb5FFUt3+Ozzts8mrm7/LsC3I+y4Qj9r6eHO/uHA5c/BmfDqWzv//2BrK5jdtPcaO2lDtArSNtkxgVADvW+hcjllEYnQDqiq61dvmmlAER7oZE2/OvV3EqCvRWFqAf8Y9TywiKz3QbNZogdrL6Gm8dhyj2oSfHVcJrGNoHmDfJmJqy24Xg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zt2VSx/rdDXF37xFEJln6tT8VrmrsKXFEW8Y5Mt0xMM=;
 b=oGd9O2gUVGk48KWvuKt/E2DYPtrw9IRgp//yCgTt+H5v7mISF3WiW+IyHYH9PtI9NxlWJzFwPRXA8TLIGRRAaVbnu8s1S32pR6kpJ8LrV/QWT/Au8Pnuu81nVn26/6PaX4r7LEi9rtYbcOvEB5tLJ6+0P8oPcMLtDk6H9KSH2p5JYDn2JpiV6dhINAbArOBMGAON+gLLkNkNzpz76b0f3IqviX+fa8MXIfXOr239PWUpbZvms9yLI9OPZp+/3Pcl5GyCLprKcjxDjayvq2EJCRitmeHI3KX0PNRIoffwYs80WhDkkbEuz4HSyIo1O0ZK7tKxU2rcgEmSyaVy993weQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DS0PR11MB7958.namprd11.prod.outlook.com (2603:10b6:8:f9::19) by
 MW6PR11MB8412.namprd11.prod.outlook.com (2603:10b6:303:23a::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.14; Wed, 18 Feb
 2026 14:48:24 +0000
Received: from DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99]) by DS0PR11MB7958.namprd11.prod.outlook.com
 ([fe80::8cb2:cffc:b684:9a99%6]) with mapi id 15.20.9632.010; Wed, 18 Feb 2026
 14:48:24 +0000
Message-ID: <e6bd5d83-1c83-43b5-b76b-8ddd84034b9f@intel.com>
Date: Wed, 18 Feb 2026 20:18:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/8] drm/xe/xe_ras: Initialize Uncorrectable AER Registers
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <rodrigo.vivi@intel.com>,
 <aravind.iddamsetty@linux.intel.com>, <badal.nilawar@intel.com>,
 <raag.jadav@intel.com>, <ravi.kishore.koppuravuri@intel.com>
References: <20260122100613.3631582-10-riana.tauro@intel.com>
 <20260122100613.3631582-15-riana.tauro@intel.com>
 <0ff0af91-aa7d-4cf5-853f-d457be035c81@intel.com>
Content-Language: en-US
From: Riana Tauro <riana.tauro@intel.com>
In-Reply-To: <0ff0af91-aa7d-4cf5-853f-d457be035c81@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: MA5PR01CA0016.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:177::14) To DS0PR11MB7958.namprd11.prod.outlook.com
 (2603:10b6:8:f9::19)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS0PR11MB7958:EE_|MW6PR11MB8412:EE_
X-MS-Office365-Filtering-Correlation-Id: cdb10dd8-cdd3-4b6f-b136-08de6efcc4a7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?cTQ4WENLcTRnaktXNjUvT0owMllPblhHb0hNSEgydElrVFZCcU5UYjZ3bkhQ?=
 =?utf-8?B?M0dFMmVUZzQrUk5ta2l4dFBqVlh4bDBkUnVYVGlucjVDRVhRakF6Kys3RGpH?=
 =?utf-8?B?QVd4c1VxcDI0Sjd2TlpPaTluYmc4cGQxY01Oelc4VTF2cGJXZWs4MkZ3Mk9B?=
 =?utf-8?B?dHBZTFRmYUZYTmZyU1VFMnh3NVdVRG9mbTU0azFEb3doWHZwVmR5TDhQMitk?=
 =?utf-8?B?NTdMYzFTS1dlamlkYk9KTHRDN25mTTlPSEFsb1JEZmh5L3lxWldjKzZMbUZh?=
 =?utf-8?B?RDhZVVhjamU5b05LaHZPWHIzTjlNSlE1VTBRc0cxRHBVM1NZOFJncTZpcVRL?=
 =?utf-8?B?WVpsdC9uQWtCbitPdm9XdVlwSHhtOUVMcjFLVTNrMWJrYXBxUXRRMGtlVXI1?=
 =?utf-8?B?d2J4VWZqR0FSOFBDcVdKY3NLeS9JVVlYM0czaDdvNU5XMlJreFk3Y3Fjb1c1?=
 =?utf-8?B?TVV5YmFHaGhGR1JBSGsza1R2dmszd3U5Vk5ESFpKNW5uS240MUhxNHc4amNr?=
 =?utf-8?B?eUQzYitUM3VxcXpUME1JZm1XcUNaWkE4QWExay9PQmxuVmd5NlhhUEthbXlW?=
 =?utf-8?B?QTJCeHlHOXp6SU5reDZ3SU9ubEI3SDJNWlp5ckxpRnpiTS9jbnlCVjlZQ0FW?=
 =?utf-8?B?Tmp0Nm1mSUF0bTdkNnFDOVVOcWpLZ1R4aTVuRCtuMG5qU1IzOTB3b3U4ckh5?=
 =?utf-8?B?RHdycHVBK0ZtOGc5MFROUTBGSXVFQWhkV0grSDE5SW4xdnJOa0pJb09kTWp4?=
 =?utf-8?B?MzdmWWFSNEZ2SWdNc3cyUklsN0dsNVJRSGx2Y0NFOW4vT3hJeE90MjEvWnRk?=
 =?utf-8?B?Rkx0Tk5mM3VKRVNTS3Bob2JmcXoyemtqR3Eva3N6R0l6a21EenpJamJrSGI0?=
 =?utf-8?B?ejRsTEx2UzArL1N4SDliRGNGb3QwZlV1MjVuWE1aVWxBQmpFRk9xZzF0d1VN?=
 =?utf-8?B?QnkzWG5nTGRVaWxObzluSEQ1cC9hV2JFK2dkUjFZUjl4Q3ArVnc3MkpUcU82?=
 =?utf-8?B?RDJOTEh4dnMyWW96OHROY3hSeFMvbjQxL01yMFBVNm8vVkRlVEVnZEgyNTgy?=
 =?utf-8?B?cmRubWJCSVRDOFJCcGxmMndqcHBYSGdyR0FsWGIxTnM4OE1DQWNMVnRLVXRM?=
 =?utf-8?B?bmtDTVZkWGpuRDZPa1VHUFBUbG1NUUlHUFYyOUZxQUpZakZxRm11UnFXRTQy?=
 =?utf-8?B?OUMyOEhuTkh4N1VLQThOV0tpUU5kN2lsaUt1T0YvRnNuK1B2ZmxKL3RCSnFW?=
 =?utf-8?B?OFhLRCtiVVhiWEMrZEhQajRpb0FwTVYveFdWMnV0TFVURjEvT29VeGUzTVBZ?=
 =?utf-8?B?eWgxZ1JpVXhBRnJOOVBIblNlWDRPQU5ZT01NTzVLNEh0ZXJ2THhFeGVlbHQ1?=
 =?utf-8?B?L2lHQjl0M2FDcjZ2YzBxZkJmVmRGdEwvVE0rdVZSSlBoU0NldHJzVHlocEEr?=
 =?utf-8?B?Y3BQTE92cy82MDNuVjJheG5uK08raFM0TzZqYkJYU0pMT091QTQ2Ui9NcUhr?=
 =?utf-8?B?NGF2emRKS25xNUQraGJLV0N6eEw4d3NVZFVoWDBEQnZwVXpLdnhUbGE3VDBH?=
 =?utf-8?B?WlAremJvYXA1K0hqd3VkNUtaMVVTZlhRYmFkRmF0ZGJGMEJtbWpUVTBRaDBB?=
 =?utf-8?B?aG10Z3pjWnJnbzhiS1ZwN0pHRnEwVDhkdUFBbjZLV3JPNHUvZndMZGxObHUw?=
 =?utf-8?B?enJqNnBUYUs5dGtudHlKQjB2R3ZTdVh4enZ3dTZkU0xXek1BOXd5bCtuTldS?=
 =?utf-8?B?b0J4cmEzYXZhaDd2emlqTlN0eDVSZVpmODUyb1JaQmtqL3hZVlpLcVFSWXZO?=
 =?utf-8?B?YnM5bzJWSzY0ZkM5VFpSdS9uNjNJSmhsTmZKZzRkMS81ZmVSSEtzVkJFUkRZ?=
 =?utf-8?B?L3J6dm9QZE5FNHQ4MW54YzkrTGdOTXZaVzAzVDFaamNqb3o2L3dHam9LUmZo?=
 =?utf-8?B?NXJzaCt5M0twT1hRY21zNUx3TTIvay9URDZKeHJTMFVuSnVBRGFDU2JSMFJp?=
 =?utf-8?B?ME01M1lwQXBHQ0NJb0VITnc1ZEQvMjYrRWV6c2NXOWtEaUY0VTBYMkgzTUkx?=
 =?utf-8?B?VEo0VURhTXRVaC9UenJnWFRLdDBNNUdBOEhKMGh0dzkxOWsyeEdST0tqVmsz?=
 =?utf-8?Q?ku64=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS0PR11MB7958.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NTE0andrSi9hUXZwUHVUWXRFajhOcS9pb3NFRVc4dWJ3ZTJERGw1YlFvY0pN?=
 =?utf-8?B?V01aRHM5eDV5V0QxMXV4KzJ5RWUrODdkVDFZK093Q1FpdURRTCs2d1JoaHU0?=
 =?utf-8?B?R0toUHUreWovc0lsakZ3WEx3SFRpblAyZnk5Q1hmbTk3ZlhDRlI1R1dtSklv?=
 =?utf-8?B?U2dKUkNRWll3VisxQk0zQlJTTnFkdGQrS1F1ZzdVOHJRNCtBbTNVTFJmejkr?=
 =?utf-8?B?LzB1anZrU1FrMXJmRGp1TXdvOVpFcWhvWUl6bnRjTlIzRjJLL1FmZ2hrTjk2?=
 =?utf-8?B?cSs3M2RXanJtc3NCOU1wZmNCYlpCQ3RablYvWWJ2TWQxWi82M0NROGhRSXJn?=
 =?utf-8?B?WTVuN3prUjgrUnZ4c3cxRGVqdE1WRUNNWEo4NnA0aWxVdGNJOUx5c3Z2RllM?=
 =?utf-8?B?Um9VeldkYVRGcFA3S1BZYkcwdGI0WGs3YjlxcEVOMXBvZjZEdTZpYkpnbExr?=
 =?utf-8?B?ZlRXTmZISWt4QmlzYnZGaEdwbWtETzk1dm9zc29iejBUaU9YZFNVeWhiY216?=
 =?utf-8?B?cTIyYVFKUjh1cnJMMGRjSW1uTEY0S1FaV2ZRMFczQ3czYnR2UmpZZUFJc0tN?=
 =?utf-8?B?Q01zRzRzeHRkam55TVZFcjcwUVdteHFhSk04aFpPc29aZ2cya2tIeGg4ekg3?=
 =?utf-8?B?RGR4Zk42SDk1TzNqTTA3Y1hqSmFmT0NsZko0czAwS2RtSkViUDRIeHR1b3VK?=
 =?utf-8?B?dk9xUDVhNWU2UlJCcklMN0JaOWs5RTRUakdlcFE2WHVYYzRxditqUTlFeUtW?=
 =?utf-8?B?QWJpazhzL3FxSy9Vc3h5eFQzeS8rcjB0VjdZdURIVWF2ZjdFK0ZJTGhrZmcz?=
 =?utf-8?B?Q3RKWER6YlFMaTJ2bzZnVFRnSTZTa0ZrVVpIT0U0Qk1KcG9rK1lDS0EyajJw?=
 =?utf-8?B?WkFQSk83SWlHelVSL2FiWVIrSTk2OEdtc0dmc2pQOEdlSHYxOWFINkFRQm1C?=
 =?utf-8?B?ZFdyVlFqSzR2ei9WTnlmL3BOR0J1bHAxSUNzcjh2MWtwQVE4UnNTRWhBQ0Fy?=
 =?utf-8?B?RVJpKzI0VmJROXlMUHlvUWdaSHZKME5BbmNxN2R6RlpzT05POTRKWlFuQXll?=
 =?utf-8?B?eFpiL2JkcGJtR3hacGw5UnNTbCtadjJSdCttcU9ycnc2VTZ1dk5XREVXbUl5?=
 =?utf-8?B?M0lsYy9CakpUUUY1T01ldG5IblBvRFpKcFpRZmhtWWM2VWNmdnEwb0I0aGFi?=
 =?utf-8?B?Q2pUOFRGNDZjL29zZDZnZkgyODFCbkVSTVEvZUM2eVcwSU56ejZIaHZBd3hu?=
 =?utf-8?B?U3plVnJPeERxN2tzTnM5V2EvQW1qNFpLakZlM1hQTnNFckhZenhDR0xTMmgx?=
 =?utf-8?B?UE12WkhZY3Uwem1MaVFlbUVEUE5KblRFREdkTjRKbDI1dnhJUFVQS0JXK0dH?=
 =?utf-8?B?VTVtZ0FwOU9oeGZXQ1ZrTmJKWHpaR3pKMmlVRTJzWTZoZEdrY1NlZ2dQSDJ1?=
 =?utf-8?B?Q3BNaGlLUXFKUmU1bEVrRW9XQk5CbVdUbzJRWkVPM2dPK05pSVJudlk5T2Uy?=
 =?utf-8?B?RnZCWnltTU42d2ZXSzdKK2t2ZXozYlRBNjRVVk4rSnBVdEZhK2tTTW5BaWQ2?=
 =?utf-8?B?czVuK3FWZE5KVWcwOW04SzBwdVRxKzFTUDFxajZrK1ZjUXN2K1F0elQ5c0Ez?=
 =?utf-8?B?UCtIekZUVWROQkpuTFIyam1PMXFqQ0FHN3ZHazdic2tMOEhXanEvbkxjVGxy?=
 =?utf-8?B?ZzhjYmtySEZPZ0JVaGl4NzRrRDBxODh6V0lMNzVGWUptSnpsektpTEM2dnJV?=
 =?utf-8?B?TUVuRTdVSlFZYTFJcXJ3OU5FSkdzTUd0NFYvcWc1elFoQ0NqRTFhMTJVcWJI?=
 =?utf-8?B?WWlNNStuM0w5bWRnd0NVYldXa2loVHRKOWp6NXdzdEpqVEN3WlFKa0NndGVp?=
 =?utf-8?B?UWh1T1V1QzdXTWlxQnhueFlPSnh3aElTWXppSUw0MEhnUUV1NHlJZmpmYVI3?=
 =?utf-8?B?ZXdtUlBlTFhQT01ncmxTZDVoRlgwVEpqaVd5VUxNWDZ1SmpXTWh1RGZRM1ov?=
 =?utf-8?B?R3dremV1M1VVT0UxUXpNVFNPQkZNa2Vmd3JrcjFmbjNxalcrR0dnVXkxTXIv?=
 =?utf-8?B?YkNXM1EvVHBjYVBHUFp2ZjNFdUxVQ0d1blFKN3ZNMURGOW16czhwL2RYNWFF?=
 =?utf-8?B?Kzd6T3ZVWktRYnZ3NkIzcUFBdEIvZWpXSm55cWpGdUNyVXhYMVdQQWhXbnlG?=
 =?utf-8?B?cFJSQWtjYTV0VjNzeGtieC9DN1pCWEtvVnJnbVFZQVJYclNGb0kzWmM1Si96?=
 =?utf-8?B?cmhpUzhpTS9FS294Tk5rSER4cVhzWkpuVHdQT2xUV0VtN0hxV21WZkRGQ2Y2?=
 =?utf-8?B?dTAxbGZGZ3hsWjd1S0kyUGo0UXdRb1VVeGVkdHl1Tm5kZ1NGZW9Vdz09?=
X-MS-Exchange-CrossTenant-Network-Message-Id: cdb10dd8-cdd3-4b6f-b136-08de6efcc4a7
X-MS-Exchange-CrossTenant-AuthSource: DS0PR11MB7958.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Feb 2026 14:48:24.5198 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sVzq7w6W6/sdNMVx2icmT5AWhF0u6n0+olcM4OSpDX+WHxI+ahZxg36HpVNbquT7hLVqDM19QFDdzy/q2p+joA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR11MB8412
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



On 2/16/2026 5:57 PM, Mallesh, Koujalagi wrote:
> +Adding more comments
> 
> Hi Riana,
> 
> On 22-01-2026 03:36 pm, Riana Tauro wrote:
>> Uncorrectable errors from different endpoints in the device are 
>> steered to
>> the USP which is a PCI Advanced Error Reporting (AER) Compliant device.
>> Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> from triggering a Secondary Bus Reset (SBR). This allows error
>> detection, containment and recovery in the driver.
>>
>> The Uncorrectable Error Severity Register has the 'Uncorrectable
>> Internal Error Severity' set to fatal by default. Set this to
>> non-fatal and unmask the error.
>>
>> Signed-off-by: Riana Tauro <riana.tauro@intel.com>
>> ---
>>   drivers/gpu/drm/xe/Makefile    |  1 +
>>   drivers/gpu/drm/xe/xe_device.c |  3 ++
>>   drivers/gpu/drm/xe/xe_ras.c    | 71 ++++++++++++++++++++++++++++++++++
>>   drivers/gpu/drm/xe/xe_ras.h    | 13 +++++++
>>   4 files changed, 88 insertions(+)
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.c
>>   create mode 100644 drivers/gpu/drm/xe/xe_ras.h
>>
>> diff --git a/drivers/gpu/drm/xe/Makefile b/drivers/gpu/drm/xe/Makefile
>> index 5581f2180b5c..85ec53eb0b62 100644
>> --- a/drivers/gpu/drm/xe/Makefile
>> +++ b/drivers/gpu/drm/xe/Makefile
>> @@ -110,6 +110,7 @@ xe-y += xe_bb.o \
>>       xe_pxp_debugfs.o \
>>       xe_pxp_submit.o \
>>       xe_query.o \
>> +    xe_ras.o \
>>       xe_range_fence.o \
>>       xe_reg_sr.o \
>>       xe_reg_whitelist.o \
>> diff --git a/drivers/gpu/drm/xe/xe_device.c b/drivers/gpu/drm/xe/ 
>> xe_device.c
>> index f418ebf04f0f..be89ffc9eade 100644
>> --- a/drivers/gpu/drm/xe/xe_device.c
>> +++ b/drivers/gpu/drm/xe/xe_device.c
>> @@ -59,6 +59,7 @@
>>   #include "xe_psmi.h"
>>   #include "xe_pxp.h"
>>   #include "xe_query.h"
>> +#include "xe_ras.h"
>>   #include "xe_shrinker.h"
>>   #include "xe_soc_remapper.h"
>>   #include "xe_survivability_mode.h"
>> @@ -1019,6 +1020,8 @@ int xe_device_probe(struct xe_device *xe)
>>       xe_vsec_init(xe);
>> +    xe_ras_init(xe);
>> +
>>       err = xe_sriov_init_late(xe);
>>       if (err)
>>           goto err_unregister_display;
>> diff --git a/drivers/gpu/drm/xe/xe_ras.c b/drivers/gpu/drm/xe/xe_ras.c
>> new file mode 100644
>> index 000000000000..ba5ed37aed28
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.c
>> @@ -0,0 +1,71 @@
>> +// SPDX-License-Identifier: MIT
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +#include <linux/pci.h>
>> +
>> +#include "xe_device_types.h"
>> +#include "xe_ras.h"
>> +
>> +#ifdef CONFIG_PCIEAER
>> +static void unmask_and_downgrade_internal_error(struct xe_device *xe)
>> +{
>> +    struct pci_dev *pdev = to_pci_dev(xe->drm.dev);
>> +    struct pci_dev *vsp, *usp;
>> +    u32 aer_uncorr_sev, aer_uncorr_mask;
>> +    u16 aer_cap;
>> +
>> +     /* Gfx Device Hierarchy: USP-->VSP-->SGunit */
>> +    vsp = pci_upstream_bridge(pdev);
>> +    if (!vsp)
>> +        return;
>> +
>> +    usp = pci_upstream_bridge(vsp);
>> +    if (!usp)
>> +        return;
>> +
>> +    aer_cap = usp->aer_cap;
>> +
>> +    if (!aer_cap)
>> +        return;
>> +
>> +    /*
>> +     * All errors are steered to USP which is a PCIe AER Complaint 
>> device.
>> +     * Downgrade all the errors to non-fatal to prevent PCIe bus driver
>> +     * from triggering a Secondary Bus Reset (SBR). This allows error
>> +     * detection, containment and recovery in the driver.
>> +     *
>> +     * The Uncorrectable Error Severity Register has the 'Uncorrectable
>> +     * Internal Error Severity' set to fatal by default. Set this to
>> +     * non-fatal and unmask the error.
>> +     */
>> +
>> +    /* Initialize Uncorrectable Error Severity Register */
>> +    pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, 
>> &aer_uncorr_sev);
>> +    aer_uncorr_sev &= ~PCI_ERR_UNC_INTN;
>> +    pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_SEVER, 
>> aer_uncorr_sev);
>> +
>> +    /* Initialize Uncorrectable Error Mask Register */
>> +    pci_read_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, 
>> &aer_uncorr_mask);
>> +    aer_uncorr_mask &= ~PCI_ERR_UNC_INTN;
>> +    pci_write_config_dword(usp, aer_cap + PCI_ERR_UNCOR_MASK, 
>> aer_uncorr_mask);
> 
> Handle pci_read/write_config_dword() failure (return non-zero) scenario 
> for both sev and mask.
> 

The reason this would fail would be if pci device is disconnected or 
there is something wrong with the device which will cause failures 
across the driver.

We cannot deregister the error handlers even if there is a failure.
I can only add a log.

Searched this and didn't find many usages of handling.

Thanks
Riana

> Impact: Silent failure leads to incorrect assumption about error 
> handling conf. Driver may expect
> 
> non-fatal errors but still get fatal errors causing unexpected resets.
> 
> 
> Thanks,
> 
> -/Mallesh
> 
>> +
>> +    pci_save_state(usp);
>> +}
>> +#endif
>> +
>> +/**
>> + * xe_ras_init - Initialize Xe RAS
>> + * @xe: xe device instance
>> + *
>> + * Initialize Xe RAS
>> + */
>> +void xe_ras_init(struct xe_device *xe)
>> +{
>> +    if (!xe->info.has_sysctrl)
>> +        return;
>> +
>> +#ifdef CONFIG_PCIEAER
>> +    unmask_and_downgrade_internal_error(xe);
>> +#endif
>> +}
>> diff --git a/drivers/gpu/drm/xe/xe_ras.h b/drivers/gpu/drm/xe/xe_ras.h
>> new file mode 100644
>> index 000000000000..14cb973603e7
>> --- /dev/null
>> +++ b/drivers/gpu/drm/xe/xe_ras.h
>> @@ -0,0 +1,13 @@
>> +/* SPDX-License-Identifier: MIT */
>> +/*
>> + * Copyright © 2026 Intel Corporation
>> + */
>> +
>> +#ifndef _XE_RAS_H_
>> +#define _XE_RAS_H_
>> +
>> +struct xe_device;
>> +
>> +void xe_ras_init(struct xe_device *xe);
>> +
>> +#endif

