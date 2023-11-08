Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE748C4332F
	for <intel-xe@archiver.kernel.org>; Wed,  8 Nov 2023 18:22:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ADB1C10E80F;
	Wed,  8 Nov 2023 18:22:21 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20CF410E80F
 for <intel-xe@lists.freedesktop.org>; Wed,  8 Nov 2023 18:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1699467740; x=1731003740;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=1eBql5wPbLuK5hnn8hv/q4Bt0/RI0hneLkfX7x8GGRg=;
 b=fddiTtZ5TdDnt+1hUmGr0FTahoojDrzRvfKPzcjn/siYIVRGSWtxV329
 03jVlaOLaiawnevFD4NmSqNf95Bq0czdkSXHtUdTDZb3xvYceCGEGxtn9
 sYF6DcKXc3hIrzfvrEgKh/mB8ToArds/WN+6T44bC295+caPt8E5T+523
 9mQu++QCO1a6H0YMMIX0XtmtUJmK6icAlf+vxTPxRKCwCRA1Vllh1Zwy2
 dKt3pXVZVCy5lb0S25K93ZuTWvk1iJGjzS3gq3kNrwbQYeSy9NGbWESEy
 1/vilQxHj8g03YO+qgs9WGEIO1oPIFLn5Vg2fQhX0nfeB7A0mrvCeHilF w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="11383252"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="11383252"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
 by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Nov 2023 10:22:14 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="756621610"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; d="scan'208";a="756621610"
Received: from fmsmsx603.amr.corp.intel.com ([10.18.126.83])
 by orsmga007.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 08 Nov 2023 10:22:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx603.amr.corp.intel.com (10.18.126.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:22:11 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Wed, 8 Nov 2023 10:22:11 -0800
Received: from fmsedg602.ED.cps.intel.com (10.1.192.136) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Wed, 8 Nov 2023 10:22:11 -0800
Received: from NAM12-BN8-obe.outbound.protection.outlook.com (104.47.55.169)
 by edgegateway.intel.com (192.55.55.71) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Wed, 8 Nov 2023 10:22:10 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iE5rFsVDojWNjU7nYSnWjm5lj7ITy4D8ldpjCH2QnYTU/GIexVlWe5UbGKFRWdsPiUMtR0+8a/mNMSIAOhEEQ3Wi93O99WjcWcfqzUYSA0Kfzq5hsCQ/tWCyzZImm/mYIaFz9wmKDxEOW7/kYJLRiBpmVrxJ1oXHsnXc99Xc4a1Vy4/kVVzg4eVnvovhIKX/iUIZEI72Y1oD9l60OgiX9b5ALESUljX874L8OaCSeDX7GSIF+8xm+6zBzVBL2OVnW3KqsfktVr/pRAvUodDa2SmQ+OK41z3YX5bmI6r6z181PRBT0XQA1POg/79hZdrRjjsmER6Hcve/QdcA2O3Etg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7XCHULHybKS9Lp49ZordaC/jeVOraCImJasrVdlgcYk=;
 b=JXay8P3yL1jgntjXKCLhCnqcbC+FBKmv6T2UP37sqUk7QofE+8+UYe/nZPywSgYcQ8dgZTxo+bpap9lKM7GBUoFFm7kokUlQa0mtVPALofgnH0bijMhDvh9tqYPOaDfv7rmOPj8Dhy3vLa4Xd6kZhdz1GLmM+cFQsFIEp/jaZe/3eB2KDwRRIY+2t1C9oFQ9QVl67A6NE2d/Lyf+zs3ZlwOJzZpyx28wZ2iH9acQM1YDtP/kE7kRQKOtLaqJfQHVscxV1ZsvGGKhZIdfYwiu+O0W+/n1o8zV/9jfEcvaCKr0cPtl4nCb+rU8Y1bDSB+cwitvgvSrlco4wQfk0dCFtw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from DM4PR11MB5373.namprd11.prod.outlook.com (2603:10b6:5:394::7) by
 MW5PR11MB5906.namprd11.prod.outlook.com (2603:10b6:303:1a0::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6954.29; Wed, 8 Nov
 2023 18:22:08 +0000
Received: from DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb]) by DM4PR11MB5373.namprd11.prod.outlook.com
 ([fe80::760b:d339:54e1:27bb%4]) with mapi id 15.20.6954.028; Wed, 8 Nov 2023
 18:22:08 +0000
Date: Wed, 8 Nov 2023 19:22:06 +0100
From: =?utf-8?Q?Micha=C5=82?= Winiarski <michal.winiarski@intel.com>
To: Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Message-ID: <n3pwyljibyauxdcabclqxxhdl54z6i2cfnkpay37sgjcqbst7e@ehiwy3dtlfzw>
References: <20231108003344.1169016-1-michal.winiarski@intel.com>
 <20231108003344.1169016-2-michal.winiarski@intel.com>
 <ZUurcSAL5alOdjto@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZUurcSAL5alOdjto@intel.com>
X-ClientProxiedBy: FR5P281CA0036.DEUP281.PROD.OUTLOOK.COM
 (2603:10a6:d10:f3::9) To DM4PR11MB5373.namprd11.prod.outlook.com
 (2603:10b6:5:394::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR11MB5373:EE_|MW5PR11MB5906:EE_
X-MS-Office365-Filtering-Correlation-Id: 99b01050-6206-47c6-b02d-08dbe0879e26
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lNpsmuNmdN+3WCsiVEybD6z6HYBntJr08eiP8NETJSR5o9s8oUqLav/Nx8p+GYWC5CbmWteiumrOAM235SaIEF4jPgIACuPsdjnM4xV8It3V95DkAeHIhjR5jszufS8ZzTPlvWvSFCQ6sZvAcRBzFCZ5t5Bi144Ktt911PX8kd9IpEinjk1wTsRflXnAOy4WyjTHiqZjpaBjK1gn+p8sIjlnWI5IM6NaT3n3u3cID0LIMrg76DIFtqruoqFufxktl6H4guPrVpuP18kc4UDr9/IntfF5/wuxrICoeYLM+pnQgQedGFRfya3MqWw+FaiCJ6cntZG2DOcS/78pnU8TMbJcD/vr/g1DUy0cdDK/Qn8Sa041HPSnwfab0NhzfHcVWuZ7wTaml4f5CeMzrK2i5KU0k68LyuJsmCXDzBMFf1GIuRVZSzfsmDWZUcdBQX6kUDXKxHE4yUzOCI+kJO5W96UTIag8ohiKIoVQpeBiYGVYKa6u5Nti6j1Xqy3vui3R+/y0kmmTgXNugxIFlHRh9nnvqFnsOnLeD5o8zXcfHz1bbIUqpqCrl0bj5Tt3JYSg
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM4PR11MB5373.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(366004)(39860400002)(376002)(346002)(136003)(396003)(230922051799003)(186009)(1800799009)(64100799003)(451199024)(478600001)(6486002)(66556008)(316002)(66476007)(6916009)(41300700001)(26005)(66946007)(6506007)(9686003)(6512007)(8936002)(4326008)(33716001)(8676002)(2906002)(4744005)(5660300002)(82960400001)(86362001)(83380400001)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ck1UbG1aR0FVSlNDRDFBZ2QyazE2VHZFVXZaRXJ3M0ZEU3pwemRFV1JQa3lE?=
 =?utf-8?B?RXJzSDUyUHF4akNYUnFMK3lKY2VldTZETjc1MWN1azg2c095ODRqTSsyaHhk?=
 =?utf-8?B?aDVZZStVU3ltd2Z3L1NUVlBqaDIwakMxWmhmRWwzY3A1M0dIdXR2Nm00S3Fm?=
 =?utf-8?B?KzRrVW5SSW5yL1g5ZENxVkNmeU9KZW1UN2J0SXZDTzVVMjZIRXh3UDdXWE1a?=
 =?utf-8?B?aFhBQkdFMzdYTmU1SllCYXV1N2JGT2Uzc1NhdlByTEZyNFMrZmtibXhibmdw?=
 =?utf-8?B?bnp2OG84cUFhL3BvZmNRK0NtVkVVTEVOcUs4NEY4LzVPZFNldG96SGpYcXJM?=
 =?utf-8?B?MDAxMVJGaWhRWjYzZUdhTXJ3a1pjT2tqVWMxUTNmaG5xR0lYdkFIbmozMWoz?=
 =?utf-8?B?UEswN3dVeFBHU2RYYUQzYmZ2SGR6TSt5Z3AySWhEaHh3ekUwQ2hHRGloWXNX?=
 =?utf-8?B?cUZPV2VFMlZTWHlVZHNBVXpJVGJFd28zOThyQ3Bic2tuWm5OY1NtL0NCbElu?=
 =?utf-8?B?SnMvY2VNRXN1NW11YW5MVVpNMFVTbUtxaDdKQ1NFQzVvZzFjQ3QwMVdwbC8w?=
 =?utf-8?B?R3B6VGp1N09iMFlyZlV4bnZEd2ZZMlg4aEtOeE9pY2xydTloVWgrNTVLbEdH?=
 =?utf-8?B?dTJFWEh1OTFod2t2d044MHFYMlNXR2lJZ2hzQ1R1aWVLbWh6Z1ordjhQRTE4?=
 =?utf-8?B?emdQbEN4V1cvMGVmNk9vT2ZwNFBmbDNYVWdrTEMrUFZ0ZlhGaldmbTZlR0l6?=
 =?utf-8?B?SW41OHpOT1FFK3FRZC9Ed21teWt0MEc0Z0xKK0p1NldxZTJpRStpNkR4dXEr?=
 =?utf-8?B?UGRKbmVkeWJFOHJ5ZS8rTUtFdkNYZ2JuR3FiRDhVOUJIMEFzcGJyQnV1Uzk5?=
 =?utf-8?B?S2FnZk5ub0pSWW5zdmpvOUErcEsyVU5FdW1Sck40RzlPK2NzVHNLTXdxOWFW?=
 =?utf-8?B?YVRjcWtKOTU5eXd3UmxRaUIvNysrTnpLTmxSemsraUJkdW8wN1NGbzlZT3Ny?=
 =?utf-8?B?dStPRHhPK1lSa2htVFlJbjNpeVhQRGFwUGhKNEdnTEwxUmNmaEc5b2szeHd4?=
 =?utf-8?B?YUwvaW1ML1hKR2p6VUw1cHFicnh4NXBlMHVlVElpSjVENzhPb0crZnYrOTVx?=
 =?utf-8?B?MEhOdUlyWWNCVlR6ZUhLa1BobGVzYmNoY0FGSG5jd2JwdU90RFA4STQ5c2o2?=
 =?utf-8?B?MlRON3RXcDRRUHdnZXArS3hrUVR1NzZUTG50RkpOMTBXTlE3WVJOd3hjWmJm?=
 =?utf-8?B?VkkvUEdmcFB2VjU3cnFCd3lvMUVIZFAwYmp6dmprUUR5V3o3bERFWjMvYmkw?=
 =?utf-8?B?VFNwbXlnUnM3c3ZHNjQ5U0diZTlnRmtDSWU2aTNyTjBvZDBSblU3SVZ1eHZm?=
 =?utf-8?B?QTZBR3VidEZJdXZiZTBzbWMxNVpjWnhzN2l3anJrUHR3UWFtYmNJcU5rT3JB?=
 =?utf-8?B?WVMxZXFjMjdlTFZrMFZKcVBxZ3hLNXhZNkxkK3BlN3F1RklYMEFGOXptY2wy?=
 =?utf-8?B?ZENGVUVDQU9hd2xJcktPU2JLWTU5ZTZ4TUFLN0NTUDA0bXRDdVVTZFlMaTBl?=
 =?utf-8?B?RmpSdGU5YThFMHFuQW1SMHB6WFVSSDM2UGVnODdJQ1REczdPRFFsVUFqMHJF?=
 =?utf-8?B?aTF1TFlxQlpjaSt0R1dHMUp2ZExtcExXMXF5SCtHckJPWldMZWtYY1FUREM0?=
 =?utf-8?B?OE04cmpRL05DVlVZTHBRRlVDZDBFVHl6UHQ4L1pHbUp1Wm1NYlpBeVdUZWFa?=
 =?utf-8?B?c0Z2ZlB4U2pUSXNIUVJUWWdudU96UENiY1JnUVU5RzBtS0NhZ1NoN1VpQ01K?=
 =?utf-8?B?T1ZodUV2dGh4RGpURS9rUXZYY2tGNC9xTUdBeFFkVU5PRncyTnZUL0dzL2JN?=
 =?utf-8?B?a3dJTFFiRzNmelMzN1N4QmdwdDZ1dWJUTmlEMFUzODJURGFMaUJ2NFdoYVZC?=
 =?utf-8?B?TytlMkFKV0d0aG8zM1BmaGlNLzlpMmRWazhHZk5JanQxK2dpU3ZtME8xL0Jo?=
 =?utf-8?B?ZzlvZTZ4dG03cDArRWNOMDQwWVpiNlk3S3BqNGR5YWxBZ3JiVGYxZTlhaXNQ?=
 =?utf-8?B?SURIb1lwSnhOeDlkMlA5blRWWG5xMDVmV1NOaU1TWHp1U0dXNk12MVVyamdo?=
 =?utf-8?B?RUFXcTV6T09sSWJoSHZkdFhaYUxDWkw1Z2p3dER5T1NjaVFsVE5vWFZQRTZI?=
 =?utf-8?B?OWc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 99b01050-6206-47c6-b02d-08dbe0879e26
X-MS-Exchange-CrossTenant-AuthSource: DM4PR11MB5373.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Nov 2023 18:22:08.5412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WdPmFsoByuGwyO2nxgz/ZaQxSRKVjEO8M/ncPy4pFlQlQev0Fh9KjyKHagh/oYMnW/Cn6RnEZERBKn+vMnR/H4Avku1GOswXnMDyPLf0sS8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR11MB5906
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH 01/12] drm/xe: Remove shutdown
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

On Wed, Nov 08, 2023 at 05:38:25PM +0200, Ville Syrjälä wrote:
> On Wed, Nov 08, 2023 at 01:33:33AM +0100, Michał Winiarski wrote:
> > It's not a required callback,
> 
> That doesn't seem right. Display should be turned off, all DMA
> should be stopped, etc. here.

Yeah, I mean from subsystem perspective - the PCI subsystem won't fail
the "register_driver()" if there's no .shutdown().

-Michał

> 
> > and Xe implementation is empty 
> 
> That is certainly true.
> 
> > - remove
> > it.
> > 
> > Signed-off-by: Michał Winiarski <michal.winiarski@intel.com>
> > ---
> >  drivers/gpu/drm/xe/xe_device.c | 4 ----
> >  drivers/gpu/drm/xe/xe_device.h | 1 -
> >  drivers/gpu/drm/xe/xe_pci.c    | 6 ------
> >  3 files changed, 11 deletions(-)
