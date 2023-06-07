Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4F23C77B7A
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jun 2023 19:42:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99BFC10E53D;
	Wed,  7 Jun 2023 19:42:16 +0000 (UTC)
Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98FD10E53D
 for <intel-xe@lists.freedesktop.org>; Wed,  7 Jun 2023 19:42:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1686166934; x=1717702934;
 h=date:from:to:cc:subject:message-id:references:
 content-transfer-encoding:in-reply-to:mime-version;
 bh=BXyJ1q4laK35ANFPzedhMqO7gwUpnbSH1FXltDeAhFE=;
 b=jSa4TdiXN2IO4ccneJ64QrfjL9ZGaLA7c5KBwugchuTNCkHJy9DcuCB6
 PveU1ZRjVdnrQR+Dny9qnO2/AMLWOUduzpPY82f2STZYbMgYKCI6JbvxE
 /6YYOIU+Yv6EUhjV2l8aiqUaDBaAoboJfvtXSsCREaeqpsN01x75zAhg/
 INIMm7Fa8Nfkxb08SiXtyXlFV/iziKsy5nExTjdZxofbNPgV0Ja2TQG2q
 NsMXeK2KavYoyWEnqJo3GTHqRXBd1k8msT3v2C8BSw5x3jAOnXNdVJVzP
 HAS7GNPSkqirwQNO6yeAaU4WoEbArTFEW5kQ34gbLQrvpewTXncgj1SAI w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="443457628"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="443457628"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 07 Jun 2023 12:42:12 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10734"; a="956417620"
X-IronPort-AV: E=Sophos;i="6.00,225,1681196400"; d="scan'208";a="956417620"
Received: from orsmsx602.amr.corp.intel.com ([10.22.229.15])
 by fmsmga006.fm.intel.com with ESMTP; 07 Jun 2023 12:42:12 -0700
Received: from orsmsx603.amr.corp.intel.com (10.22.229.16) by
 ORSMSX602.amr.corp.intel.com (10.22.229.15) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23; Wed, 7 Jun 2023 12:42:07 -0700
Received: from ORSEDG601.ED.cps.intel.com (10.7.248.6) by
 orsmsx603.amr.corp.intel.com (10.22.229.16) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.23 via Frontend Transport; Wed, 7 Jun 2023 12:42:07 -0700
Received: from NAM12-DM6-obe.outbound.protection.outlook.com (104.47.59.170)
 by edgegateway.intel.com (134.134.137.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.1.2507.23; Wed, 7 Jun 2023 12:42:07 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=idvG+IAFo9O5+pTHsRKTB39SJI0MosbI3wHE88gWDGLPCTaCLfbOK7oBm63EimXH/rYPfjzo6k9g5OOx3aQXwLj/CHkKITF1QXZOlsSgG9wY1vd25PB8Uw1GhnrTwjm0i9+pLBf//34q2n29jOA6e0ggIkvRWWd2KIgX9gDqIb7hn3ae7MwmwNYJegKa5Mk4UZ9Pav88NHJQgyfXb0ekvOoK3M60NXlsxArZS2M0j/sr+YTqk3kxyiK/tjYa0kjEfA9IZBY+PZyEgMLmmURuPM9kreJp8pk8a8rC1xb8QtuPDpIyv0o7OpnCZAOyxDHwoMrgyvrrOFL2NJuLlsrcuQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QRA/5VdOFGJblo7I0c3Chhs7+TONUWdXLJh6JcGGNyY=;
 b=dXcLHmeYMoOdBIrDCe6UL2i4ftjq7gsmfOp+2W/vMMBYR1oLF5wSJfl3XH4nlp88NUjhj4+RSt0wDCoT3Re6CkEyyDMVOCEqhrDR6YznPLtweO2irOQ1awrogL7MYU4M2AofXOY+Vpp3YtimiBdINeTCy36LYZ6qsKuX6IqWY4wGpc/WdGWcGGfR+p9CeFKfa9tCU9lZMOKx7ydXL6cDpPEcdMkXUZmyJ4QJJbtipTwFd29lN1p/tnZr+ojC3DehieFbxWmzaBEnZ1j37VrpeEraEVSi8GwikazbAEm1gjhBhIXdtDT3CQcLhvjy7Q1y/WmNtClXQMpDupd6j/IMbg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=intel.com; dmarc=pass action=none header.from=intel.com;
 dkim=pass header.d=intel.com; arc=none
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=intel.com;
Received: from CY5PR11MB6139.namprd11.prod.outlook.com (2603:10b6:930:29::17)
 by SN7PR11MB7091.namprd11.prod.outlook.com (2603:10b6:806:29a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.24; Wed, 7 Jun
 2023 19:42:00 +0000
Received: from CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4]) by CY5PR11MB6139.namprd11.prod.outlook.com
 ([fe80::44e7:c479:62f4:3eb4%5]) with mapi id 15.20.6455.030; Wed, 7 Jun 2023
 19:41:59 +0000
Date: Wed, 7 Jun 2023 12:41:47 -0700
From: Lucas De Marchi <lucas.demarchi@intel.com>
To: Oded Gabbay <ogabbay@kernel.org>
Message-ID: <z3h35yqsti5koywkzbrsdsxtgti62m4i3vbsdsi2br5gurbinx@fprbtlmy5km4>
References: <20230531152338.6-1-francois.dugast@intel.com>
 <uieo7p5pwbj252uxdtmyyozj3crbbrkcm4uevookml3vxqj2ik@c3ilb7d7okcl>
 <ZHd9u1AdemcPGPn3@fdugast-desk.home>
 <jjkmqjebxtljdu4chzjuj7a56xbpttd7wf3wqh6o7ciigb55ur@pgci7bqedka6>
 <CAFCwf11Cz8=3=nnhCTGKN9Coz_dsZL7XcAc9HFyayHRcUCioCg@mail.gmail.com>
 <sptofjhqdc5kjs6fm64ueghqluyi3p7g6x2d63nxruxxp6zzlq@fktu4g44adrs>
 <CAFCwf10F=AT4apgR++C+usW4MOefM=CHi58Oni0vT-B+QBtVjA@mail.gmail.com>
 <jifbozq2jzctt2a226hectd5izr757haxl4jrqduxhhhshfcox@i54q36fox4at>
 <CAFCwf10kqEdmv0n+wzcZ5Wad6SheWB7cvStWq2+23fwGVWAu6g@mail.gmail.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAFCwf10kqEdmv0n+wzcZ5Wad6SheWB7cvStWq2+23fwGVWAu6g@mail.gmail.com>
X-ClientProxiedBy: BYAPR01CA0004.prod.exchangelabs.com (2603:10b6:a02:80::17)
 To CY5PR11MB6139.namprd11.prod.outlook.com
 (2603:10b6:930:29::17)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY5PR11MB6139:EE_|SN7PR11MB7091:EE_
X-MS-Office365-Filtering-Correlation-Id: 759cf10d-dbd9-471f-e878-08db678f4210
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: VdciVdPside0cI9z/2eeAgvVlGFqtJYiIXKy/rjyq4A08s3DA4HooG5SFZp1xpKGY06/be6scm47lSCOZdiaAeXShzsiPy5cuYtREHi05WQv4wsiSZkIw4jz899AhOyEV1GsK+MPeEnOEnZBQAEwG+uQcvDHbdYXCHsvkBzVz+DVunfGNDZmb5+aiYdHrcsEyRky73iDyofJqszxSnB2g1HWyBVJo48CDm+FI4recn5hBaew37s6U2PW6W7VR4yvScljOk5H8gdullaajayISKI5o1wPbN7oFbkbqMSLeKLQ2t5Bj9BlyR6rVMCBJKXy3oOHbv6wxgcy1Djse4BdKOoy7evjEktUfruDhDkCZNtXqA1Gdvk8PF5PSgajeF1q50zR9PikMLoxOmQHFz3AaWngCeRDxxJsLYTFeifDl5y3xjonHc7bLV+MjGwvIsBR36Z8oC+bgZRN7g+W4+Lqv8p8oNBrZ3jrSWGjtK8E7RAWu0d5iAuV7MToPlFEZgXBB/0xGPTz7hh8i8ZMzUeVVw+z3IueruhsaGir79A6QKhsvSvM4iht36AHl431FOgTKBurd3/+wsybcG31Br8Ghlqma5g6jHyhfVrq9uWGbi0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR11MB6139.namprd11.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(7916004)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199021)(6666004)(83380400001)(33716001)(6486002)(316002)(41300700001)(9686003)(26005)(6512007)(186003)(8936002)(86362001)(5660300002)(8676002)(66946007)(82960400001)(6506007)(38100700002)(966005)(6916009)(4326008)(30864003)(2906002)(478600001)(66476007)(66556008)(60764002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2hyNVY0OTY1Q3puUzJla2lBT0V0Nm5xNkxzTVZZZzhjR2kyaXVCbjlVWUdz?=
 =?utf-8?B?UDJMdWhJL0RlSEZHdWZBQ0VMb0RXclVMWlgzTmlUQnBYSVNUQjExM2ZoZXk5?=
 =?utf-8?B?cWpkcWJNTGl0bzB6ZG1KcVZaREJyeDVaQVB3OFRhUWx5Z0U5U0crVnFUYk1m?=
 =?utf-8?B?anNib1NOU28zS1V1OFJ0RlNJeTFxb3pUN3FsVURFVlh1dmZrZ1pqU3VLRlhE?=
 =?utf-8?B?am92cXloWjNySjZick84SFdtOFlHUHNUcTh5TGRqYjhsOTcyWHJmb2dVamZ2?=
 =?utf-8?B?cG50WXlTK1JwQkQwTTJYd0N1UWd3UnJWUnRVYjRqS05ac0R1U2U3NVBZbnVn?=
 =?utf-8?B?bHM4aG5WTGtPZ2laQWd1S3NXMDhTMEJhcC9SSUdKQ1ZBSmpSY3gxQVYzdFNC?=
 =?utf-8?B?T25EdzBLb2xGZVFGcFVIMnFpKzRTbU1sSHR5Nm9FNzZySmJLOEV5NFlpUm1N?=
 =?utf-8?B?YjlINDFLRXZmdmJ5Y21ORkttbUM1QXBmajczRnpCZnhHOGdsZHRiajNLdFNr?=
 =?utf-8?B?cVZuNEVzclVWT3VzdVN2Q0dweExZbVNYY2h3dW8xbUV6a0NwTlpqdWpOb2d4?=
 =?utf-8?B?SnJ5NDh4Mlp4NG5lM3dQTlBjRDl5VTJTbTdWK1JOZ1FNQVdSaEF3bDFIcGN3?=
 =?utf-8?B?L0NYandIdk1LUVd0RXlKaFp1dEszcXdaSWhTWlNOVEtEU2wzd1R6MGhaeTRM?=
 =?utf-8?B?NC9hUkx4aEM5VDRiN21FVUxJR2RuejFrVHNKdVA5OFFFY05USm4zYlJLZ0Ur?=
 =?utf-8?B?T2lNTVkrcjI3TU5qVEY2di9QT1NvMHRFL0RRekdBTEhLdFE5ZTBkamI0WGta?=
 =?utf-8?B?Y0ZMd2EyY3B6TjIxeGZzTXJMdTFIMWJVYXJpZWJON0ovTkFISXpUSzNncUsr?=
 =?utf-8?B?ZXRjNDhVcHE2bG1ub09EcStNRktwd29BWERuNHpnZ3Jtbk80T1VVWVNreE9y?=
 =?utf-8?B?d251eTZXcEZ5OUhNT25GZ2p3cmQ1ckVSQUNBc3p3UExkUEViN2l5bDlTSkEv?=
 =?utf-8?B?MVV2OVB6R1o0NVpQSVE0OVRlN1NnYkpvSk10M3FZdS9UY2Q5ZE4xbVR5RHgv?=
 =?utf-8?B?c2hkOEd4YWdQamNOYmtPdGJ5NDhwQzFLSHpRV1BJOGp0ZEJGTmFWeGZ0cXNo?=
 =?utf-8?B?M2FIRkg0ZGgvT2liUTkwb2EwZVJpRFJpeEVNcUs1TExUakRXWVVEdTZUNmpv?=
 =?utf-8?B?Tk52YWRoQWRzaUdheWg5Z1VZWjVtbnpuaWtPYndWTlJ4ZG9BUTZISldyaGtx?=
 =?utf-8?B?N0VXVVpVMXJWL0ZqWTZoVGVJZUFjbUpteWVQV1k5NTZvRENLdEZCMjdSaEhO?=
 =?utf-8?B?TDVuSFhDVWJpdjVpdTBnY2NIcGltQXN6M2MwS1lScjIwV295Q0lsVDZEZVJX?=
 =?utf-8?B?SHlSUWpORXZFZmRPY2t3QURGV0N1b1FyeGZSdkhXcjFQaDFMZERRSkN3bHFn?=
 =?utf-8?B?MzV0WE0xUlpGSGk0VUlhZ0NSOWJWVFJ6dC9HRUhLTmxSSm9DTCtGK3A1YS8v?=
 =?utf-8?B?YmFKbk1LWmk0cVBHQzU5S2Z0d1F5VFZ5SVZseDF4ZmJOb1lNSVUyWVp5Q2JS?=
 =?utf-8?B?TklNZTNDaWtPaSttODJ3SEppY2UydTU3TWlUS2ZVcEF6Z2RodXo5ZVR2czE3?=
 =?utf-8?B?ZEh1WGVYb0k1dktjSFcrTGtGVzFFczljTzdEbGNMOTZNeXA3bC9kdWsyWmlQ?=
 =?utf-8?B?YVNhbGphamZTOUpBdlVINFExOVczeHZzalBrVVN2VmEyKzBIdm14YnFzUWxk?=
 =?utf-8?B?d0tpZlFxRkpsSHpEK3hIaEwxT2NKOVFqM0x2YkwrMEVPSS9VeU85bnJnQlAr?=
 =?utf-8?B?bVo2VFFjMy9ocVozaW9ra29FRmxxeW9uWjRKMzVaV2Vlb1FQclExcDl3L1hP?=
 =?utf-8?B?VXpKMkZhajhXYmhCVjBlbEgwZ3dndy9seFZONEdmM1FnTHNqZ3hIOWVaM3BY?=
 =?utf-8?B?VU9iMG54T01kbzlhdFFWVHFDTUs0bnhDNU1KQU5nMlY3V1BJM0N5MHJDZmVO?=
 =?utf-8?B?MHhsVk11dHZVT2ppT0xjK1NmVkp3SnBkZVFrTmlsVlU0eEdZdFFBWmYyYkpn?=
 =?utf-8?B?d0dNY2JZMHdlbUVJR01PNTBxQW9QSUZ0VlF3OGlUSVIrVFZYbm51Y3Y4UHha?=
 =?utf-8?B?M2I1NVF0MmZqaDNvRFZGM0d2bnVpTU5GbXVLdTBPTjBsR2lwMlNGRnYybS8y?=
 =?utf-8?B?Z0E9PQ==?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 759cf10d-dbd9-471f-e878-08db678f4210
X-MS-Exchange-CrossTenant-AuthSource: CY5PR11MB6139.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jun 2023 19:41:59.4317 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 46c98d88-e344-4ed4-8496-4ed7712e255d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AASyiu1GvjTDLzn83NT4dKhVnwrJdyil42tEHwRou5gq0FF+bIaUzzVysOI7vRLWMrweTL2+IkGMQrnXc9mi2qugwf1tYotwlEjiJfP5BhU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR11MB7091
X-OriginatorOrg: intel.com
Subject: Re: [Intel-xe] [PATCH v2 0/5] drm/xe: uAPI cleanup
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

On Tue, Jun 06, 2023 at 01:58:43PM +0300, Oded Gabbay wrote:
>On Mon, Jun 5, 2023 at 11:09 PM Lucas De Marchi
><lucas.demarchi@intel.com> wrote:
>>
>> On Mon, Jun 05, 2023 at 10:33:57AM +0300, Oded Gabbay wrote:
>> >On Thu, Jun 1, 2023 at 7:48 PM Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>> >>
>> >> On Thu, Jun 01, 2023 at 01:21:06PM +0300, Oded Gabbay wrote:
>> >> >On Wed, May 31, 2023 at 11:29 PM Lucas De Marchi
>> >> ><lucas.demarchi@intel.com> wrote:
>> >> >>
>> >> >> On Wed, May 31, 2023 at 07:02:51PM +0200, Francois Dugast wrote:
>> >> >> >On Wed, May 31, 2023 at 09:23:45AM -0700, Lucas De Marchi wrote:
>> >> >> >> +Oded
>> >> >> >>
>> >> >> >> On Wed, May 31, 2023 at 03:23:33PM +0000, Francois Dugast wrote:
>> >> >> >> > This series addresses some feedback on xe_drm.h provided here:
>> >> >> >> > https://lists.freedesktop.org/archives/intel-xe/2023-May/004704.html
>> >> >> >> >
>> >> >> >> > It is based on xe-rev1-2023-05-02, not on drm-xe-next, so it will
>> >> >> >> > likely break CI.
>> >> >> >>
>> >> >> >> As I said on the previous reply, this is not going to fly. Now we have a
>> >> >> >> patch series against xe-rev1-2023-05-02, pushed as xe-rev2 branch with
>> >> >> >> *no recorded reviews*, doing things that already conflict with other
>> >> >> >> fixes that landed in drm-xe-next. Examples: the 32b compat for uapi,
>> >> >> >> the mmio refactor, the oob WAs, the probe refactor, etc etc.
>> >> >> >>
>> >> >> >> Also, there are other fixes queued as fixups, which is still the process
>> >> >> >> being used in drm-xe-next. It's also where CI is running. Due to display
>> >> >> >> being moved up in the branch it's basically the only sane thing to do.
>> >> >> >>
>> >> >> >> I think we need we are shooting ourselves on the foot and this review
>> >> >> >> process needs to be fixed / agreed upon before we create a mess out of
>> >> >> >> it.
>> >> >> >>
>> >> >> >> Lucas De Marchi
>> >> >> >
>> >> >> >Yes I understand the concern. The intention is to address Oded's feedback on the
>> >> >> >revision that was reviewed, so that the next review iteration is manageable and
>> >> >> >not based on a moving target, which could lead to and endless effort.
>> >> >>
>> >> >> and then what are we going to do next? rebase the rest of drm-xe-next on top?
>> >> >> How do we guarantee the fixes on top of xe-rev is not breaking stuff?
>> >> >> What about the changes that are already there changing the commits that
>> >> >> are on xe-rev?
>> >> >>
>> >> >> >
>> >> >> >Maybe I created confusion by sharing on the mailing list but at this stage the
>> >> >>
>> >> >> no, that was the right part of it. Reviews on the patches happen on this
>> >> >> mailing list. The wrong part IMO was to push it as a branch before it
>> >> >> got the necessary review and before we know how we are going to
>> >> >> reconciliate things. Rebasing drm-xe-next on xe-rev doesn't
>> >> >> really work for the reasons mentioned above.
>> >> >>
>> >> >> >idea is not to get this series merged, only to get Oded's validation that it
>> >> >> >fixes the issues that he reported. Yes this means more work will be required to
>> >> >> >rebase and create fixups later for drm-xe-next but it seems acceptable for the
>> >> >> >work that has been done so far.
>> >> >> >
>> >> >> >Do you see a better way that would still satisfy the "not moving target" goal?
>> >> >>
>> >> >> 0) Ignore the "not moving target" goal
>> >> >
>> >> >Hi Lucas,
>> >> >I would like to say a few things.
>> >> >
>> >> >The first point is that the current xe-rev1 branch was something that
>> >> >Rodrigo and I set-up. If you feel this is not a good starting point
>> >> >for the review, let's talk and decide on a new starting point. Even
>> >> >though I have already invested multiple hours in reviewing it, I can
>> >> >understand the point you are making and I'm willing to re-start the
>> >> >review with a new starting point.
>> >> >
>> >> >The second point is once we make a decision regarding the code
>> >> >baseline (keep using the old or moving to the new), I want *all* of us
>> >> >to agree that newer patches that are sent to the mailing list will not
>> >> >be part of the initial Xe upstreamed code. There are mainly two
>> >> >reasons for that:
>> >> >
>> >> >1. There is a long-standing process of upstreaming a new driver to the
>> >> >Linux kernel and that process assumes a code baseline that doesn't
>> >> >change between revisions, except for addressing code review comments.
>> >> >As a person who has undergone this a couple of times from the side
>> >> >being reviewed I would like to follow this same process here as well
>> >> >:)
>> >> >
>> >> >2. The Xe driver is one big driver, with a large team behind it that
>> >> >continuously sends patches. The code keeps getting re-factored and
>> >> >acquires new features at a high rate. If every revision of the review
>> >> >the baseline code will change, the changes from the previous revision
>> >> >will be too large to review independently. I will have to review the
>> >> >entire driver again... Not to mention how will I be able to easily
>> >> >verify that my comments were addressed properly (btw, I also wrote it
>> >> >here https://lore.kernel.org/intel-xe/CAFCwf124UMR3VQ=Tr6mT_eTRQi9ssqZqEH4jys1bGggHJjboLw@mail.gmail.com/).
>> >>
>> >> Let me use a few examples:
>> >>
>> >>         22ad50d184c0 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")
>> >>
>> >> Do we want to leave the commit "drm/xe: Introduce a new DRM driver for
>> >> Intel GPUs" as part of the original and then have a Fix commit leaving a
>> >> few hundreds of broken commits?  On other "first driver submissions"
>> >> I've seen that would be frowned upon and it would be expected that this
>> >> is fixed inplace instead of leaving broken commits behind.
>> >>
>> >>         a00a92181ab1 ("fixup! drm/xe: Introduce a new DRM driver for Intel GPUs")
>> >>
>> >> Same thing: a nasty memory corruption lurking there. Do we leave it
>> >> broken?  With the previous (current(?)) process we were actually adding
>> >> these fixups that are later moved back in the git history so things like
>> >> this are never part of the upstream code. Looking at xe-rev2 branch
>> >> being pushed without any code review, why is 83ac6e02bf5e ("drm/xe:
>> >> Remove unused define") more important that deserves being brought back
>> >> to the original submission?
>> >I'm sure there are multiple additional bugs/broken code paths that we
>> >don't know about right now, will be part of the original submission
>> >and will be fixed only in a couple of months or further than that.
>> >Therefore, I don't think this is a critical issue.
>> >But in any case, no one said we need to have the original submission
>> >sent upstream, without additional patches after it in the same merge
>> >cycle.
>> >
>> >What is critical imo, is to have confidence that this driver is not
>> >doing something horrendously wrong, like abstracting entire kernel
>> >layers, or putting up a broken uapi, or incorrectly using kernel API,
>> >or whatever.
>> >
>> >>
>> >> Another one that comes to mind: the engine vs context name that you
>> >> raised on the other review and I pointed out to the history: would it be
>> >> something to be changed on xe-rev branch and invalidate the other things
>> >> on top?  Or would we better change this in drm-xe-next?
>> >
>> >I agree the changes between rev1 and rev2 are often quite significant.
>> >And with all your other input, I think we can consider the following:
>> >1. Halting the review for now.
>> >2. You will prepare a rev2 branch with all the changes we agreed upon
>> >+ updated code to make it more aligned with drm-xe-next.
>> >3. I'll restart the review on rev2, while we agree to keep the
>> >drm-xe-next mostly aligned with the review branch until the review is
>> >over.
>>
>> mostly agree, but need some clarifications below.
>>
>> >
>> >>
>> >>  From what I talked with Rodrigo before, we'd actually discuss and agree
>> >> about things that needed to be changed/fixed, particularly on the design
>> >> and interface of the driver (with drm subsystem and with userspace).
>> >> Line by line review with non-critical things would then become gitlab
>> >> issues, like when Matt Roper went through a similar line by line
>> >> review and Rodrigo created a bunch of gitlab issues that are being
>> >> solved in drm-xe-next.
>> >>
>> >> >Therefore, I think we need to agree on some method that won't burn me
>> >> >out and cause me to tell Dave & Daniel I'm giving up on what they
>> >> >asked me to do. One way is to follow the rule above, but if you still
>> >> >disagree with this, I'm open to hearing other suggestions on how to
>> >> >enable a proper review in a timely manner that won't cause me to pull
>> >> >my hair out.
>> >> >
>> >> >In that context, I feel your "Ignore the not moving target goal"
>> >> >statement to Francois was inappropriate. We need to have an agreement,
>> >> >you can't decide that on your own.
>> >>
>> >> What am I deciding on my own and why was that inappropriate?  I went
>> >> back to read again what I wrote to check if it was badly phrased, but I
>> >> don't see it that way. He asked my opinion on a different method, which
>> >> you are also asking when you say "I'm open to hearing other suggestions
>> >> on how to enable a proper review in a timely manner that won't cause me
>> >> to pull my hair out". If you hear and disagree, I'm totally fine with
>> >> it, but asking for it and then saying it's inappropriate to disagree
>> >> with the premise seems odd.
>> >I read it as something else but if you meant it only as a suggestion,
>> >then I take my words back.
>> >>
>> >> I went on and explained *why*, saying that the moving base is already
>> >> there and IMO a better method would be to accept the moving base, with a
>> >> different review method. And if you look at the proposal below, I'm
>> >> actually removing the "moving base" factor between what's being reviewed
>> >> and where the rest of development is happening, CI is running, other
>> >> review comments are being handled, etc.
>> >>
>> >> What I'm currently seeing and I don't agree with:
>> >>
>> >> - Commits are being pushed to a xe-revN branch bypassing code review
>> >Correct, this should not happen. That's why Francois sent them to the
>> >ml and I thought it was sufficient.
>> >>
>> >> - Since CI is running on drm-xe-next, it's also bypassing CI. I was
>> >>    part of enough upstream submissions to know our ability to break
>> >>    things when handling code review comments, which is only noticed later
>> >>    when the rest is rebased on top and CI is running again
>> >I agree, but unless you can trigger CI on specific branch, I think
>> >your only option is to run CI on drm-xe-next after it is rebased over
>> >the final xe-rev branch (after the review is over).
>> >>
>> >> - drm-xe-next and xe-revN are not on the same baseline. If they were,
>> >>    then comparing both would be trivial and we'd probably not have
>> >>    this discussion. Question here on your process: currently xe-rev
>> >>    is on top of drm-next-2023-04-27, which is on top of v6.3-rc4.
>> >>    Is your intention that fixes (to only your review commens) are
>> >>    accumulated  on xe-rev* and then propose this to be merged to drm-next
>> >>    when that is finished, without any rebase?
>> >I thought you would rebase drm-next-xe over the final xe-rev branch.
>> >Then just make sure all those commits on top are passing CI after the rebase.
>> >>
>> >> - changes to "the original submission" that from my pov some are good,
>> >>    some would better be discussed and some that are not critical
>> >>    taking precedence over others that should really be there. And that
>> >>    is happening because there is this disconnect between drm-xe-next and
>> >>    xe-rev as per above.
>> >That's why I don't mind if for xe-rev2, we make it aligned with a
>> >newer baseline that matches drm-xe-next.
>> >I'll continue the review on that branch when it's done.
>> >Then, after the review is over, rebase drm-xe-next over xe-revLast,
>> >which shouldn't be too hard hopefully.
>> >
>> >wdyt ?
>>
>> Let me first start saying that when I saw your 1/6 in your second batch
>> I thought it was 1 out of 6 and you would send each of them on
>> Thursdays, leading to 6 weeks from a state that is already 250 behind
>> drm-xe-next. I was pointed out today that that was actually the date.
>> My bad.
>>
>> To move forward I think we need to clarify and agree on a few things:
>>
>> 1. How are you splitting the code review? I know you are reviewing "the
>> final state" rather than patch by patch. But what I'm looking for is to
>> know if you split the driver in 2, 3, 10 parts/files and we should
>> expect 2, 3, 10 batches of reviews or what? Depending on if we are
>> looking at 2 weeks, 2 month or a year, we may need to adapt the workflow
>> differently. If it's 1 week we could simply halt any change at all.
>> If it's 2 months, then we may have some problems to figure out the
>> workflow
>I think we can finish this in 3-4 weeks (3-4 sets of additional comments).
>>
>> 2. I will quote what you said:
>>
>> >What is critical imo, is to have confidence that this driver is not
>> >doing something horrendously wrong, like abstracting entire kernel
>> >layers, or putting up a broken uapi, or incorrectly using kernel API,
>> >or whatever.
>>
>> I completely agree with that. Isn't this the original ask from drm
>> maintainers? However reading the review comments, the critical ones
>> related to the above paragraph seem to be swamped with other
>> cleanup-related. Some of those cleanups already happened or we moved in
>> another direction  with drm-xe-next.
>Yes, but I thought that if I'm already passing over the code, why
>ignore these issues...
>I was already documenting errors so I preferred to mention everything.
>>
>> Considering that as the critical part, what about the changes that come
>> due to others' feedback that also fall into that category?  Examples:
>> the uapi break we needed to do so we are not completely imcompatible
>> with 32b applications?  Or for example other patches changing jiffies
>> to nsec in the uapi. Wouldn't it be sensible to include those in the
>> next xe-revN?
>Yes, but again, I'm pretty sure you will continue to figure out stuff
>as we go along, and we don't want to re-start the review each time.
>Let's set a new baseline, do a concentrated 3-4 weeks review on it. We
>will fix all the issues in that review and that will be good enough.
>Then, any patches above it will go through the regular upstream flow.
>>
>> With that in mind, what about this?
>>
>> 1. Halting the review for now.
>>
>> 2. I will tag the current drm-xe-next, just before the point
>>     in which we add display. This would give the same baseline between
>>     drm-xe-next and xe-rev2 tag.
>>
>> 3. We don't modify anymore the code below that point. If there are some
>>     critical changes that we'd rather have squashed below that point,
>>     then we just accumulate on top of that tag. So from your point of
>>     view, the next xe-rev3 tag won't have those changes together with
>>     others
>>
>> 4. No patch is merged/pushed directly to a xe-revX branch - xe-revX
>>     would be actually tags. Instead, the patch is based on drm-xe-next
>>     to get CI passing and having a solution that is agreed upon.
>>     When you're done with xe-rev2 and we send a xe-rev3, those patches can
>>     be moved so you actually get those changes first/only. Again, depending
>>     on the timeline we are talking about, it may be simply done by
>>     halting any other change. If it's a long time, then we may need to
>>     rebase and move commits around before giving you a xe-rev3 tag.
>>
>Sounds like a good plan.
>
>> 5. For the questions you made in the review comments, do you want devs
>>     to answer inline like I've been doing? Or to create gitlab issues like
>>     Rodrigo suggested when this process started?
>I think inline is fine. I think we should open gitlab issues for
>points raising from this review only for extreme cases where they
>can't be fixed now for some reason.
>>
>> 6. (only if we are talking a long timeline, to be agreed on a case by
>>     case basis):  for intrusive changes that don't fall into the
>>     critical classification you gave above, may we agree on handling
>>     those on top of drm-xe-next, without moving them before other
>>     things?
>I think 3-4 weeks is not a long time, so I hope this point can be
>disregarded right now.

Ok, let's do that then. A new tag is pushed which should contain
everything we have until now except display. Please take a look at
https://gitlab.freedesktop.org/drm/xe/kernel.git xe-rev2

thanks
Lucas De Marchi
