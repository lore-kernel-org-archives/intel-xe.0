Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33F37C47071
	for <intel-xe@archiver.kernel.org>; Thu, 16 Nov 2023 21:42:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E75F310E2CB;
	Thu, 16 Nov 2023 21:42:17 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6C2C10E2CB
 for <intel-xe@lists.freedesktop.org>; Thu, 16 Nov 2023 21:42:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1700170935; x=1731706935;
 h=content-transfer-encoding:in-reply-to:references:subject:
 from:cc:to:date:message-id:mime-version;
 bh=ehubPcAWCf3wN4qybOPKlgidPEDreqxYPWLyYoKB/0E=;
 b=mZ+JBrb5U+EiVVUaM7K41ycbJbCpt7LXpGE3OJVUlMfF2TUNFBfZpXBy
 dzDNhTcLw1x0ZXFiTEL2DwYo89kimXAJdiJHyirV79ez3AHswC9T9NI9I
 dMRaS6Dq3CHz0lXjVCA+1WFa06CX8R9WzjlvFjcI76wgSoRolxnuCUkpe
 11YhYMzt/EEfCZOIBMCBbJjRnhhhSqzquebdqsFKLnHOKN7xLmN/faNS4
 ee6D+9sIIxaUXwDMrRFO08cSd2uCz/JLATO90BrV8NKMiPXUYtM6iZz+W
 bk+h7qmMsgwIQyWdBNxIpyFF2K+31TerK9ONi/tCPX/ylFi1onZ/80GXA w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="477407865"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="477407865"
Received: from orsmga003.jf.intel.com ([10.7.209.27])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 16 Nov 2023 13:42:15 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10896"; a="715352586"
X-IronPort-AV: E=Sophos;i="6.04,205,1695711600"; d="scan'208";a="715352586"
Received: from fmsmsx602.amr.corp.intel.com ([10.18.126.82])
 by orsmga003.jf.intel.com with ESMTP/TLS/AES256-GCM-SHA384;
 16 Nov 2023 13:42:14 -0800
Received: from fmsmsx611.amr.corp.intel.com (10.18.126.91) by
 fmsmsx602.amr.corp.intel.com (10.18.126.82) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 13:42:14 -0800
Received: from fmsmsx610.amr.corp.intel.com (10.18.126.90) by
 fmsmsx611.amr.corp.intel.com (10.18.126.91) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34; Thu, 16 Nov 2023 13:42:13 -0800
Received: from fmsedg601.ED.cps.intel.com (10.1.192.135) by
 fmsmsx610.amr.corp.intel.com (10.18.126.90) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.34 via Frontend Transport; Thu, 16 Nov 2023 13:42:13 -0800
Received: from NAM10-BN7-obe.outbound.protection.outlook.com (104.47.70.100)
 by edgegateway.intel.com (192.55.55.70) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.34; Thu, 16 Nov 2023 13:42:13 -0800
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XNoSo7r1xOaoyKqZsbNZZjhLlJnqTnn49XSEW71gUWFUTlJE327NODl2+e67KUTl8g6spLzOdzrGZ9VPqFkYHDNF0WojU6Oa3jrV6tZQYSlPz9ZL3mlfgrOhO+HgPjZtwqUqKlTnkz5gkHucQp3jUs1j5KQG//jynKstffYPITRTbecN/DdqQYv0LNL2Pkf6IwQVI7+tNAepY/EvVQl7AXHI5GH6gxyOrBeXfaoc0FQjoM5wUrQ8/We6fjPz3/ejpVvjTGtD7Jp1TKKBI5lmxOroXqcSfmJP8sg2UGMilvHqHA06tUz6cpCA/xDbDgX9FfNhoY/vaVJF6l6LPjUmvA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Wsgs0NVeltPExL2yHGCmnbi2VmoKL6vuZTuWGXoGpWM=;
 b=b0+rjrfuKgQ1G0aBa040aaAhBbPOIbe45YI9hHl4Y1tf2aS46f9nO8J6aJFX3LPXafNBYhhFE1plnaGBUQIG/ZTfNySd2MdJBjOJ+2eAv/hbbyseWrezHelW20McfiOah3Gyh/KPSGec70Yjoaz3xEUmV4yMTPNUIcudWl8Llmf85N45vS54Socv82XbWeBgv3eVA5gzppSU9RPn7MzKUSVvTHIM13IHysLrjWOWduVLhbpcyCYssM0Roodl8+qWVbBuHH5PYHjdz6uPtEWXjoL1949lJXpAcgT5XP1ctgNWF3A83Ruv0VPzrNYOWehpMyrQ64Plnc0319nuQqMCTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from BN8PR11MB3556.namprd11.prod.outlook.com (2603:10b6:408:8d::31)
 by CY5PR11MB6415.namprd11.prod.outlook.com (2603:10b6:930:35::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7002.18; Thu, 16 Nov
 2023 21:42:10 +0000
Received: from BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c]) by BN8PR11MB3556.namprd11.prod.outlook.com
 ([fe80::78eb:ce50:6f36:7b2c%7]) with mapi id 15.20.7002.019; Thu, 16 Nov 2023
 21:42:10 +0000
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <170014944242.3216.2269599346800000429@gjsousa-mobl2>
References: <20231116153901.31941-2-gustavo.sousa@intel.com>
 <20231116153901.31941-4-gustavo.sousa@intel.com>
 <170014944242.3216.2269599346800000429@gjsousa-mobl2>
From: Gustavo Sousa <gustavo.sousa@intel.com>
To: <intel-xe@lists.freedesktop.org>
Date: Thu, 16 Nov 2023 18:42:04 -0300
Message-ID: <170017092445.3216.4826989391960534229@gjsousa-mobl2>
User-Agent: alot/0.10
X-ClientProxiedBy: SJ0PR03CA0200.namprd03.prod.outlook.com
 (2603:10b6:a03:2ef::25) To BN8PR11MB3556.namprd11.prod.outlook.com
 (2603:10b6:408:8d::31)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN8PR11MB3556:EE_|CY5PR11MB6415:EE_
X-MS-Office365-Filtering-Correlation-Id: ef3e0c38-6a7b-4674-2ea7-08dbe6ece300
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pxmhsiPiZef8CWQj+XXityIy7xLj2E6x4lvhAn75yCQI+/tSkgXLvBq6nTgbi9Qo8Or8SecSs2WOqqoWtrwE4l2lps4tiqtaJEy1MiO/emyb27aHOJ8UL2Exu7JY9e0IiqLtgzLbIsSyvzfMxRZdNThZ55ADO5D3h9nlb6V3oaIMIpXkKNp5nVIkf83pfzJqyGkIhJVZtA7aIwXfJha9fQb5HcKZ1Mr+gTcMeG/r4i+4osb8MpIdfX3cr4xvOPan8Ygppr8OufYb4lQa6PXKRiIWT88Sbjxy3uM/idlF8XDdxPD35ZnH+CY57ApeBLuN4kq0b6Fq+7fAdj/VnZ7ACsjMH5ZaREk8qwZjIWjucD4Tgmx8Z6Vok9JO6vORwmQRFlRasD/7f7hx5v1iwkV/yXAZexJ9q5LByYfvlgxFNRX0NjtH5qNkLl57JhLDihHJq+MJ1sV9eiAhJmZUFiCmHnEtvt8wiGpEEfoRksuWiJKP6W5X61wW0H/2TmaszEjV8XmQBXrWrgJlG9C9Tid2LT99lRDm3Wt9mksUQUnXbwBGMjiRU8qzIVJS6KyBj7TZ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN8PR11MB3556.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(7916004)(376002)(136003)(346002)(366004)(396003)(39860400002)(230922051799003)(64100799003)(451199024)(1800799009)(186009)(86362001)(6666004)(107886003)(26005)(6512007)(9686003)(4001150100001)(6506007)(8936002)(316002)(66476007)(6916009)(6486002)(66556008)(66946007)(2906002)(54906003)(478600001)(33716001)(4326008)(8676002)(41300700001)(83380400001)(5660300002)(38100700002)(82960400001)(44832011);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Z3kwbXFkNDR1TWRZcmpEWTd5N2JrbWhuY3hyQ3BTWDhkWEIrYngySlFDUDJB?=
 =?utf-8?B?bmE3NnJKaU5HVVpkTkVvVGc1dThmQnFucXdDV20vY3FIbXJSK1g5UlprVWJK?=
 =?utf-8?B?R1dEd0trUk1kWVg1RkpUSVFUS3lMemZ5dnZCeEpmWlBiWVVndEZydE1OdENw?=
 =?utf-8?B?cm44eTlBWHNWaHZ0d0tRMVNVYnF0K21aYmFweG5jSWI1eU1DY0orYzQrdndK?=
 =?utf-8?B?THhvUlpUQmVkQmppTlAwalJMYzk4d3JVNjN4dFgxeXFrR1p1WUdOSjNlbFRw?=
 =?utf-8?B?M2d3ODVyNkJpcHZMTVgrN0kvWDlrVTg1dTJ3T1E0WjVOb3VNTCtud3IwOEZ4?=
 =?utf-8?B?KzRsUE44NkFoM1ZYWTNZdWlpdFBHaHpRQWZjYVhjVWFLYnBiZVpsWE9UNUw4?=
 =?utf-8?B?OUN4RU1CMnBtcXE5UElnQTMwZ0o2d01MRVRMdTJ6RHFCdGcySG92M2lzYlp6?=
 =?utf-8?B?emFERTBrUG5mdFl0b3VTYkIwa3o0Ykl6Ukc2MnkxTTNrZTR2aUptakFFby9K?=
 =?utf-8?B?RVJnZm10QmxyMDJzcGphT1QzNDlUbGpwMWUxZWNXVENyTjlwUWJUelBsekFs?=
 =?utf-8?B?OXg0amhyYmdjb2xsN283ZlpGUlpFWFFBK285NWhmWnRoT1hTSHRDbmUrc3Bn?=
 =?utf-8?B?UzRVK05RVTJDL3lWeDQ4YXVoMndhc1JzbGJmZ1pnTUZGUjFGUHd0Q1VLaXJV?=
 =?utf-8?B?QXpGSFNhejQwTmlEaE52M2FzU25NVlVMQVpPdE9wWlMyNE5HSzdZdGdjNCtK?=
 =?utf-8?B?d2dNMUxJdzRrVEJrNmRPUnFjdUF2aUp5VTNXclFqVXFOeGpDOVptWlYzZE85?=
 =?utf-8?B?YTdiVXdwemNXTzVTcmtaRTAwbXV1L1NxdWEyVjZBOS91VEdRQWRxVlJqclJN?=
 =?utf-8?B?b0Y2eWJQMnJ5SHpHWlBNQ1hiTnV4K1lLeUkzT2xKWm52c1AvdmtyVzdIeTdF?=
 =?utf-8?B?cTJNdGFFQVkweFQ5dUIxZkFlU05FT1ZYMmYvUllTR01CTkMwaEJmK2JSZWgv?=
 =?utf-8?B?RHMwRnR1cVd3a0QvaGM3RWM1dEQvY3FJM2FZNU1FbkllL3FubUJEWEVGd2s1?=
 =?utf-8?B?WFpWVzRRTXpiVjdBWVBuaEtjQkNITkx2UzJrT0MzUDJnWEwwOVRremFOKzNu?=
 =?utf-8?B?M1Nwb1QxeTN6VHE5V3V3WHNkVVQzU3lwdTNnNHN2ZlNlUkdTcUtVOGJuRHFq?=
 =?utf-8?B?eGJMNkhaM1BwMmhEZ2VYbW9WQmZOdFRlQ25Mc05wNDlXM3lnSVl1N3NVeWQ4?=
 =?utf-8?B?Z2J4Q0dWa3hmWE94bm85bm5VOGpFbXJaWXRPMm5vMW1xcWhtK0h3UmdhR2Fu?=
 =?utf-8?B?WnY4YTZUa1ZlYmw5SkJTUDNqZDl2dDNqNVBWYktPd0ROSWE3MER2VkU4S3JB?=
 =?utf-8?B?NE1lN0pqbzkwRkR3UWlZeGRBc2dueG9Gd0xINlNXVXVITkdyeHRNSS85T0g3?=
 =?utf-8?B?MlFlbzJDZkJHTHRZNHdyVk5VUG9TL1V4MG1EVjdyVkVsaXd5OUY3U1Nhdkwx?=
 =?utf-8?B?YzlySGZZV2c5UW5pT0pHNlhlS0RFZTQrdG1FVG1jc1BhbE5Nbm1OUEE4eWVY?=
 =?utf-8?B?TUZja1BEbnppaVdINWhTUnk5dG5lOE9NTkFvc1V2Zk1pQ2hNc1htYWFkS3ht?=
 =?utf-8?B?ZXpXOTFqdG41Zk9KSjBmSk5IYjF1a0RaTWg2SFBaUDZYaTJGcnY0VTQzcHc1?=
 =?utf-8?B?YnkwNTYwVkpMNmloUTVYNkZqTi9SanRrTGtWSVY0S0wrKzdXSDFUR29kckVn?=
 =?utf-8?B?L2hsMmUzUnc1RVBIWm44d3dRMHptck1vQS93ZUFkb1hsQlFXb1lZRzB0Zjla?=
 =?utf-8?B?TUtSQk9IM0E0YXoyc0ZpbUQrSGlvb3kwUGxjNG9QK05IWDZMMDVmdm1IYzJE?=
 =?utf-8?B?a05OdUZsNHlIclRObDlaYzVEUTEwUWpGRG5VdVJtNHIwVjJwcXFhL1puenlL?=
 =?utf-8?B?RkJsL1FTK29PYW1mMStxd0JVU01YM3dWWW5LR2dJQjUwTHB6ZUFWbHcwMWE1?=
 =?utf-8?B?VkNEdGhLOU44dGN6YjBJSS9idWkxZTNaN0dOM0haWkdZODRRbUpJRk1IVnNk?=
 =?utf-8?B?ZHN5R01XR01UN2JDT0VWN2QyZ1NWd25yYk56OWVTL04rRUxjekZGbDB3YlZZ?=
 =?utf-8?B?cDlrb3RCQjJRbVdOVjU4cjJqSGxzMUdXQVdsSHNOMmNhaVBpcDRkYkNKbGh2?=
 =?utf-8?B?Vnc9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: ef3e0c38-6a7b-4674-2ea7-08dbe6ece300
X-MS-Exchange-CrossTenant-AuthSource: BN8PR11MB3556.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Nov 2023 21:42:10.0465 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dSTKDGvYhPxyqXMg+ZSCt1wpzv8lg4RDOstF6BaUMssU+sGWZ9a1qSYiks53OdY/hcIQR0hdvkdoHaHqs4VSwg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR11MB6415
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 2/2] drm/xe/mmio: Make xe_mmio_wait32()
 aware of interrupts
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
Cc: Lucas De Marchi <lucas.demarchi@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

Quoting Gustavo Sousa (2023-11-16 12:44:02-03:00)
>Quoting Gustavo Sousa (2023-11-16 12:39:02-03:00)
>>With the current implementation, a preemption or other kind of interrupt
>>might happen between xe_mmio_read32() and ktime_get_raw(). Such an
>>interruption (specially in the case of preemption) might be long enough
>>to cause a timeout without giving a chance of a new check on the
>>register value on a next iteration, which would have happened otherwise.
>>
>>This issue causes some sporadic timeouts in some code paths. As an
>>example, we were experiencing some rare timeouts when waiting for PLL
>>unlock for C10/C20 PHYs (see intel_cx0pll_disable()). After debugging,
>>we found out that the PLL unlock was happening within the expected time
>>period (20us), which suggested a bug in xe_mmio_wait32().
>>
>>To fix the issue, ensure that we do a last check out of the loop if
>>necessary.
>>
>>This change was tested with the aforementioned PLL unlocking code path.
>>Experiments showed that, before this change, we observed reported
>>timeouts in 54 of 5000 runs; and, after this change, no timeouts were
>>reported in 5000 runs.
>
>Well, I'm using a crystal ball here :-)
>
>This is under test as I type this (I just checked and it is at run #1053
>of 5000), I'll come back later once the test is fully finished.

As predicted :-)

--
Gustavo Sousa

>
>--
>Gustavo Sousa
>
>>
>>v2:
>>  - Prefer an implementation without a barrier (v1 switched the order of
>>    xe_mmio_read32() and ktime_get_raw() calls and added a barrier() in
>>    between). (Lucas, Rodrigo)
>>
>>Cc: Lucas De Marchi <lucas.demarchi@intel.com>
>>Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
>>Signed-off-by: Gustavo Sousa <gustavo.sousa@intel.com>
>>---
>> drivers/gpu/drm/xe/xe_mmio.c | 6 ++++++
>> 1 file changed, 6 insertions(+)
>>
>>diff --git a/drivers/gpu/drm/xe/xe_mmio.c b/drivers/gpu/drm/xe/xe_mmio.c
>>index 12df698f6764..16b3ca97f7b4 100644
>>--- a/drivers/gpu/drm/xe/xe_mmio.c
>>+++ b/drivers/gpu/drm/xe/xe_mmio.c
>>@@ -536,6 +536,12 @@ int xe_mmio_wait32(struct xe_gt *gt, struct xe_reg r=
eg, u32 mask, u32 val, u32 t
>>                 wait <<=3D 1;
>>         }
>>=20
>>+        if (ret !=3D 0) {
>>+                read =3D xe_mmio_read32(gt, reg);
>>+                if ((read & mask) =3D=3D val)
>>+                        ret =3D 0;
>>+        }
>>+
>>         if (out_val)
>>                 *out_val =3D read;
>>=20
>>--=20
>>2.42.0
>>
