Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68DA8EE57E0
	for <intel-xe@archiver.kernel.org>; Fri,  8 Sep 2023 08:18:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34B5610E881;
	Fri,  8 Sep 2023 08:18:10 +0000 (UTC)
Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C119B10E34F
 for <intel-xe@lists.freedesktop.org>; Fri,  8 Sep 2023 08:18:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1694161088; x=1725697088;
 h=mime-version:content-transfer-encoding:in-reply-to:
 references:cc:to:from:subject:message-id:date;
 bh=ZmDDq6xo4hgz/vxMiVwB9RDfI7niSnBoNPB5brmhSL8=;
 b=aezrnKNYk6qk7heErY9DDs+EOO4XuHjV58LURfHgmMLR4fcJesqV/1Ax
 vXDREv2hQWIR/myoWMtUrPH0MXm5Eo4XB+Mk9TRi0kIkjNjHTmvS2lpBU
 n/ZmIKBewl92MrQSgb2QRs9noDfaV5XNy8/9PpKRy3ri5/fiR41M+6XI+
 HHzZ200strnZ6ozFby43aA7qhSlVt/Rxk6J7rECSMfCCXM3VJe/bqBf6O
 BYfK5AcDFgh85HgOV9efxVUej9cD4XYcXAcnc3HVK3h1O43NlanNZ0c3M
 gMQP+IwQW6omval682UkLmQy5Od0Nc0hEuehy3CN3bx6Zrvn7PqsaGTaN A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="367856135"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="367856135"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 01:17:41 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10826"; a="989165775"
X-IronPort-AV: E=Sophos;i="6.02,236,1688454000"; d="scan'208";a="989165775"
Received: from endaclin-mobl1.ger.corp.intel.com (HELO localhost)
 ([10.252.24.175])
 by fmsmga006-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 08 Sep 2023 01:17:37 -0700
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <ZPpEkR47cLTO9NH0@intel.com>
References: <20230904123605.3255946-1-mika.kuoppala@linux.intel.com>
 <20230904144644.3259148-1-mika.kuoppala@linux.intel.com>
 <ZPi0gnYZlMk6mD2d@intel.com> <87zg1yay7a.fsf@mkuoppal-desk>
 <ZPpEkR47cLTO9NH0@intel.com>
To: Mika Kuoppala <mika.kuoppala@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, Thomas Hellström <thomas.hellstrom@linux.intel.com>, Faith Ekstrand <faith@gfxstrand.net>
From: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Message-ID: <169416105435.18944.2863510374468750259@jlahtine-mobl.ger.corp.intel.com>
User-Agent: alot/0.8.1
Date: Fri, 08 Sep 2023 11:17:34 +0300
Subject: Re: [Intel-xe] [PATCH] drm/xe: Extend drm_xe_vm_bind_op
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
Cc: Francois Dugast <francois.dugast@intel.com>,
 Lucas De Marchi <lucas.demarchi@intel.com>, intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

(+ Thomas who this was discussed with and Faith for original reasoning for =
op[])

Top-posting to discuss the alternative of having a single VM_BIND per
operation instead of array of operations.

Thomas is working on the feature of returning an error from the middle
of the op[] array to the userspace and unrolling the operations plus -EINTR
handling became under discussion.

With the addition of debug metadata per op (aka. per vma) the unrolling and
-EINTR handling will become further complex.

Would there be a measurable performance issue if we would simplify and
just to do VM_BIND(op)[] instead of VM_BIND(op[])?

Unrolling would be much easier and there would be no need for complex error
returning scheme. The GPUVA operation may still split into maximum 3 separa=
te
ops but the rest of the unrolling like metadata would need to be only
dealt with once.

Regards, Joonas

Quoting Rodrigo Vivi (2023-09-08 00:45:53)
> On Thu, Sep 07, 2023 at 04:51:21PM +0300, Mika Kuoppala wrote:
> > Rodrigo Vivi <rodrigo.vivi@intel.com> writes:
> >=20
> > > On Mon, Sep 04, 2023 at 05:46:44PM +0300, Mika Kuoppala wrote:
> > >> The bind api is extensible but for a single bind op, there
> > >> is not a mechanism to extend. Add extensions field to
> > >> struct drm_xe_vm_bind_op.
> > >
> > > But why would you want to extend the operation?
> > > Except for the destroy ones, every ioctl itself is extensible.
> > >
> > > So, DRM_IOCTL_XE_VM_BIND is extensible. Why would we need to get
> > > prepared to extend the operations themselves? And if we extend
> > > the operation, what to do with the extension at the ioctl level?
> > > which one has precedence? how to organize that?
> > >
> >=20
> > The intent is to pass debugger metadata as part of particular
> > vm bind operation. For example on MAP, we could associate
> > ELF/ISA (relevant parts) as metadata for this bind range.
> >=20
> > So in vector of binds, we want to tag specific one map (in between)
> > with debugger metadata.
> >=20
> > With extending the XE_VM_BIND itself, this could be possible too
> > but would then need to deliver index into the vector instead
> > of carrying the metadata as part of per operation.
> > As atleast in this example, the extension is heavily tied
> > into particular OP (map).
> >=20
> > I take that you mean precedence of VM_BIND vs bind op?
> > Excellent question and I dont know all the use cases the
> > vm_bind have to cater. So I can only refer to example above,
> > VM_BIND extensions would be only in scope to all operations
> > and vm_bind_op extensions would be tightly coupled to per
> > operation only.
>=20
> So, maybe we should do the same union that we do with the
> ops themselves and make the extension also an array of num_binds ?
>=20
> >=20
> > Thanks for feedback!
> > -Mika
> >=20
> > >>=20
> > >> Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
> > >> Cc: Matthew Brost <matthew.brost@intel.com>
> > >> Cc: Lucas De Marchi <lucas.demarchi@intel.com>
> > >> Cc: Francois Dugast <francois.dugast@intel.com>
> > >> Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
> > >> Cc: Dominik Grzegorzek <dominik.grzegorzek@intel.com>
> > >> Signed-off-by: Mika Kuoppala <mika.kuoppala@linux.intel.com>
> > >> ---
> > >>  include/uapi/drm/xe_drm.h | 3 +++
> > >>  1 file changed, 3 insertions(+)
> > >>=20
> > >> diff --git a/include/uapi/drm/xe_drm.h b/include/uapi/drm/xe_drm.h
> > >> index 86f16d50e9cc..5c6c86f5e5fc 100644
> > >> --- a/include/uapi/drm/xe_drm.h
> > >> +++ b/include/uapi/drm/xe_drm.h
> > >> @@ -552,6 +552,9 @@ struct drm_xe_vm_destroy {
> > >>  };
> > >> =20
> > >>  struct drm_xe_vm_bind_op {
> > >> +  /** @extensions: Pointer to the first extension struct, if any */
> > >> +  __u64 extensions;
> > >> +
> > >>    /**
> > >>     * @obj: GEM object to operate on, MBZ for MAP_USERPTR, MBZ for U=
NMAP
> > >>     */
> > >> --=20
> > >> 2.34.1
> > >>=20
