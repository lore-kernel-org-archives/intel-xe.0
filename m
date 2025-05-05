Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47658C3ABAA
	for <intel-xe@archiver.kernel.org>; Mon,  5 May 2025 14:02:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F391510E0C3;
	Mon,  5 May 2025 14:02:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=intel.com header.i=@intel.com header.b="b8ZmvNgw";
	dkim-atps=neutral
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E602410E0C3
 for <intel-xe@lists.freedesktop.org>; Mon,  5 May 2025 14:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1746453752; x=1777989752;
 h=message-id:date:subject:to:cc:references:from:
 in-reply-to:mime-version;
 bh=P5N26bLV74MoerBUKSUOPLyihltfXsOxg23Bp3vdSxU=;
 b=b8ZmvNgwKrW3OqPNiPLXG2RNH0A861inNkGaT3ZCsZkklynpZnp86Gds
 LzTin4OjwCM7U2U1mnUJZ6qAqguLLw9mb10wocAfK2sBCDWbRx9wL4xWG
 eQ+4MyA1/vSdlEUV5pNd++zLIvuhzH/W/zY812AnPX/8V/CIiRp1WSnAx
 qYoQxl9MnaX2+JWSZD8LRy55D4CKWydVHia28jzMUB5wcGX97CP0P71HN
 H4fBoSDTipBmCBSy7P+By8sv8l5E3QSje8nRdocDdEQnfeFMPdV5h03qg
 Vr8+wzDxIEJrEghHTFlxG3s60eDHtR6A3XVAf7zasDFecq59RPUzVSeQp Q==;
X-CSE-ConnectionGUID: CyM2wH4TSfa7dKO+r7URZQ==
X-CSE-MsgGUID: 3XDp/03cR8u/XayQe9c4dQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11423"; a="59455761"
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; d="scan'208,217";a="59455761"
Received: from orviesa004.jf.intel.com ([10.64.159.144])
 by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:02:28 -0700
X-CSE-ConnectionGUID: ybYFQ7cNSAi0f9cvyUTtwQ==
X-CSE-MsgGUID: DC8cSmp2RUKgdagLtK/x0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,262,1739865600"; 
 d="scan'208,217";a="140253460"
Received: from orsmsx903.amr.corp.intel.com ([10.22.229.25])
 by orviesa004.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 05 May 2025 07:02:28 -0700
Received: from ORSMSX901.amr.corp.intel.com (10.22.229.23) by
 ORSMSX903.amr.corp.intel.com (10.22.229.25) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Mon, 5 May 2025 07:02:27 -0700
Received: from ORSEDG602.ED.cps.intel.com (10.7.248.7) by
 ORSMSX901.amr.corp.intel.com (10.22.229.23) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14 via Frontend Transport; Mon, 5 May 2025 07:02:27 -0700
Received: from NAM10-MW2-obe.outbound.protection.outlook.com (104.47.55.41) by
 edgegateway.intel.com (134.134.137.103) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.44; Mon, 5 May 2025 07:02:27 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=C9ITHudUzCDvLy6p9mpvQVdSTgAAFqc8b2RlQRxwiI5StjYQaGgCCdDMPxzoxsaCxSdCO9RmparzPrjOqXRZx8iNaDcLjKIKj9GIJNAmFyvvFiBr18h7qZP58N8KVe9IwMU12rdt29Dfsmeg5C5CNuvUNjoXwXczaXkzCo/zsv2/PVtlQRinXbMB2ZlGcJXLIbKby/tPoyXj1O5pfH5gGEKU1Q8JJlpq97Q+GqnfNhwvsKR79PyK6FcsQClVrjmQXGvJOIrHXce68sWS+tWaG5YqTOJ942kClKTNWVxDxuLgUwGSEzJEk71+X8l95ry1Qm8B1b3IFImG+wPyNOzLgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RPe8rhOl+OmqeaSVZryzT1fSohJrPIuFbDuNwaizMJ4=;
 b=iML24UorThvGEKQLn1rwoVG1hjVnLjAkHoO5Zp10ilYjWLiYmlis5SoxnPrgCemBuDxQtJWDxHqEVjKD072zTrpNuPDfJ06AVCFf2UCMIliVFT1SLakgKM4upxBj9NtkBK13WNhwNBTHzlprmOew1HgBNky3Ms7RoAHOf/zj4Ze7GkwoRzfLM3rBG+DXVrzwpE+rvUuqb7WdpU58ZKOLeNm7XNFA92CbZXRrkqZtfqmoI6K9ejrfi20go4rKfTw7Bzl8Mz66O5TvQyy4xakor9xOaQwMVjpeYUdWkmLDVc2GF6bz9XmRl5xOrZyBjON8Y8MNR+Lxnnt6sfuqzuJTcg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM8PR11MB5703.namprd11.prod.outlook.com (2603:10b6:8:22::5) by
 SA1PR11MB5803.namprd11.prod.outlook.com (2603:10b6:806:23e::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8678.27; Mon, 5 May 2025 14:02:23 +0000
Received: from DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454]) by DM8PR11MB5703.namprd11.prod.outlook.com
 ([fe80::f734:e507:3083:e454%4]) with mapi id 15.20.8699.022; Mon, 5 May 2025
 14:02:23 +0000
Content-Type: multipart/alternative;
 boundary="------------DouXFSg8RucbKRNhLZ8bpFKW"
Message-ID: <0dda3a2e-e4aa-412c-bcb7-87ebabaeed61@intel.com>
Date: Mon, 5 May 2025 19:32:16 +0530
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/5] drm/xe/hwmon: Add support to manage power limits
 though mailbox
To: "Nilawar, Badal" <badal.nilawar@intel.com>,
 <intel-xe@lists.freedesktop.org>
CC: <anshuman.gupta@intel.com>, <riana.tauro@intel.com>,
 <ashutosh.dixit@intel.com>, <rodrigo.vivi@intel.com>,
 <michael.j.ruhl@intel.com>
References: <20250430203607.926585-1-karthik.poosa@intel.com>
 <20250430203607.926585-2-karthik.poosa@intel.com>
 <ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com>
Content-Language: en-GB
From: "Poosa, Karthik" <karthik.poosa@intel.com>
In-Reply-To: <ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com>
X-ClientProxiedBy: MA0PR01CA0114.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:a01:11d::12) To DM8PR11MB5703.namprd11.prod.outlook.com
 (2603:10b6:8:22::5)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM8PR11MB5703:EE_|SA1PR11MB5803:EE_
X-MS-Office365-Filtering-Correlation-Id: a49852cd-9817-4988-754d-08dd8bdd7587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|8096899003;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R3M2NncyQnltTTIram5veVlYelNscDRMQjJDTTE5TW1RcVJ1aDdjYmZwVE1G?=
 =?utf-8?B?enNDU3U3YTFEcFlXV3JYVmdScDFJNUxGaGxkVWR1TDRqVHhjay94Z3ExSHRR?=
 =?utf-8?B?R1ZuZzRPM1pjNlpUbGQ4TUhuVDdBWHdYNmp2cmJTcjdLQVBrWlphTVk1cUFY?=
 =?utf-8?B?Mnc3RlNnT3pCZkcwU3A0TTlCaFd5K3dpcUVYbVBGbGdiUS9XRGNURjBETWJG?=
 =?utf-8?B?eWVRTU1neFVOTk1peHAvZW85SFMyd282TjZUMDhYenVzOE1TaHJGRGxJamZ2?=
 =?utf-8?B?Yi9IY2M4QWdFY3VTK2hYWU8rdUhwejRESFJwelRTVFF4dmR0a2wzTnJJSXBW?=
 =?utf-8?B?RkMzWHdhMjYwVkJ0UUJUb2puWDR5WDJIZXJWYUpTa2tWeU8vN2hzOGVtNUJt?=
 =?utf-8?B?NzZKYlpFK05tR1pxZEl3YkJQaU9ycUFwdGJjWXVkaUtpT2VzUVJtZm5GMnFw?=
 =?utf-8?B?bkdrYzVuRTRnZGxCZUlsemkxc0xrRG9DNVg1TGhwZnVrNkpIaXpWT25FTUlt?=
 =?utf-8?B?YzFzR1VHV2ljQVhPNHZuQjlmMTF6OWNLTDR4V0s5UHhGN0RwbEd6RnVocFEv?=
 =?utf-8?B?WHg1d254MFF2RC9RWXZZbERVdnJnN2cydnV4S282Qi9Kbm1mb3lJLzhLdXY4?=
 =?utf-8?B?YVYyTXpkMzNTcGxrS08vVEVIalVic1d6MElVU01sNTgwNUw2aVVFNS9qWkJR?=
 =?utf-8?B?N2cvVVRuc0VYZUZzNjBiM1ZBVTc0NEsrQ05hTVJ3WS9xeGdiSlZvZ3pOMGJB?=
 =?utf-8?B?Mmt2SXFxa1lleVFFdzVXNHZaN2pSK2hGY1pOT0h1cjBaakFVT29DQkFpTGpv?=
 =?utf-8?B?UVhSMFVqRXRZaTRkaVpzZTNvRzNxTWZHUEltUHVMdzlGU0hxWE4rdmk5SnMz?=
 =?utf-8?B?ZENvWlFYV2FTbHBFWHpLMDlvNXlmejZNNkJ6UTFLc0huMU5aOUI1L1FLVSsz?=
 =?utf-8?B?KzlldXBtenkrMC9oNTVROWdHaUhLRDhjSlcvQ3RNOWhNTndvaUFFUHg3Qncv?=
 =?utf-8?B?TUdnd1pBT1ZPT3h6eTRXUUpOblJvY3lOeTJUVU8xNWZwcjVwaVpEbXlYbE5I?=
 =?utf-8?B?dmwwVkgyTjdIaGVHQjVmR0FSWGJ3NUpNaEtTbEw3L2JaSnBCZkcyM1VxczdC?=
 =?utf-8?B?OEwxQVA1WHQyWTEzK0paV2F6TGx2TVM3ZDdtNmpsU3BrRTQwZVpsT3hPZWc1?=
 =?utf-8?B?UUFlcWo3Zk13NGxUSVp3TFNOM2tnTkJnMldNNXlWOW5mNzZlVWpJU2RmWmNG?=
 =?utf-8?B?cXZ0bERBS2tlbm1uOWRvL1k4WlRnNDdFQXR1ZVJZZHV6ZzZDalp4ekx6aklD?=
 =?utf-8?B?Y0VJMkhJTUtDUWxib0hkOXpNSUxyZ2Q0cHFSS0hNSnRXTmFxMXBsL3lBcUJn?=
 =?utf-8?B?Q2lsSW5PTnh3b2o1aG5PSGxpQXhld3hrN2dxejFPZU9OU0UyaVlKQWtqZzhr?=
 =?utf-8?B?VjNhM0xUNXdUMDB1TzFqeWk4aDRGRE9rMHFiaEdXeDhTODN6MjJMWlU1UFBr?=
 =?utf-8?B?d1RUZ09yRFg5OU5kam9Vc3ZhcTZBSzNBeWZGNEVLbmM5bG5NUlBVcFRuUW8r?=
 =?utf-8?B?REFIRmJoZ08rbHIrbk0yeFFYYWgvM0JSS2JpYXVjSC9KbkNwN2YxcXRxRXdZ?=
 =?utf-8?B?U0FRbHpOWHdxTHBaSnlTTXpuTXg0T2d2ci9wOFlheitXcDFvZnNuRlRWczBq?=
 =?utf-8?B?Q0x0STE2MlV3RmQrL0hUYnJaVlQvT2pSVHRKcnZiRDZiN29BUFlFbXhLUGxU?=
 =?utf-8?B?SFJBd2FHeFhPTk16RUIyWWhHZG8vUGRiQ1lVNW43a05pMmtneWs3OGE0VVA2?=
 =?utf-8?B?UFppTm9ha0N2RGJvKzlGVWZZOS9KNkVGc3hEWGp0dUltYnJ4WnZxUHpTcExW?=
 =?utf-8?B?alk4SFdkbUxSUzJFTE5uU0NZZWFQMnVVSTZSTkY3K0dXZ2dURW9XNysvL2w5?=
 =?utf-8?Q?7ieL5TKg5+w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM8PR11MB5703.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(8096899003); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UU56dWNKcFIyaWw5N09OMW5xb2RvVVQzcVlrTnlGL1RVUGlWZHk4NWZFQU5G?=
 =?utf-8?B?UFYzR0xvbytmdDZWc0xKNVNuYXFGaTZtOC9qdEpzVkprSUhpcHoxSiszQ0dw?=
 =?utf-8?B?Ulc0dnFDNDE2Mkc2TXB5ZTdsU25oSlZzMGp3THpwMDR3dUFseDJqZnQwNVFu?=
 =?utf-8?B?UVp0UGhvUjc4NU9WZ0h6K2RWWVBKczlKRTRzSVozTXNTVzQxdGdhMVVIQk5z?=
 =?utf-8?B?cnk4dk5pMmhuVXgzbTl5UDl3cEQrSEZuTEdHSmhuVEJhdk5QQ1NjYVZML0dJ?=
 =?utf-8?B?UVhvck1KQTdVZ1I4MmlQb29BMDlCUjNBWXZvUUxEMFhxQzdpN29tcERhRlI5?=
 =?utf-8?B?ZndySEdMZlRKWmdSbGpudVh0OVUzYWVLd1lVb3JwRStleHkyblkvZUtrdlI1?=
 =?utf-8?B?cjM4cVJKaE5hckJYTUx2ZEJ5RmxCU1VQMDR3RVRJR1pBQzlrc3VaZ2MzblJx?=
 =?utf-8?B?SUFDQ0pGVUZCNWZTdURLcEJZbUpBNmN1YnJoUWJDWWxmb3JCaDEwZmM5bnZ1?=
 =?utf-8?B?WWRuM1lvZjhZNDZUblBpQlZtcmgwQXNHc3JVOGRsZjJDYlJYd2VOam0xZXFj?=
 =?utf-8?B?WHprRDdnS294Nzlrc3BLcWNyQ1VlMHhnOWpjL3Vva3JpWE1XRklQdFNnYVRY?=
 =?utf-8?B?RUJiQ2w5dTlOanRjZ0NDTzNROUtKNThzaXZtMFVXcnNDRnJLUjhDeDlXa1Yv?=
 =?utf-8?B?cGZtSGZCV2FXdkFFc0Q2NkNySU1WWDhXZnVZMnRXdmxhSnNyT2VDOWxzOUlw?=
 =?utf-8?B?eEtzdVhnUTVIemhGZXJjdUF6ODdIUkwxb0FYMW1DNTFWazFtYmVycmlpdkI5?=
 =?utf-8?B?aVVaKzdFUzV5MnFVRGxvNk12TzBSc0hoeDhxZEE5NzVZMXVkaHVRd1FkYUo4?=
 =?utf-8?B?d2JVVkNSK1RPOFRHd0F4SzJ0N09KUXNxeXJ1Y2ovaVFlbm4ycG9ZTDBHcy9F?=
 =?utf-8?B?NmNqbitqakxnVDR4dmM5MFk5eThKL3VKZWhxUmN1d2Z6YlpPQ3h2eittdGd5?=
 =?utf-8?B?c0o0czlndHBNNzh2c0NPTldyQmh3ek9uMEpmS1ROSHYreDcxeXAyV0ZuZmF6?=
 =?utf-8?B?OXJFTnFqS0lWaHMySHdPVHREY3BGM2wrM3NkSmd2OFo5ZnU0WjdzK0xOZGtM?=
 =?utf-8?B?MU80aTgyV3BzOWxIMjBnVDMyKzdUdFhwcHI4S0crd2VzOTllaDRYMGRsT21D?=
 =?utf-8?B?ZGhVZkc3djhDMHl2OTlmcDFUWmEzcW02N2NVYmFCcjFFWHN1ZHN6R0hQdUZ4?=
 =?utf-8?B?emtRL3BlYVEwOVZycm0vZ0NjQzAxMDJjRnhJT3gyNkE4UDY0WStEejhkWUM0?=
 =?utf-8?B?V0NFZGJCZ2FpcG9mQm5yem5NVzZST3ZMbHpNODhuZ0VuRjNBNkZoU3EzMnRj?=
 =?utf-8?B?MTh1dGdRaENPMk5rb2oxaUllSDg0T1hHUW9FOXg5MjN4VFI5azVEcURBLzU1?=
 =?utf-8?B?bTArZmtDRWdUcE1kUG5WbFJsYUlld3h4WnVYeHNuWDJrUTM5MUM2bnAyaW9C?=
 =?utf-8?B?QnBpUzhyS2pnRmxuRzBVaFNMUXh3bEIrVXF2TU5xNWdWaE5CRXBxRjJMREY5?=
 =?utf-8?B?b09mbmY1QjliZHNJdGtYL0VhbDBjZkxDcmJ4SDlOSUZqakh0QkpqaUU0b0kw?=
 =?utf-8?B?aG9ROFBEMGdjVEkreVN4TFF2K3U4ZXo0MmwrcURSZW9oN093T01TOHdyaUwy?=
 =?utf-8?B?WnJMVHJMOFYremE0Mng2RmJCbFI0UG9QdmJLWW9Ca1dUKzh5elZEVE1WemVJ?=
 =?utf-8?B?NVpYQ09JTVMydytQQkUyOFByeHZQNUU1Skk4N214S2YraUJGTVI1RjBrTEk3?=
 =?utf-8?B?aDhGZTlPU1hIbm5ldGl4NmdGUUx3UlNMd2lFVk9GOXZVL2htZ2dYZGc0Nmly?=
 =?utf-8?B?Y2sxN3FSdTNtRk1DRnJ0T3hjcFl4MmFwcHhFM205RTlHdXlLRTFFUHRnS01k?=
 =?utf-8?B?ditDcWJZVWgvdTJrTyt3UVFjcjlzZW40ekh3aVNSaGlnbFVUM01ua0VScUxW?=
 =?utf-8?B?MHh6bTM0QWFzMWhBZXh5TjArcWVNeG04SFZ1M2REbzhyWXhtMVNYL3c1MXVq?=
 =?utf-8?B?cVQ1NGNkMUZySWZ1c3Y0OFJKbzMvQTFvK044YldYVWEzbDVrRHVRTFJ6eHE2?=
 =?utf-8?B?Vk9Eb2ZUSzkzdkJHcnFTUFVRUUw4NmtuaURGUUlLQWRmZStwbDYvb256WW5j?=
 =?utf-8?B?QUE9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: a49852cd-9817-4988-754d-08dd8bdd7587
X-MS-Exchange-CrossTenant-AuthSource: DM8PR11MB5703.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 May 2025 14:02:23.6450 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vvm5ymY2kUx9fd8TBhrWL7KGZzSF5bRBurwH5CdtOh3GJi9rswmli8MSrShFk3x1sKnN+Aji1gHPX/U7oUi8xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR11MB5803
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

--------------DouXFSg8RucbKRNhLZ8bpFKW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit


On 02-05-2025 20:32, Nilawar, Badal wrote:
>
>
> On 01-05-2025 02:06, Karthik Poosa wrote:
>> Add support to manage power limits using pcode mailbox commands
>> for supported platforms.
> Please add Fixes: tag here. 
>> Signed-off-by: Karthik Poosa<karthik.poosa@intel.com>
>> ---
>>   drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  10 +-
>>   drivers/gpu/drm/xe/xe_device_types.h     |   4 +
>>   drivers/gpu/drm/xe/xe_hwmon.c            | 348 ++++++++++++++++++-----
>>   drivers/gpu/drm/xe/xe_pci.c              |   5 +
>>   drivers/gpu/drm/xe/xe_pcode.c            |  11 +
>>   drivers/gpu/drm/xe/xe_pcode.h            |   3 +
>>   drivers/gpu/drm/xe/xe_pcode_api.h        |   7 +
>>   7 files changed, 307 insertions(+), 81 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> index f5e5234857c1..5394a1373a6b 100644
>> --- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> +++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
>> @@ -38,10 +38,10 @@
>>   #define   TEMP_MASK				REG_GENMASK(7, 0)
>>   
>>   #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
>> -#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
>> -#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
>> -#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
>> -#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
>> -#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
>> +#define   PWR_LIM_VAL				REG_GENMASK(14, 0)
>> +#define   PWR_LIM_EN				REG_BIT(15)
>> +#define   PWR_LIM_TIME				REG_GENMASK(23, 17)
>> +#define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
>> +#define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
>>   
>>   #endif /* _XE_MCHBAR_REGS_H_ */
>> diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
>> index 495bc00ebed4..2c8321eb41b9 100644
>> --- a/drivers/gpu/drm/xe/xe_device_types.h
>> +++ b/drivers/gpu/drm/xe/xe_device_types.h
>> @@ -326,6 +326,10 @@ struct xe_device {
>>   		u8 has_heci_gscfi:1;
>>   		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
>>   		u8 has_llc:1;
>> +		/** @info.has_mbx_power_limits: Device has support to manage power limits using
>> +		 * pcode mailbox commands.
>> +		 */
>> +		u8 has_mbx_power_limits:1;
>>   		/** @info.has_pxp: Device has PXP support */
>>   		u8 has_pxp:1;
>>   		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
>> diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
>> index eb293aec36a0..b906a1a058e0 100644
>> --- a/drivers/gpu/drm/xe/xe_hwmon.c
>> +++ b/drivers/gpu/drm/xe/xe_hwmon.c
>> @@ -51,6 +51,14 @@ enum xe_fan_channel {
>>   	FAN_MAX,
>>   };
>>   
>> +/*
>> + * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
>> + * not supported and below are SKU units to be used.
>> + */
>> +#define PWR_UNIT	0x3
>> +#define ENERGY_UNIT	0xe
>> +#define TIME_UNIT	0xa
>> +
>>   /*
>>    * SF_* - scale factors for particular quantities according to hwmon spec.
>>    */
>> @@ -60,6 +68,18 @@ enum xe_fan_channel {
>>   #define SF_ENERGY	1000000		/* microjoules */
>>   #define SF_TIME		1000		/* milliseconds */
>>   
>> +/*
>> + * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
>> + */
>> +#define PL1_HWMON_ATTR	hwmon_power_max
>> +
>> +#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? "PL1" : "Invalid")
>> +
>> +/*
>> + * Timeout for power limit write mailbox command.
>> + */
>> +#define PL_WRITE_MBX_TIMEOUT_MS	(1)
>> +
>>   /**
>>    * struct xe_hwmon_energy_info - to accumulate energy
>>    */
>> @@ -100,8 +120,81 @@ struct xe_hwmon {
>>   	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
>>   	/** @fi: Fan info for fanN_input */
>>   	struct xe_hwmon_fan_info fi[FAN_MAX];
>> +	/** @boot_power_limit_read: is boot power limits read */
>> +	bool boot_power_limit_read;
>> +	/** pl1_on_boot: power limit PL1 on boot */
>> +	u32 pl1_on_boot[CHANNEL_MAX];
>>   };
>>   
>> +static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
>> +					   u32 *uval)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	u32 val0 = 0, val1 = 0;
>> +	int ret = 0;
>> +
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>> +						  (channel == CHANNEL_CARD) ?
>> +						  READ_PSYSGPU_POWER_LIMIT :
>> +						  READ_PACKAGE_POWER_LIMIT,
>> +						  hwmon->boot_power_limit_read ?
>> +						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
>> +						  &val0, &val1);
>> +
>> +	if (ret) {
>> +		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +			channel, val0, val1, ret);
>> +		*uval = 0;
>> +		return ret;
>> +	}
>> +
>> +	/* return the value only if limit is enabled */
>> +	if (attr == PL1_HWMON_ATTR)
>> +		*uval = (val0 & PWR_LIM_EN) ? val0 : 0;
>> +	else if (attr == hwmon_power_label)
>> +		*uval = (val0 & PWR_LIM_EN) ? 1 : (val1 & PWR_LIM_EN) ? 1 : 0;
>> +	else
>> +		*uval = 0;
>> +
>> +	return ret;
>> +}
>> +
>> +static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
>> +					    u32 uval)
>> +{
>> +	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon->xe);
>> +	u32 val0, val1;
>> +	int ret = 0;
>> +
>> +	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>> +						  (channel == CHANNEL_CARD) ?
>> +						  READ_PSYSGPU_POWER_LIMIT :
>> +						  READ_PACKAGE_POWER_LIMIT,
>> +						  hwmon->boot_power_limit_read ?
>> +						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
>> +						  &val0, &val1);
>> +
>> +	if (ret)
>> +		drm_dbg(&hwmon->xe->drm, "read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +			channel, val0, val1, ret);
>> +
>> +	if (attr == PL1_HWMON_ATTR)
>> +		val0 = uval;
>> +	else
>> +		return -EIO;
>> +
>> +	drm_dbg(&hwmon->xe->drm, "writing limit val %x channel %d\n", uval, channel);
>> +	ret = xe_pcode_write64_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
>> +							     (channel == CHANNEL_CARD) ?
>> +							     WRITE_PSYSGPU_POWER_LIMIT :
>> +							     WRITE_PACKAGE_POWER_LIMIT, 1),
> Any specific reason to use param2=1? In mbx doc I don't see param2 is 
> needed for power limit write. 

This can be removed, it is valid only for read.

>> +							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
>> +	if (ret)
>> +		drm_dbg(&hwmon->xe->drm, "write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n",
>> +			channel, val0, val1, ret);
>> +	return ret;
>> +}
>> +
>>   static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
>>   				      int channel)
>>   {
>> @@ -181,7 +274,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>   	return XE_REG(0);
>>   }
>>   
>> -#define PL1_DISABLE 0
>> +#define PL_DISABLE 0
>>   
>>   /*
>>    * HW allows arbitrary PL1 limits to be set but silently clamps these values to
>> @@ -189,67 +282,87 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
>>    * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
>>    * clamped values when read.
>>    */
>> -static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>> +static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
>>   {
>>   	u64 reg_val, min, max;
>>   	struct xe_device *xe = hwmon->xe;
>>   	struct xe_reg rapl_limit, pkg_power_sku;
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
>>   
>> -	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> -	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> +	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	/*
>> -	 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
>> -	 * So not checking it again here.
>> -	 */
>> -	if (!xe_reg_is_valid(pkg_power_sku)) {
>> -		drm_warn(&xe->drm, "pkg_power_sku invalid\n");
>> -		*value = 0;
>> -		return;
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&reg_val);
>> +	} else {
>> +		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>> +		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> +
>> +		/*
>> +		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
>> +		 * So not checking it again here.
>> +		 */
>> +		if (!xe_reg_is_valid(pkg_power_sku)) {
>> +			drm_warn(&xe->drm, "pkg_power_sku invalid\n");
>> +			*value = 0;
>> +			goto unlock;
>> +		}
>> +		reg_val = xe_mmio_read32(mmio, rapl_limit);
>>   	}
>>   
>> -	mutex_lock(&hwmon->hwmon_lock);
>> -
>> -	reg_val = xe_mmio_read32(mmio, rapl_limit);
>> -	/* Check if PL1 limit is disabled */
>> -	if (!(reg_val & PKG_PWR_LIM_1_EN)) {
>> -		*value = PL1_DISABLE;
>> +	/* Check if PL limits are disabled */
>> +	if (!(reg_val & PWR_LIM_EN)) {
>> +		*value = PL_DISABLE;
>> +		drm_warn(&hwmon->xe->drm, "%s disabled for channel %d !, val 0x%016llx\n",
>> +			 PWR_ATTR_TO_STR(attr), channel, reg_val);
>>   		goto unlock;
>>   	}
>>   
>> -	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
>> +	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
>>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>>   
>> -	reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
>> -	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		/* No MIN_PWR defined, using boot PL1 as max */
>> +		min = 0;
>
> In my opinion, the pcode clips the values according to the BIOS 
> settings, so should we simply  return value provided by the pcode?
>
I shall check on this.

>> +		max = hwmon->pl1_on_boot[channel] & PWR_LIM_VAL;
>> +	} else {
>> +		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
>> +		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
>> +		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>> +	}
>> +
>>   	min = mul_u64_u32_shr(min, SF_POWER, hwmon->scl_shift_power);
>> -	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
>>   	max = mul_u64_u32_shr(max, SF_POWER, hwmon->scl_shift_power);
>> -
>>   	if (min && max)
>>   		*value = clamp_t(u64, *value, min, max);
>>   unlock:
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   }
>>   
>> -static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
>> +static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	int ret = 0;
>> -	u64 reg_val;
>> +	u32 reg_val;
>>   	struct xe_reg rapl_limit;
>>   
>> +	mutex_lock(&hwmon->hwmon_lock);
>> +
>>   	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
>>   
>> -	mutex_lock(&hwmon->hwmon_lock);
>> +	/* Disable Power Limit and verify, as limit cannot be disabled on all platforms */
>> +	if (value == PL_DISABLE) {
>> +		if (hwmon->xe->info.has_mbx_power_limits) {
>> +			drm_dbg(&hwmon->xe->drm, "disabling %s on channel %d\n",
>> +				PWR_ATTR_TO_STR(attr), channel);
>> +			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
>> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &reg_val);
>> +		} else {
>> +			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
>> +			reg_val = xe_mmio_read32(mmio, rapl_limit);
>> +		}
>>   
>> -	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
>> -	if (value == PL1_DISABLE) {
>> -		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
>> -		reg_val = xe_mmio_read32(mmio, rapl_limit);
>> -		if (reg_val & PKG_PWR_LIM_1_EN) {
>> -			drm_warn(&hwmon->xe->drm, "PL1 disable is not supported!\n");
>> +		if (reg_val & PWR_LIM_EN) {
>> +			drm_warn(&hwmon->xe->drm, "Power limit disable is not supported!\n");
>>   			ret = -EOPNOTSUPP;
>>   		}
>>   		goto unlock;
>> @@ -257,26 +370,38 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
>>   
>>   	/* Computation in 64-bits to avoid overflow. Round to nearest. */
>>   	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value << hwmon->scl_shift_power, SF_POWER);
>> -	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
>> -	reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
>> +	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
>>   
>> +	if (hwmon->xe->info.has_mbx_power_limits)
>> +		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
>> +	else
>> +		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
>> +					reg_val);
>>   unlock:
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   	return ret;
>>   }
>>   
>> -static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
>> +static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
>> +					  long *value)
>>   {
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>> -	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> -	u64 reg_val;
>> +	u32 reg_val;
>> +
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		/* PL1 is rated max if supported */
>> +		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &reg_val);
>> +	} else {
>> +		/*
>> +		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
>> +		 * for this register can be skipped.
>> +		 * See xe_hwmon_power_is_visible.
>> +		 */
>> +		struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
>> +
>> +		reg_val = xe_mmio_read32(mmio, reg);
>> +	}
>>   
>> -	/*
>> -	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
>> -	 * for this register can be skipped.
>> -	 * See xe_hwmon_power_is_visible.
>> -	 */
>> -	reg_val = xe_mmio_read32(mmio, reg);
>>   	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);
>>   	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon->scl_shift_power);
>>   }
>> @@ -330,20 +455,32 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
>>   	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon->xe);
>>   	u32 x, y, x_w = 2; /* 2 bits */
>>   	u64 r, tau4, out;
>> -	int sensor_index = to_sensor_dev_attr(attr)->index;
>> +	int channel = to_sensor_dev_attr(attr)->index;
>> +	u32 power_attr = PL1_HWMON_ATTR;
>> +	int ret = 0;
>>   
>>   	xe_pm_runtime_get(hwmon->xe);
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
>> +		if (ret) {
>> +			drm_err(&hwmon->xe->drm,
>> +				"power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n",
>> +				channel, power_attr, r, ret);
>> +			r = 0;
>> +		}
>> +	} else {
>> +		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
>> +	}
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>>   	xe_pm_runtime_put(hwmon->xe);
>>   
>> -	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
>> -	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
>> +	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
>> +	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
>>   
>>   	/*
>>   	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
>> @@ -373,12 +510,16 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	u64 tau4, r, max_win;
>>   	unsigned long val;
>>   	int ret;
>> -	int sensor_index = to_sensor_dev_attr(attr)->index;
>> +	int channel = to_sensor_dev_attr(attr)->index;
>> +	u32 power_attr = PL1_HWMON_ATTR;
>>   
>>   	ret = kstrtoul(buf, 0, &val);
>>   	if (ret)
>>   		return ret;
>>   
>> +	drm_dbg(&hwmon->xe->drm, "power_max_interval store ch %d, attr %s val 0x%lx\n", channel,
>> +		PWR_ATTR_TO_STR(power_attr), val);
>> +
>>   	/*
>>   	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12.
>>   	 * The hwmon->scl_shift_time default of 0xa results in a max tau of 256 seconds.
>> @@ -400,8 +541,10 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	tau4 = (u64)((1 << x_w) | x) << y;
>>   	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon->scl_shift_time + x_w);
>>   
>> -	if (val > max_win)
>> +	if (val > max_win) {
>> +		drm_warn(&hwmon->xe->drm, "power_interval invalid val 0x%lx\n", val);
>>   		return -EINVAL;
>> +	}
>>   
>>   	/* val in hw units */
>>   	val = DIV_ROUND_CLOSEST_ULL((u64)val << hwmon->scl_shift_time, SF_TIME);
>> @@ -419,14 +562,22 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   		x = (val - (1ul << y)) << x_w >> y;
>>   	}
>>   
>> -	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
>> +	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
>> +			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
>>   
>>   	xe_pm_runtime_get(hwmon->xe);
>>   
>>   	mutex_lock(&hwmon->hwmon_lock);
>>   
>> -	r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
>> -			  PKG_PWR_LIM_1_TIME, rxy);
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&r);
>> +		r = (r & ~PWR_LIM_TIME) | rxy;
>> +		drm_dbg(&hwmon->xe->drm, "power_max_interval store ch %d rxy 0x%x\n", channel, rxy);
>> +		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
>> +	} else {
>> +		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
>> +				  PWR_LIM_TIME, rxy);
>> +	}
>>   
>>   	mutex_unlock(&hwmon->hwmon_lock);
>>   
>> @@ -435,6 +586,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
>>   	return count;
>>   }
>>   
>> +/* PSYS PL1 */
>>   static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
>>   			  xe_hwmon_power_max_interval_show,
>>   			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
>> @@ -455,10 +607,19 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
>>   	struct device *dev = kobj_to_dev(kobj);
>>   	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
>>   	int ret = 0;
>> +	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
>> +	u32 power_attr = PL1_HWMON_ATTR;
>> +	u32 uval;
>>   
>>   	xe_pm_runtime_get(hwmon->xe);
>>   
>> -	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr->mode : 0;
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &uval);
>> +		ret = (uval & PWR_LIM_EN) ? attr->mode : 0;
>> +	} else {
>> +		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +						       channel)) ? attr->mode : 0;
>> +	}
>>   
>>   	xe_pm_runtime_put(hwmon->xe);
>>   
>> @@ -604,19 +765,27 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
>>   
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>> +		if (hwmon->xe->info.has_mbx_power_limits) {
>> +			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &uval);
>> +			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;
> In this code block this check is unnecessary.
yes, will remove it.
>> +		} else {
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
>>   				       channel)) ? 0664 : 0;
>> +		}
>>   	case hwmon_power_rated_max:
>> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>> -				       channel)) ? 0444 : 0;
>> +		if (hwmon->xe->info.has_mbx_power_limits)
>> +			return 0;
>> +		else
>> +			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
>> +					       channel)) ? 0444 : 0;
>>   	case hwmon_power_crit:
>> -		if (channel == CHANNEL_PKG)
>> -			return (xe_hwmon_pcode_read_i1(hwmon, &uval) ||
>> -				!(uval & POWER_SETUP_I1_WATTS)) ? 0 : 0644;
>> -		break;
>>   	case hwmon_power_label:
>> -		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
>> -				       channel)) ? 0444 : 0;
>> +		if (channel == CHANNEL_PKG) {
>> +			xe_hwmon_pcode_read_i1(hwmon, &uval);
>> +			return (uval & POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
>> +				0444 : 0644 : 0;
> In this code block this check is unnecessary. 

Here it is needed, because case defintion is same hwmon_power_crit and 
hwmon_power_label

and for case for label we dont have write permission.

>> +		}
>> +		break;
>>   	default:
>>   		return 0;
>>   	}
>> @@ -628,10 +797,10 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
>>   {
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> -		xe_hwmon_power_max_read(hwmon, channel, val);
>> +		xe_hwmon_power_max_read(hwmon, attr, channel, val);
>>   		return 0;
>>   	case hwmon_power_rated_max:
>> -		xe_hwmon_power_rated_max_read(hwmon, channel, val);
>> +		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
>>   		return 0;
>>   	case hwmon_power_crit:
>>   		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
>> @@ -645,7 +814,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
>>   {
>>   	switch (attr) {
>>   	case hwmon_power_max:
>> -		return xe_hwmon_power_max_write(hwmon, channel, val);
>> +		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
>>   	case hwmon_power_crit:
>>   		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
>>   	default:
>> @@ -965,18 +1134,45 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
>>   	int channel;
>>   	struct xe_reg pkg_power_sku_unit;
>>   
>> -	/*
>> -	 * The contents of register PKG_POWER_SKU_UNIT do not change,
>> -	 * so read it once and store the shift values.
>> -	 */
>> -	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
>> -	if (xe_reg_is_valid(pkg_power_sku_unit)) {
>> -		val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
>> -		hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>> -		hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>> -		hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>> +	if (hwmon->xe->info.has_mbx_power_limits) {
>> +		/* Check if mailbox power limits commands are supported by the firmware */
>> +		if (!xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
>> +						     &hwmon->pl1_on_boot[CHANNEL_CARD])) {
>> +			/* Read all default power limits */
>> +			if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
>> +							    &hwmon->pl1_on_boot[CHANNEL_PKG])) {
>> +				drm_warn(&hwmon->xe->drm, "Failed to read pkg power limit\n");
>> +			} else {
>> +				/* Write default limits to read from pcode from now on */
>> +				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
>> +								 CHANNEL_CARD,
>> +								 hwmon->pl1_on_boot[CHANNEL_CARD]);
>> +				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
>> +								 hwmon->pl1_on_boot[CHANNEL_PKG]);
>> +
>> +				hwmon->scl_shift_power = PWR_UNIT;
>> +				hwmon->scl_shift_energy = ENERGY_UNIT;
>> +				hwmon->scl_shift_time = TIME_UNIT;
>> +				drm_info(&hwmon->xe->drm, "Using mailbox commands for power limits\n");
>> +				hwmon->boot_power_limit_read = true;
>> +			}
>> +		} else {
>> +			drm_warn(&hwmon->xe->drm, "Failed to read power limits, check firmware !\n");
> s/check firmware/check card firmware/ ?
>> +		}
>
> Could you please simplify this if else block.
>
> 	if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
> 					     &hwmon->pl1_on_boot[CHANNEL_CARD])) {
> 		drm_warn;
> 		return;
> 	} 	if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
> 					     &hwmon->pl1_on_boot[CHANNEL_PKG])) {
> 		drm_warn;
> 		return;
> 	}
>           update default values.
>
> Regards,
> Badal
>> +	} else {
>> +		drm_info(&hwmon->xe->drm, "Using register for power limits\n");
>> +		/*
>> +		 * The contents of register PKG_POWER_SKU_UNIT do not change,
>> +		 * so read it once and store the shift values.
>> +		 */
>> +		pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
>> +		if (xe_reg_is_valid(pkg_power_sku_unit)) {
>> +			val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
>> +			hwmon->scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
>> +			hwmon->scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
>> +			hwmon->scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
>> +		}
>>   	}
>> -
>>   	/*
>>   	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
>>   	 * first value of the energy register read
>> diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
>> index 882398e09b7e..95a2a458e8f7 100644
>> --- a/drivers/gpu/drm/xe/xe_pci.c
>> +++ b/drivers/gpu/drm/xe/xe_pci.c
>> @@ -66,6 +66,7 @@ struct xe_device_desc {
>>   	u8 has_heci_gscfi:1;
>>   	u8 has_heci_cscfi:1;
>>   	u8 has_llc:1;
>> +	u8 has_mbx_power_limits:1;
>>   	u8 has_pxp:1;
>>   	u8 has_sriov:1;
>>   	u8 needs_scratch:1;
>> @@ -305,6 +306,7 @@ static const struct xe_device_desc dg2_desc = {
>>   	DG2_FEATURES,
>>   	.has_display = true,
>>   	.has_fan_control = true,
>> +	.has_mbx_power_limits = false,
>>   };
>>   
>>   static const __maybe_unused struct xe_device_desc pvc_desc = {
>> @@ -316,6 +318,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
>>   	.has_heci_gscfi = 1,
>>   	.max_remote_tiles = 1,
>>   	.require_force_probe = true,
>> +	.has_mbx_power_limits = false,
>>   };
>>   
>>   static const struct xe_device_desc mtl_desc = {
>> @@ -341,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
>>   	.dma_mask_size = 46,
>>   	.has_display = true,
>>   	.has_fan_control = true,
>> +	.has_mbx_power_limits = true,
>>   	.has_heci_cscfi = 1,
>>   	.needs_scratch = true,
>>   };
>> @@ -583,6 +587,7 @@ static int xe_info_init_early(struct xe_device *xe,
>>   	xe->info.dma_mask_size = desc->dma_mask_size;
>>   	xe->info.is_dgfx = desc->is_dgfx;
>>   	xe->info.has_fan_control = desc->has_fan_control;
>> +	xe->info.has_mbx_power_limits = desc->has_mbx_power_limits;
>>   	xe->info.has_heci_gscfi = desc->has_heci_gscfi;
>>   	xe->info.has_heci_cscfi = desc->has_heci_cscfi;
>>   	xe->info.has_llc = desc->has_llc;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
>> index cf955b3ed52c..9189117fe825 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.c
>> +++ b/drivers/gpu/drm/xe/xe_pcode.c
>> @@ -109,6 +109,17 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
>>   	return err;
>>   }
>>   
>> +int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
>> +{
>> +	int err;
>> +
>> +	mutex_lock(&tile->pcode.lock);
>> +	err = pcode_mailbox_rw(tile, mbox, &data0, &data1, timeout, false, false);
>> +	mutex_unlock(&tile->pcode.lock);
>> +
>> +	return err;
>> +}
>> +
>>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
>>   {
>>   	int err;
>> diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
>> index ba33991d72a7..de38f44f3201 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode.h
>> @@ -18,6 +18,9 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
>>   int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
>>   int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
>>   			   int timeout_ms);
>> +int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
>> +			     u32 data1, int timeout);
>> +
>>   #define xe_pcode_write(tile, mbox, val) \
>>   	xe_pcode_write_timeout(tile, mbox, val, 1)
>>   
>> diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
>> index e622ae17f08d..8c8be7c5f47b 100644
>> --- a/drivers/gpu/drm/xe/xe_pcode_api.h
>> +++ b/drivers/gpu/drm/xe/xe_pcode_api.h
>> @@ -42,6 +42,13 @@
>>   #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
>>   #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
>>   
>> +#define	READ_PSYSGPU_POWER_LIMIT		0x6
>> +#define	WRITE_PSYSGPU_POWER_LIMIT		0x7
>> +#define	READ_PACKAGE_POWER_LIMIT		0x8
>> +#define	WRITE_PACKAGE_POWER_LIMIT		0x9
>> +#define	READ_PL_FROM_BIOS			0x1
>> +#define	READ_PL_FROM_PCODE			0x0
>> +
>>   #define   PCODE_FREQUENCY_CONFIG		0x6e
>>   /* Frequency Config Sub Commands (param1) */
>>   #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
--------------DouXFSg8RucbKRNhLZ8bpFKW
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 8bit

<!DOCTYPE html><html><head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
  </head>
  <body>
    <p><br>
    </p>
    <div class="moz-cite-prefix">On 02-05-2025 20:32, Nilawar, Badal
      wrote:<br>
    </div>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      
      <p><br>
      </p>
      <div class="moz-cite-prefix">On 01-05-2025 02:06, Karthik Poosa
        wrote:<br>
      </div>
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">Add support to manage power limits using pcode mailbox commands
for supported platforms.</pre>
      </blockquote>
      Please add Fixes: tag here. </blockquote>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">Signed-off-by: Karthik Poosa <a class="moz-txt-link-rfc2396E" href="mailto:karthik.poosa@intel.com" moz-do-not-send="true">&lt;karthik.poosa@intel.com&gt;</a>
---
 drivers/gpu/drm/xe/regs/xe_mchbar_regs.h |  10 +-
 drivers/gpu/drm/xe/xe_device_types.h     |   4 +
 drivers/gpu/drm/xe/xe_hwmon.c            | 348 ++++++++++++++++++-----
 drivers/gpu/drm/xe/xe_pci.c              |   5 +
 drivers/gpu/drm/xe/xe_pcode.c            |  11 +
 drivers/gpu/drm/xe/xe_pcode.h            |   3 +
 drivers/gpu/drm/xe/xe_pcode_api.h        |   7 +
 7 files changed, 307 insertions(+), 81 deletions(-)

diff --git a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
index f5e5234857c1..5394a1373a6b 100644
--- a/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
+++ b/drivers/gpu/drm/xe/regs/xe_mchbar_regs.h
@@ -38,10 +38,10 @@
 #define   TEMP_MASK				REG_GENMASK(7, 0)
 
 #define PCU_CR_PACKAGE_RAPL_LIMIT		XE_REG(MCHBAR_MIRROR_BASE_SNB + 0x59a0)
-#define   PKG_PWR_LIM_1				REG_GENMASK(14, 0)
-#define   PKG_PWR_LIM_1_EN			REG_BIT(15)
-#define   PKG_PWR_LIM_1_TIME			REG_GENMASK(23, 17)
-#define   PKG_PWR_LIM_1_TIME_X			REG_GENMASK(23, 22)
-#define   PKG_PWR_LIM_1_TIME_Y			REG_GENMASK(21, 17)
+#define   PWR_LIM_VAL				REG_GENMASK(14, 0)
+#define   PWR_LIM_EN				REG_BIT(15)
+#define   PWR_LIM_TIME				REG_GENMASK(23, 17)
+#define   PWR_LIM_TIME_X			REG_GENMASK(23, 22)
+#define   PWR_LIM_TIME_Y			REG_GENMASK(21, 17)
 
 #endif /* _XE_MCHBAR_REGS_H_ */
diff --git a/drivers/gpu/drm/xe/xe_device_types.h b/drivers/gpu/drm/xe/xe_device_types.h
index 495bc00ebed4..2c8321eb41b9 100644
--- a/drivers/gpu/drm/xe/xe_device_types.h
+++ b/drivers/gpu/drm/xe/xe_device_types.h
@@ -326,6 +326,10 @@ struct xe_device {
 		u8 has_heci_gscfi:1;
 		/** @info.has_llc: Device has a shared CPU+GPU last level cache */
 		u8 has_llc:1;
+		/** @info.has_mbx_power_limits: Device has support to manage power limits using
+		 * pcode mailbox commands.
+		 */
+		u8 has_mbx_power_limits:1;
 		/** @info.has_pxp: Device has PXP support */
 		u8 has_pxp:1;
 		/** @info.has_range_tlb_invalidation: Has range based TLB invalidations */
diff --git a/drivers/gpu/drm/xe/xe_hwmon.c b/drivers/gpu/drm/xe/xe_hwmon.c
index eb293aec36a0..b906a1a058e0 100644
--- a/drivers/gpu/drm/xe/xe_hwmon.c
+++ b/drivers/gpu/drm/xe/xe_hwmon.c
@@ -51,6 +51,14 @@ enum xe_fan_channel {
 	FAN_MAX,
 };
 
+/*
+ * For platforms that support mailbox commands for power limits, REG_PKG_POWER_SKU_UNIT is
+ * not supported and below are SKU units to be used.
+ */
+#define PWR_UNIT	0x3
+#define ENERGY_UNIT	0xe
+#define TIME_UNIT	0xa
+
 /*
  * SF_* - scale factors for particular quantities according to hwmon spec.
  */
@@ -60,6 +68,18 @@ enum xe_fan_channel {
 #define SF_ENERGY	1000000		/* microjoules */
 #define SF_TIME		1000		/* milliseconds */
 
+/*
+ * PL*_HWMON_ATTR - mapping of hardware power limits to corresponding hwmon power attribute.
+ */
+#define PL1_HWMON_ATTR	hwmon_power_max
+
+#define PWR_ATTR_TO_STR(attr)	(((attr) == hwmon_power_max) ? &quot;PL1&quot; : &quot;Invalid&quot;)
+
+/*
+ * Timeout for power limit write mailbox command.
+ */
+#define PL_WRITE_MBX_TIMEOUT_MS	(1)
+
 /**
  * struct xe_hwmon_energy_info - to accumulate energy
  */
@@ -100,8 +120,81 @@ struct xe_hwmon {
 	struct xe_hwmon_energy_info ei[CHANNEL_MAX];
 	/** @fi: Fan info for fanN_input */
 	struct xe_hwmon_fan_info fi[FAN_MAX];
+	/** @boot_power_limit_read: is boot power limits read */
+	bool boot_power_limit_read;
+	/** pl1_on_boot: power limit PL1 on boot */
+	u32 pl1_on_boot[CHANNEL_MAX];
 };
 
+static int xe_hwmon_pcode_read_power_limit(const struct xe_hwmon *hwmon, u32 attr, int channel,
+					   u32 *uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	u32 val0 = 0, val1 = 0;
+	int ret = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+						  (channel == CHANNEL_CARD) ?
+						  READ_PSYSGPU_POWER_LIMIT :
+						  READ_PACKAGE_POWER_LIMIT,
+						  hwmon-&gt;boot_power_limit_read ?
+						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
+						  &amp;val0, &amp;val1);
+
+	if (ret) {
+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
+			channel, val0, val1, ret);
+		*uval = 0;
+		return ret;
+	}
+
+	/* return the value only if limit is enabled */
+	if (attr == PL1_HWMON_ATTR)
+		*uval = (val0 &amp; PWR_LIM_EN) ? val0 : 0;
+	else if (attr == hwmon_power_label)
+		*uval = (val0 &amp; PWR_LIM_EN) ? 1 : (val1 &amp; PWR_LIM_EN) ? 1 : 0;
+	else
+		*uval = 0;
+
+	return ret;
+}
+
+static int xe_hwmon_pcode_write_power_limit(const struct xe_hwmon *hwmon, u32 attr, u8 channel,
+					    u32 uval)
+{
+	struct xe_tile *root_tile = xe_device_get_root_tile(hwmon-&gt;xe);
+	u32 val0, val1;
+	int ret = 0;
+
+	ret = xe_pcode_read(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+						  (channel == CHANNEL_CARD) ?
+						  READ_PSYSGPU_POWER_LIMIT :
+						  READ_PACKAGE_POWER_LIMIT,
+						  hwmon-&gt;boot_power_limit_read ?
+						  READ_PL_FROM_PCODE : READ_PL_FROM_BIOS),
+						  &amp;val0, &amp;val1);
+
+	if (ret)
+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;read failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
+			channel, val0, val1, ret);
+
+	if (attr == PL1_HWMON_ATTR)
+		val0 = uval;
+	else
+		return -EIO;
+
+	drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;writing limit val %x channel %d\n&quot;, uval, channel);
+	ret = xe_pcode_write64_timeout(root_tile, PCODE_MBOX(PCODE_POWER_SETUP,
+							     (channel == CHANNEL_CARD) ?
+							     WRITE_PSYSGPU_POWER_LIMIT :
+							     WRITE_PACKAGE_POWER_LIMIT, 1),</pre>
      </blockquote>
      Any specific reason to use param2=1? In mbx doc I don't see param2
      is needed for power limit write. </blockquote>
    <p>This can be removed, it is valid only for read.</p>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+							     val0, val1, PL_WRITE_MBX_TIMEOUT_MS);
+	if (ret)
+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;write failed ch %d val0 0x%08x, val1 0x%08x, ret %d\n&quot;,
+			channel, val0, val1, ret);
+	return ret;
+}
+
 static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg hwmon_reg,
 				      int channel)
 {
@@ -181,7 +274,7 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
 	return XE_REG(0);
 }
 
-#define PL1_DISABLE 0
+#define PL_DISABLE 0
 
 /*
  * HW allows arbitrary PL1 limits to be set but silently clamps these values to
@@ -189,67 +282,87 @@ static struct xe_reg xe_hwmon_get_reg(struct xe_hwmon *hwmon, enum xe_hwmon_reg
  * same pattern for sysfs, allow arbitrary PL1 limits to be set but display
  * clamped values when read.
  */
-static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, int channel, long *value)
+static void xe_hwmon_power_max_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *value)
 {
 	u64 reg_val, min, max;
 	struct xe_device *xe = hwmon-&gt;xe;
 	struct xe_reg rapl_limit, pkg_power_sku;
 	struct xe_mmio *mmio = xe_root_tile_mmio(xe);
 
-	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
-	pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
-	/*
-	 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
-	 * So not checking it again here.
-	 */
-	if (!xe_reg_is_valid(pkg_power_sku)) {
-		drm_warn(&amp;xe-&gt;drm, &quot;pkg_power_sku invalid\n&quot;);
-		*value = 0;
-		return;
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, (u32 *)&amp;reg_val);
+	} else {
+		rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
+		pkg_power_sku = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+		/*
+		 * Valid check of REG_PKG_RAPL_LIMIT is already done in xe_hwmon_power_is_visible.
+		 * So not checking it again here.
+		 */
+		if (!xe_reg_is_valid(pkg_power_sku)) {
+			drm_warn(&amp;xe-&gt;drm, &quot;pkg_power_sku invalid\n&quot;);
+			*value = 0;
+			goto unlock;
+		}
+		reg_val = xe_mmio_read32(mmio, rapl_limit);
 	}
 
-	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
-
-	reg_val = xe_mmio_read32(mmio, rapl_limit);
-	/* Check if PL1 limit is disabled */
-	if (!(reg_val &amp; PKG_PWR_LIM_1_EN)) {
-		*value = PL1_DISABLE;
+	/* Check if PL limits are disabled */
+	if (!(reg_val &amp; PWR_LIM_EN)) {
+		*value = PL_DISABLE;
+		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;%s disabled for channel %d !, val 0x%016llx\n&quot;,
+			 PWR_ATTR_TO_STR(attr), channel, reg_val);
 		goto unlock;
 	}
 
-	reg_val = REG_FIELD_GET(PKG_PWR_LIM_1, reg_val);
+	reg_val = REG_FIELD_GET(PWR_LIM_VAL, reg_val);
 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon-&gt;scl_shift_power);
 
-	reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
-	min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		/* No MIN_PWR defined, using boot PL1 as max */
+		min = 0;</pre>
      </blockquote>
      <p>In my opinion, the pcode clips the values according to the BIOS
        settings, so should we simply&nbsp; return value provided by the
        pcode?</p>
    </blockquote>
    <p>I shall check on this.</p>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+		max = hwmon-&gt;pl1_on_boot[channel] &amp; PWR_LIM_VAL;
+	} else {
+		reg_val = xe_mmio_read64_2x32(mmio, pkg_power_sku);
+		min = REG_FIELD_GET(PKG_MIN_PWR, reg_val);
+		max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
+	}
+
 	min = mul_u64_u32_shr(min, SF_POWER, hwmon-&gt;scl_shift_power);
-	max = REG_FIELD_GET(PKG_MAX_PWR, reg_val);
 	max = mul_u64_u32_shr(max, SF_POWER, hwmon-&gt;scl_shift_power);
-
 	if (min &amp;&amp; max)
 		*value = clamp_t(u64, *value, min, max);
 unlock:
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 }
 
-static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long value)
+static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, u32 attr, int channel, long value)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 	int ret = 0;
-	u64 reg_val;
+	u32 reg_val;
 	struct xe_reg rapl_limit;
 
+	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
+
 	rapl_limit = xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel);
 
-	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
+	/* Disable Power Limit and verify, as limit cannot be disabled on all platforms */
+	if (value == PL_DISABLE) {
+		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+			drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;disabling %s on channel %d\n&quot;,
+				PWR_ATTR_TO_STR(attr), channel);
+			xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, 0);
+			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &amp;reg_val);
+		} else {
+			reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN, 0);
+			reg_val = xe_mmio_read32(mmio, rapl_limit);
+		}
 
-	/* Disable PL1 limit and verify, as limit cannot be disabled on all platforms */
-	if (value == PL1_DISABLE) {
-		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN, 0);
-		reg_val = xe_mmio_read32(mmio, rapl_limit);
-		if (reg_val &amp; PKG_PWR_LIM_1_EN) {
-			drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;PL1 disable is not supported!\n&quot;);
+		if (reg_val &amp; PWR_LIM_EN) {
+			drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;Power limit disable is not supported!\n&quot;);
 			ret = -EOPNOTSUPP;
 		}
 		goto unlock;
@@ -257,26 +370,38 @@ static int xe_hwmon_power_max_write(struct xe_hwmon *hwmon, int channel, long va
 
 	/* Computation in 64-bits to avoid overflow. Round to nearest. */
 	reg_val = DIV_ROUND_CLOSEST_ULL((u64)value &lt;&lt; hwmon-&gt;scl_shift_power, SF_POWER);
-	reg_val = PKG_PWR_LIM_1_EN | REG_FIELD_PREP(PKG_PWR_LIM_1, reg_val);
-	reg_val = xe_mmio_rmw32(mmio, rapl_limit, PKG_PWR_LIM_1_EN | PKG_PWR_LIM_1, reg_val);
+	reg_val = PWR_LIM_EN | REG_FIELD_PREP(PWR_LIM_VAL, reg_val);
 
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits)
+		ret = xe_hwmon_pcode_write_power_limit(hwmon, attr, channel, reg_val);
+	else
+		reg_val = xe_mmio_rmw32(mmio, rapl_limit, PWR_LIM_EN | PWR_LIM_VAL,
+					reg_val);
 unlock:
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 	return ret;
 }
 
-static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, int channel, long *value)
+static void xe_hwmon_power_rated_max_read(struct xe_hwmon *hwmon, u32 attr, int channel,
+					  long *value)
 {
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
-	struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
-	u64 reg_val;
+	u32 reg_val;
+
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		/* PL1 is rated max if supported */
+		xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, channel, &amp;reg_val);
+	} else {
+		/*
+		 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
+		 * for this register can be skipped.
+		 * See xe_hwmon_power_is_visible.
+		 */
+		struct xe_reg reg = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU, channel);
+
+		reg_val = xe_mmio_read32(mmio, reg);
+	}
 
-	/*
-	 * This sysfs file won't be visible if REG_PKG_POWER_SKU is invalid, so valid check
-	 * for this register can be skipped.
-	 * See xe_hwmon_power_is_visible.
-	 */
-	reg_val = xe_mmio_read32(mmio, reg);
 	reg_val = REG_FIELD_GET(PKG_TDP, reg_val);</pre>
      </blockquote>
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre"> 	*value = mul_u64_u32_shr(reg_val, SF_POWER, hwmon-&gt;scl_shift_power);
 }
@@ -330,20 +455,32 @@ xe_hwmon_power_max_interval_show(struct device *dev, struct device_attribute *at
 	struct xe_mmio *mmio = xe_root_tile_mmio(hwmon-&gt;xe);
 	u32 x, y, x_w = 2; /* 2 bits */
 	u64 r, tau4, out;
-	int sensor_index = to_sensor_dev_attr(attr)-&gt;index;
+	int channel = to_sensor_dev_attr(attr)-&gt;index;
+	u32 power_attr = PL1_HWMON_ATTR;
+	int ret = 0;
 
 	xe_pm_runtime_get(hwmon-&gt;xe);
 
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
-	r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index));
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&amp;r);
+		if (ret) {
+			drm_err(&amp;hwmon-&gt;xe-&gt;drm,
+				&quot;power interval read fail, ch %d, attr %d, r 0%llx, ret %d\n&quot;,
+				channel, power_attr, r, ret);
+			r = 0;
+		}
+	} else {
+		r = xe_mmio_read32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel));
+	}
 
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
 	xe_pm_runtime_put(hwmon-&gt;xe);
 
-	x = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_X, r);
-	y = REG_FIELD_GET(PKG_PWR_LIM_1_TIME_Y, r);
+	x = REG_FIELD_GET(PWR_LIM_TIME_X, r);
+	y = REG_FIELD_GET(PWR_LIM_TIME_Y, r);
 
 	/*
 	 * tau = 1.x * power(2,y), x = bits(23:22), y = bits(21:17)
@@ -373,12 +510,16 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	u64 tau4, r, max_win;
 	unsigned long val;
 	int ret;
-	int sensor_index = to_sensor_dev_attr(attr)-&gt;index;
+	int channel = to_sensor_dev_attr(attr)-&gt;index;
+	u32 power_attr = PL1_HWMON_ATTR;
 
 	ret = kstrtoul(buf, 0, &amp;val);
 	if (ret)
 		return ret;
 
+	drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;power_max_interval store ch %d, attr %s val 0x%lx\n&quot;, channel,
+		PWR_ATTR_TO_STR(power_attr), val);
+
 	/*
 	 * Max HW supported tau in '1.x * power(2,y)' format, x = 0, y = 0x12.
 	 * The hwmon-&gt;scl_shift_time default of 0xa results in a max tau of 256 seconds.
@@ -400,8 +541,10 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	tau4 = (u64)((1 &lt;&lt; x_w) | x) &lt;&lt; y;
 	max_win = mul_u64_u32_shr(tau4, SF_TIME, hwmon-&gt;scl_shift_time + x_w);
 
-	if (val &gt; max_win)
+	if (val &gt; max_win) {
+		drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;power_interval invalid val 0x%lx\n&quot;, val);
 		return -EINVAL;
+	}
 
 	/* val in hw units */
 	val = DIV_ROUND_CLOSEST_ULL((u64)val &lt;&lt; hwmon-&gt;scl_shift_time, SF_TIME);
@@ -419,14 +562,22 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 		x = (val - (1ul &lt;&lt; y)) &lt;&lt; x_w &gt;&gt; y;
 	}
 
-	rxy = REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_X, x) | REG_FIELD_PREP(PKG_PWR_LIM_1_TIME_Y, y);
+	rxy = REG_FIELD_PREP(PWR_LIM_TIME_X, x) |
+			       REG_FIELD_PREP(PWR_LIM_TIME_Y, y);
 
 	xe_pm_runtime_get(hwmon-&gt;xe);
 
 	mutex_lock(&amp;hwmon-&gt;hwmon_lock);
 
-	r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, sensor_index),
-			  PKG_PWR_LIM_1_TIME, rxy);
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		ret = xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, (u32 *)&amp;r);
+		r = (r &amp; ~PWR_LIM_TIME) | rxy;
+		drm_dbg(&amp;hwmon-&gt;xe-&gt;drm, &quot;power_max_interval store ch %d rxy 0x%x\n&quot;, channel, rxy);
+		xe_hwmon_pcode_write_power_limit(hwmon, power_attr, channel, r);
+	} else {
+		r = xe_mmio_rmw32(mmio, xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, channel),
+				  PWR_LIM_TIME, rxy);
+	}
 
 	mutex_unlock(&amp;hwmon-&gt;hwmon_lock);
 
@@ -435,6 +586,7 @@ xe_hwmon_power_max_interval_store(struct device *dev, struct device_attribute *a
 	return count;
 }
 
+/* PSYS PL1 */
 static SENSOR_DEVICE_ATTR(power1_max_interval, 0664,
 			  xe_hwmon_power_max_interval_show,
 			  xe_hwmon_power_max_interval_store, CHANNEL_CARD);
@@ -455,10 +607,19 @@ static umode_t xe_hwmon_attributes_visible(struct kobject *kobj,
 	struct device *dev = kobj_to_dev(kobj);
 	struct xe_hwmon *hwmon = dev_get_drvdata(dev);
 	int ret = 0;
+	int channel = index ? CHANNEL_PKG : CHANNEL_CARD;
+	u32 power_attr = PL1_HWMON_ATTR;
+	u32 uval;
 
 	xe_pm_runtime_get(hwmon-&gt;xe);
 
-	ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT, index)) ? attr-&gt;mode : 0;
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		xe_hwmon_pcode_read_power_limit(hwmon, power_attr, channel, &amp;uval);
+		ret = (uval &amp; PWR_LIM_EN) ? attr-&gt;mode : 0;
+	} else {
+		ret = xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+						       channel)) ? attr-&gt;mode : 0;
+	}
 
 	xe_pm_runtime_put(hwmon-&gt;xe);
 
@@ -604,19 +765,27 @@ xe_hwmon_power_is_visible(struct xe_hwmon *hwmon, u32 attr, int channel)
 
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
+		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+			xe_hwmon_pcode_read_power_limit(hwmon, attr, channel, &amp;uval);
+			return (uval) ? (attr == hwmon_power_label) ? 0444 : 0664 : 0;</pre>
      </blockquote>
      In this code block this check is unnecessary. <br>
    </blockquote>
    yes, will remove it.
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+		} else {
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_RAPL_LIMIT,
 				       channel)) ? 0664 : 0;
+		}
 	case hwmon_power_rated_max:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
-				       channel)) ? 0444 : 0;
+		if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits)
+			return 0;
+		else
+			return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU,
+					       channel)) ? 0444 : 0;
 	case hwmon_power_crit:
-		if (channel == CHANNEL_PKG)
-			return (xe_hwmon_pcode_read_i1(hwmon, &amp;uval) ||
-				!(uval &amp; POWER_SETUP_I1_WATTS)) ? 0 : 0644;
-		break;
 	case hwmon_power_label:
-		return xe_reg_is_valid(xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT,
-				       channel)) ? 0444 : 0;
+		if (channel == CHANNEL_PKG) {
+			xe_hwmon_pcode_read_i1(hwmon, &amp;uval);
+			return (uval &amp; POWER_SETUP_I1_WATTS) ? (attr == hwmon_power_label) ?
+				0444 : 0644 : 0;</pre>
      </blockquote>
      In this code block this check is unnecessary. </blockquote>
    <p>Here it is needed, because case defintion is same <span style="white-space: pre-wrap">hwmon_power_crit</span> and <span style="white-space: pre-wrap">hwmon_power_label</span></p>
    <p>and for case for label we dont have write permission.</p>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+		}
+		break;
 	default:
 		return 0;
 	}
@@ -628,10 +797,10 @@ xe_hwmon_power_read(struct xe_hwmon *hwmon, u32 attr, int channel, long *val)
 {
 	switch (attr) {
 	case hwmon_power_max:
-		xe_hwmon_power_max_read(hwmon, channel, val);
+		xe_hwmon_power_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_rated_max:
-		xe_hwmon_power_rated_max_read(hwmon, channel, val);
+		xe_hwmon_power_rated_max_read(hwmon, attr, channel, val);
 		return 0;
 	case hwmon_power_crit:
 		return xe_hwmon_power_curr_crit_read(hwmon, channel, val, SF_POWER);
@@ -645,7 +814,7 @@ xe_hwmon_power_write(struct xe_hwmon *hwmon, u32 attr, int channel, long val)
 {
 	switch (attr) {
 	case hwmon_power_max:
-		return xe_hwmon_power_max_write(hwmon, channel, val);
+		return xe_hwmon_power_max_write(hwmon, attr, channel, val);
 	case hwmon_power_crit:
 		return xe_hwmon_power_curr_crit_write(hwmon, channel, val, SF_POWER);
 	default:
@@ -965,18 +1134,45 @@ xe_hwmon_get_preregistration_info(struct xe_hwmon *hwmon)
 	int channel;
 	struct xe_reg pkg_power_sku_unit;
 
-	/*
-	 * The contents of register PKG_POWER_SKU_UNIT do not change,
-	 * so read it once and store the shift values.
-	 */
-	pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
-	if (xe_reg_is_valid(pkg_power_sku_unit)) {
-		val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
-		hwmon-&gt;scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
-		hwmon-&gt;scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
-		hwmon-&gt;scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
+	if (hwmon-&gt;xe-&gt;info.has_mbx_power_limits) {
+		/* Check if mailbox power limits commands are supported by the firmware */
+		if (!xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
+						     &amp;hwmon-&gt;pl1_on_boot[CHANNEL_CARD])) {
+			/* Read all default power limits */
+			if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+							    &amp;hwmon-&gt;pl1_on_boot[CHANNEL_PKG])) {
+				drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;Failed to read pkg power limit\n&quot;);
+			} else {
+				/* Write default limits to read from pcode from now on */
+				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR,
+								 CHANNEL_CARD,
+								 hwmon-&gt;pl1_on_boot[CHANNEL_CARD]);
+				xe_hwmon_pcode_write_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
+								 hwmon-&gt;pl1_on_boot[CHANNEL_PKG]);
+
+				hwmon-&gt;scl_shift_power = PWR_UNIT;
+				hwmon-&gt;scl_shift_energy = ENERGY_UNIT;
+				hwmon-&gt;scl_shift_time = TIME_UNIT;
+				drm_info(&amp;hwmon-&gt;xe-&gt;drm, &quot;Using mailbox commands for power limits\n&quot;);
+				hwmon-&gt;boot_power_limit_read = true;
+			}
+		} else {
+			drm_warn(&amp;hwmon-&gt;xe-&gt;drm, &quot;Failed to read power limits, check firmware !\n&quot;);</pre>
      </blockquote>
      s/check firmware/check card firmware/ ?
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+		}</pre>
      </blockquote>
      <p>Could you please simplify this if else block. <br>
      </p>
      <pre wrap="" class="moz-quote-pre">	if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_CARD,
					     &amp;hwmon-&gt;pl1_on_boot[CHANNEL_CARD])) {
		drm_warn;
		return;
	<span style="white-space: normal"> }
</span>	if (xe_hwmon_pcode_read_power_limit(hwmon, PL1_HWMON_ATTR, CHANNEL_PKG,
					     &amp;hwmon-&gt;pl1_on_boot[CHANNEL_PKG])) {
		drm_warn;
		return;
	<span style="white-space: normal"> }</span>
</pre>
      <pre wrap="" class="moz-quote-pre">         update default values.

Regards,
Badal</pre>
    </blockquote>
    <blockquote type="cite" cite="mid:ccb5e2f6-1e20-4430-bc63-f130b80a0ce2@intel.com">
      <blockquote type="cite" cite="mid:20250430203607.926585-2-karthik.poosa@intel.com">
        <pre wrap="" class="moz-quote-pre">+	} else {
+		drm_info(&amp;hwmon-&gt;xe-&gt;drm, &quot;Using register for power limits\n&quot;);
+		/*
+		 * The contents of register PKG_POWER_SKU_UNIT do not change,
+		 * so read it once and store the shift values.
+		 */
+		pkg_power_sku_unit = xe_hwmon_get_reg(hwmon, REG_PKG_POWER_SKU_UNIT, 0);
+		if (xe_reg_is_valid(pkg_power_sku_unit)) {
+			val_sku_unit = xe_mmio_read32(mmio, pkg_power_sku_unit);
+			hwmon-&gt;scl_shift_power = REG_FIELD_GET(PKG_PWR_UNIT, val_sku_unit);
+			hwmon-&gt;scl_shift_energy = REG_FIELD_GET(PKG_ENERGY_UNIT, val_sku_unit);
+			hwmon-&gt;scl_shift_time = REG_FIELD_GET(PKG_TIME_UNIT, val_sku_unit);
+		}
 	}
-
 	/*
 	 * Initialize 'struct xe_hwmon_energy_info', i.e. set fields to the
 	 * first value of the energy register read
diff --git a/drivers/gpu/drm/xe/xe_pci.c b/drivers/gpu/drm/xe/xe_pci.c
index 882398e09b7e..95a2a458e8f7 100644
--- a/drivers/gpu/drm/xe/xe_pci.c
+++ b/drivers/gpu/drm/xe/xe_pci.c
@@ -66,6 +66,7 @@ struct xe_device_desc {
 	u8 has_heci_gscfi:1;
 	u8 has_heci_cscfi:1;
 	u8 has_llc:1;
+	u8 has_mbx_power_limits:1;
 	u8 has_pxp:1;
 	u8 has_sriov:1;
 	u8 needs_scratch:1;
@@ -305,6 +306,7 @@ static const struct xe_device_desc dg2_desc = {
 	DG2_FEATURES,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_mbx_power_limits = false,
 };
 
 static const __maybe_unused struct xe_device_desc pvc_desc = {
@@ -316,6 +318,7 @@ static const __maybe_unused struct xe_device_desc pvc_desc = {
 	.has_heci_gscfi = 1,
 	.max_remote_tiles = 1,
 	.require_force_probe = true,
+	.has_mbx_power_limits = false,
 };
 
 static const struct xe_device_desc mtl_desc = {
@@ -341,6 +344,7 @@ static const struct xe_device_desc bmg_desc = {
 	.dma_mask_size = 46,
 	.has_display = true,
 	.has_fan_control = true,
+	.has_mbx_power_limits = true,
 	.has_heci_cscfi = 1,
 	.needs_scratch = true,
 };
@@ -583,6 +587,7 @@ static int xe_info_init_early(struct xe_device *xe,
 	xe-&gt;info.dma_mask_size = desc-&gt;dma_mask_size;
 	xe-&gt;info.is_dgfx = desc-&gt;is_dgfx;
 	xe-&gt;info.has_fan_control = desc-&gt;has_fan_control;
+	xe-&gt;info.has_mbx_power_limits = desc-&gt;has_mbx_power_limits;
 	xe-&gt;info.has_heci_gscfi = desc-&gt;has_heci_gscfi;
 	xe-&gt;info.has_heci_cscfi = desc-&gt;has_heci_cscfi;
 	xe-&gt;info.has_llc = desc-&gt;has_llc;
diff --git a/drivers/gpu/drm/xe/xe_pcode.c b/drivers/gpu/drm/xe/xe_pcode.c
index cf955b3ed52c..9189117fe825 100644
--- a/drivers/gpu/drm/xe/xe_pcode.c
+++ b/drivers/gpu/drm/xe/xe_pcode.c
@@ -109,6 +109,17 @@ int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 data, int timeout
 	return err;
 }
 
+int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0, u32 data1, int timeout)
+{
+	int err;
+
+	mutex_lock(&amp;tile-&gt;pcode.lock);
+	err = pcode_mailbox_rw(tile, mbox, &amp;data0, &amp;data1, timeout, false, false);
+	mutex_unlock(&amp;tile-&gt;pcode.lock);
+
+	return err;
+}
+
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1)
 {
 	int err;
diff --git a/drivers/gpu/drm/xe/xe_pcode.h b/drivers/gpu/drm/xe/xe_pcode.h
index ba33991d72a7..de38f44f3201 100644
--- a/drivers/gpu/drm/xe/xe_pcode.h
+++ b/drivers/gpu/drm/xe/xe_pcode.h
@@ -18,6 +18,9 @@ int xe_pcode_init_min_freq_table(struct xe_tile *tile, u32 min_gt_freq,
 int xe_pcode_read(struct xe_tile *tile, u32 mbox, u32 *val, u32 *val1);
 int xe_pcode_write_timeout(struct xe_tile *tile, u32 mbox, u32 val,
 			   int timeout_ms);
+int xe_pcode_write64_timeout(struct xe_tile *tile, u32 mbox, u32 data0,
+			     u32 data1, int timeout);
+
 #define xe_pcode_write(tile, mbox, val) \
 	xe_pcode_write_timeout(tile, mbox, val, 1)
 
diff --git a/drivers/gpu/drm/xe/xe_pcode_api.h b/drivers/gpu/drm/xe/xe_pcode_api.h
index e622ae17f08d..8c8be7c5f47b 100644
--- a/drivers/gpu/drm/xe/xe_pcode_api.h
+++ b/drivers/gpu/drm/xe/xe_pcode_api.h
@@ -42,6 +42,13 @@
 #define	    POWER_SETUP_I1_SHIFT		6	/* 10.6 fixed point format */
 #define	    POWER_SETUP_I1_DATA_MASK		REG_GENMASK(15, 0)
 
+#define	READ_PSYSGPU_POWER_LIMIT		0x6
+#define	WRITE_PSYSGPU_POWER_LIMIT		0x7
+#define	READ_PACKAGE_POWER_LIMIT		0x8
+#define	WRITE_PACKAGE_POWER_LIMIT		0x9
+#define	READ_PL_FROM_BIOS			0x1
+#define	READ_PL_FROM_PCODE			0x0
+
 #define   PCODE_FREQUENCY_CONFIG		0x6e
 /* Frequency Config Sub Commands (param1) */
 #define     PCODE_MBOX_FC_SC_READ_FUSED_P0	0x0
</pre>
      </blockquote>
    </blockquote>
  </body>
</html>

--------------DouXFSg8RucbKRNhLZ8bpFKW--
